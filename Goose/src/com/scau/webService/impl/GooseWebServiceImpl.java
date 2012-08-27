package com.scau.webService.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;

import org.hibernate.mapping.Value;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleGoose;
import com.scau.model.goose.TradeGoose;
import com.scau.model.webService.FarmWs;
import com.scau.model.webService.RetailerWs;
import com.scau.service.impl.comm.CommUserService;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.scau.webService.IGooseService;

public class GooseWebServiceImpl implements IGooseService{
	
	@WebMethod
	public boolean login(@WebParam(name="userName")String name, @WebParam(name="password")String password)  {
		
		CommUserService commUserService = (CommUserService)BeansUtil.get("commUserService");
		CommUser user = new CommUser();
		user.setUserName(name);
		user.setPassword(password);
		try {
			if(null != commUserService.checkUser(user)){
				//�ɹ���¼
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return false;
		}
		return false;
	}

	@WebMethod
	public List<FarmWs> getFarmList() {
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		List<Farm> farmList = farmService.findByCondition("from com.scau.model.goose.Farm f order by f.name");
		
		List<FarmWs> resultList = new ArrayList<FarmWs>();
		for (Farm farm : farmList) {
			FarmWs farmWs = new FarmWs();
			farmWs.setId(farm.getId());
			farmWs.setFarmerId(farm.getFarmerId());
			farmWs.setName(farm.getName());
			
			resultList.add(farmWs);
		}
		return resultList;
	}

	@WebMethod
	public List<RetailerWs> getRetailerList() {
		RetailerService retailerService = (RetailerService) BeansUtil.get("retailerService");
		List<Retailer> retailerList =  retailerService.findByCondition("from com.scau.model.goose.Retailer r order by r.name asc ");
		
		List<RetailerWs> resultList = new ArrayList<RetailerWs>();
		for (Retailer retailer : retailerList) {
			RetailerWs r = new RetailerWs();
			r.setId(retailer.getId());
			r.setName(retailer.getName());
			
			resultList.add(r);
		}
		return resultList;
	}

	@WebMethod
	public int addReceiveGoose(@WebParam(name="farmId")long farmId, @WebParam(name="gooseRingList")ArrayList<String> gooseList ,@WebParam(name="comments")String comments) {
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
		try{
			Farm farm = new Farm();
			farm.setId(farmId);
			farm = farmService.get(farm);//获取农场实体
			ReceiveGoose receiveGoose = new ReceiveGoose();
			receiveGoose.setFarmId(farm.getId());
			receiveGoose.setAmount(gooseList.size());
			receiveGoose.setComments(comments);
			receiveGoose.setReceiveDate(new Date(new java.util.Date().getTime()));
			receiveGooseService.add(receiveGoose);//添加一个鹅苗交付批次
			receiveGoose = receiveGooseService.get(receiveGoose);
			long receiveGooseId = receiveGoose.getId();//获得新加入到数据库的 receiveGoose 的id
			List<Goose> gooses = new ArrayList<Goose>();
			// 脚环号入数据库
			for (String ringId : gooseList) {
				Goose g = new Goose();
				g.setRingId(ringId);
				g.setReceiveId(receiveGooseId);
				g.setIsValid(1);//设置脚环有效
				gooses.add(g);
			}
			gooseService.batchAdd(gooses);//批量写入数据库
			
		}catch (Exception e) {
			return 1;//操作出错
		}
		return 0;
	}

	@WebMethod
	public int addTradeGoose(@WebParam(name="farmId")long farmId, @WebParam(name="gooseRingList")ArrayList<String> gooseList 
			,@WebParam(name="totalWeight")Double totalWeight, @WebParam(name="unitPrice")Double unitPrice,@WebParam(name="comments")String comments) {
		
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		TradeGooseService tradeGooseService = (TradeGooseService) BeansUtil.get("tradeGooseService");
		try {

			TradeGoose tradeGoose = new TradeGoose();
			tradeGoose.setAmount(Long.valueOf(gooseList.size()));
			tradeGoose.setComments(comments);
			tradeGoose.setFarmId(farmId);
			tradeGoose.setTotalWeight(totalWeight);
			tradeGoose.setTradeDate(new Date(new java.util.Date().getTime()));
			tradeGoose.setUnitPrice(unitPrice);
			tradeGooseService.add(tradeGoose);
			
			tradeGoose = tradeGooseService.get(tradeGoose);// 获得新添加的tradeGoose的id
			long tradeId = tradeGoose.getId();
			for (String ringId : gooseList) {
				Goose g = new Goose();
				
				g.setRingId(ringId);
				g = gooseService.get(g);//查出该个脚环号的goose，写上tradeId
				g.setTradeId(tradeId);
				gooseService.update(g);
			}
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}

	@WebMethod
	public int addSaleGoose(@WebParam(name="retailerId")long retailerId , @WebParam(name="gooseRingList")ArrayList<String> gooseList,
			@WebParam(name="totalWeight")Double totalWeight , @WebParam(name="unitPrice")Double unitPrice ,
			@WebParam(name="comments")String comments) {
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
		
		try {
			
			SaleGoose saleGoose = new SaleGoose();
			saleGoose.setAmount(Long.valueOf(gooseList.size()));
			saleGoose.setComments(comments);
			saleGoose.setRetailerId(retailerId);
			saleGoose.setSaleDate(new Date(new java.util.Date().getTime()));
			saleGoose.setTotalWeight(totalWeight);
			saleGoose.setUnitPrice(unitPrice);
			saleGooseService.add(saleGoose);//完成添加一条销售记录
			
			saleGoose = saleGooseService.get(saleGoose);
			long saleId = saleGoose.getId();
			for (String ringId : gooseList) {
				// 为脚环写上 saleGoose的 id号
				Goose g = new Goose();
				g.setRingId(ringId);
				
				g = gooseService.get(g);//查出该个脚环号的goose，写上tradeId
				g.setSaleId(saleId);
				gooseService.update(g);
			}
		} catch (Exception e) {
			return 1;//操作出错，返回1
		}
		return 0;
	}

	@WebMethod
	public int authenticate(@WebParam(name="gooseRing")String gooseId) {
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		Goose goose = new Goose();
		goose.setRingId(gooseId);
		if(null != gooseService.get(goose))
			return 1;
		
		return 0;
	}

	@WebMethod
	public int setInvalid(@WebParam(name="gooseRing")String gooseId) {
		try {
			GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
			Goose goose = new Goose();
			goose.setRingId(gooseId);
			goose = gooseService.get(goose);
			goose.setIsValid(0);
			gooseService.update(goose);//完成销号操作
		} catch (Exception e) {
			return 1;//操作出错
		}
		
		return 0;
	}

	

	

}
