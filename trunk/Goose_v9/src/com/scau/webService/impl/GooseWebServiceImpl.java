package com.scau.webService.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;

import org.springframework.transaction.annotation.Transactional;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.DeadGoose;
import com.scau.model.goose.DeadReason;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleGoose;
import com.scau.model.goose.TradeGoose;
import com.scau.model.webService.FarmWs;
import com.scau.model.webService.ReceiveGooseWs;
import com.scau.model.webService.RetailerWs;
import com.scau.model.webService.SaleGooseWs;
import com.scau.service.impl.comm.CommUserService;
import com.scau.service.impl.goose.DeadGooseService;
import com.scau.service.impl.goose.DeadReasonService;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.scau.webService.IGooseService;

public class GooseWebServiceImpl implements IGooseService{
	
	private GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
	
	@WebMethod
	public boolean login(@WebParam(name="userName")String name, @WebParam(name="password")String password)  {
		
		CommUserService commUserService = (CommUserService)BeansUtil.get("commUserService");
		CommUser user = new CommUser();
		user.setUserName(name);
		user.setPassword(password);
		try {
			if(null != commUserService.checkUser(user)){
				//成功登录
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
		//获取已经签约的农户
		List<Farm> farmList = farmService.findByCondition("from com.scau.model.goose.Farm f where f.signDate !=null order by f.name");
		
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
	@Transactional
	public int addReceiveGoose(@WebParam(name="farmId")long farmId, @WebParam(name="gooseRingList")ArrayList<String> gooseList ,@WebParam(name="comments")String comments) {
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		
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
				if(!ringId.equals("")){
					Goose g = new Goose();
					g.setRingId(ringId);
					g.setReceiveId(receiveGooseId);
					g.setIsValid(1);//设置脚环有效，正在养殖状态
					gooses.add(g);
				}
			}
			gooseService.batchAdd(gooses);//批量写入数据库
			
		}catch (Exception e) {
			e.printStackTrace();
			return 1;//操作出错
		}
		return 0;
	}

	@WebMethod
	@Transactional
	public int addTradeGoose(@WebParam(name="farmId")long farmId, @WebParam(name="gooseRingList")ArrayList<String> gooseList 
			,@WebParam(name="totalWeight")Double totalWeight, @WebParam(name="unitPrice")Double unitPrice,@WebParam(name="comments")String comments) {
		
	
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
				if(!ringId.equals("")){
					Goose g = new Goose();
					g.setRingId(ringId);
					g = gooseService.get(g);//查出该个脚环号的goose，写上tradeId
					g.setTradeId(tradeId);
					
					gooseService.update(g);
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
		return 0;
	}

	@WebMethod
	@Transactional
	public int addSaleGoose(@WebParam(name="retailerId")long retailerId , @WebParam(name="gooseRingList")ArrayList<String> gooseList,
			@WebParam(name="totalWeight")Double totalWeight , @WebParam(name="unitPrice")Double unitPrice ,
			@WebParam(name="comments")String comments) {
		
		SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
		
		try {
			
			SaleGoose saleGoose = new SaleGoose();
			saleGoose.setAmount(Long.valueOf(gooseList.size()));
			saleGoose.setComments(comments);
			saleGoose.setRetailerId(retailerId);
			saleGoose.setSaleDate(new Date(new java.util.Date().getTime()));
			saleGoose.setTotalWeight(totalWeight);
			saleGoose.setUnitPrice(unitPrice);
			saleGoose.setTotalValue(unitPrice * totalWeight);//添加销售的总金额
			saleGooseService.add(saleGoose);//完成添加一条销售记录
			
			saleGoose = saleGooseService.get(saleGoose);
			long saleId = saleGoose.getId();
			for (String ringId : gooseList) {
				// 为脚环写上 saleGoose的 id号
				if(!ringId.equals("")){
					Goose g = new Goose();  
					g.setRingId(ringId);
					
					g = gooseService.get(g);//查出该个脚环号的goose，写上saleId
					g.setSaleId(saleId);
					g.setIsValid(2);//设置鹅只状态为已出售
					gooseService.update(g);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 1;//操作出错，返回1
		}
		return 0;
	}

	
	@WebMethod
	@Transactional
	public int setInvalid(@WebParam(name="gooseRing")String gooseId) {
		try {
			Goose goose = new Goose();
			goose.setRingId(gooseId);
			goose = gooseService.get(goose);//找到那个鹅只的记录
			
			goose.setIsValid(0);//设置鹅只状态为死亡
				
			gooseService.update(goose);//完成销号操作
		} catch (Exception e) {
			e.printStackTrace();
			return 1;//操作出错
		}
		
		return 0;
	}

	@WebMethod
	public ReceiveGooseWs getReceiveInfo(String gooseId) {
		try {
		
			ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
			FarmService farmService = (FarmService) BeansUtil.get("farmService");
			FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
			
			Goose goose = new Goose();
			goose.setRingId(gooseId);
			goose = gooseService.get(goose);
			
			ReceiveGoose rg = new ReceiveGoose();//获得所属鹅苗接收批次信息
			rg.setId(goose.getReceiveId());
			rg = receiveGooseService.get(rg);
			
			Farm farm = new Farm();
			farm.setId(rg.getFarmId());
			farm = farmService.get(farm);//获得所属农场信息
			
			Farmer farmer = new Farmer();
			farmer.setId(farm.getFarmerId());
			farmer  = farmerService.get(farmer);//获得所属农户信息
			
			//装入信息
			ReceiveGooseWs receiveGooseWs = new ReceiveGooseWs();
			receiveGooseWs.setAddress(farm.getAddress());
			receiveGooseWs.setAmount(rg.getAmount());
			receiveGooseWs.setComments(rg.getComments());
			receiveGooseWs.setFarmerName(farmer.getName());
			receiveGooseWs.setFarmName(farm.getName());
			receiveGooseWs.setPhone(farmer.getPhone());
			receiveGooseWs.setReceiveDate(rg.getReceiveDate().toString());
			
			return receiveGooseWs;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;//操作出错
		}
	
	}

	@Override
	@WebMethod
	public SaleGooseWs getSaleGooseInfo(String gooseId) {
		try {
			Goose g = new Goose();
			g.setRingId(gooseId);
			g = gooseService.get(g);
			if(null == g.getSaleId() || 2 !=g.getIsValid()){
				return null;
			}else{
				SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
				SaleGoose saleGoose = saleGooseService.get(new SaleGoose(), g.getSaleId());
				RetailerService retailerService = (RetailerService) BeansUtil.get("retailerService");
				Retailer retailer = retailerService.get(new Retailer(), saleGoose.getRetailerId());
				
				SaleGooseWs saleGooseWs = new SaleGooseWs();
				saleGooseWs.setRetailerId(retailer.getId());
				saleGooseWs.setAddress(retailer.getAddress());
				saleGooseWs.setAmount(saleGoose.getAmount());
				saleGooseWs.setComments(saleGoose.getComments());
				saleGooseWs.setPhone(retailer.getPhone());
				saleGooseWs.setRetailerName(retailer.getName());
				saleGooseWs.setSaleDate(saleGoose.getSaleDate().toString());
				saleGooseWs.setTotalWeight(saleGoose.getTotalWeight());
				saleGooseWs.setUnitPrice(saleGoose.getUnitPrice());
				
				return saleGooseWs;

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@WebMethod
	@Transactional
	public int setDeadGoose(String gooseId, long deadReasonId) {
		try {
			DeadGooseService deadGooseService = (DeadGooseService) BeansUtil.get("deadGooseService");
			Goose goose = new Goose();
			goose.setRingId(gooseId);
			goose = gooseService.get(goose);//找到那个鹅只的记录
			if(null == goose.getIsValid() && 0 != goose.getIsValid()){
				goose.setIsValid(0);//设置鹅只状态为死亡
				//goose.setDeadDate(new Date(new java.util.Date().getTime()));
				//新建一条鹅只死亡信息
				DeadGoose deadGoose = new DeadGoose();
				deadGoose.setDeadDate(new Date(new java.util.Date().getTime()));
				deadGoose.setDeadReasonId(deadReasonId);// 暂定死亡原因id 为 1
				deadGoose.setGooseId(goose.getId());
				deadGooseService.add(deadGoose);//添加一条死亡鹅只记录
				gooseService.update(goose);//完成销号操作
			}
			else{
				return 1;//该只鹅已死，不可再设死亡记录
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 1;//操作出错
		}
		
		return 0;
	}

	@WebMethod
	@Transactional
	public List<DeadReason> getAllDeadReasons() {
		DeadReasonService deadReasonService = (DeadReasonService) BeansUtil.get("deadReasonService");
		return deadReasonService.listAll(new DeadReason());
	}


}
