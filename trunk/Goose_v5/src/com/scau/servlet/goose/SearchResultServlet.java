package com.scau.servlet.goose;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.ReceiveGoose;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleGoose;
import com.scau.model.goose.TradeGoose;
import com.scau.model.webService.ReceiveGooseWs;
import com.scau.service.impl.goose.BuyGoodViewService;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.TradeGoodViewService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.BuyGoodView;
import com.scau.view.goose.TradeGoodView;
import com.scau.webService.impl.GooseWebServiceImpl;

/** 用于搜索鹅只的鹅苗交付，成品鹅收购，销售记录
 * @author jianhao
 *
 */
public class SearchResultServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8"); 
		Farm farm = new Farm();
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		Farmer farmer = new Farmer();
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		PrintWriter out = response.getWriter();
		
		try {
			
			String searchType = request.getParameter("searchType");
			StringBuffer result = new StringBuffer();
			Date fromDate = new Date(-1) ;//默认 1970-01-01
			Date toDate = new Date(new java.util.Date().getTime());//默认今天
			long fromNum = 0,toNum = 0;
			
			if(null != request.getParameter("fromDate") && null != request.getParameter("toDate")){
				try {
					fromDate = Date.valueOf(request.getParameter("fromDate"));
					toDate = Date.valueOf(request.getParameter("toDate"));
				} catch (Exception e) {
					out.print("<font color=\"red\">日期格式输入有误，请重新输入！</font>");
					e.printStackTrace();
				}
			}
			
			if(null != request.getParameter("fromNum") && null != request.getParameter("toNum")){
				fromNum = Long.parseLong(request.getParameter("fromNum"));
				toNum = Long.parseLong(request.getParameter("toNum"));
			}
			
			if(searchType.equals("receiveGoose")){
				//组装Hql语句
				String queryString = "select r from com.scau.model.goose.ReceiveGoose r where r.receiveDate " + 
									"between '"+ fromDate +"' and '"+ toDate + "'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
			
				ReceiveGooseService receiveGooseService = (ReceiveGooseService)BeansUtil.get("receiveGooseService");
				List<ReceiveGoose> resultList = receiveGooseService.findByCondition(queryString);
				
				result.append("<tr><td>序号</td><td>日期</td><td>数量</td><td width=\"15%\">"+
								"备注</td><td width=\"40%\">操作</td></tr>");
				int i = 1;
				for (ReceiveGoose receiveGoose : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + receiveGoose.getReceiveDate() + "</td><td>" + receiveGoose.getAmount()+ "</td><td>" +
							(receiveGoose.getComments() == null ? "":receiveGoose.getComments()) + "&nbsp;</td><td >" + getFarmerAndFarmInfo(receiveGoose.getFarmId()) + "</td></tr>");
				}
				out.print(result);
				
			}else if(searchType.equals("tradeGoose")){
				//组装Hql语句
				String queryString = "select r from com.scau.model.goose.TradeGoose r where r.tradeDate "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				
				TradeGooseService tradeGooseService = (TradeGooseService) BeansUtil.get("tradeGooseService");
				List<TradeGoose> resultList = tradeGooseService.findByCondition(queryString);
				
				result.append("<tr><td>序号</td><td>日期</td><td>数量</td><td>单价</td><td>总重量</td><td>金额合计</td><td width=\"15%\">"+
						"备注</td><td width=\"40%\">相关信息</td></tr>");
				
				int i = 1;
				for (TradeGoose tradeGoose : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + tradeGoose.getTradeDate() + "</td><td>" + tradeGoose.getAmount()+ "</td><td>" + tradeGoose.getUnitPrice() + 
							"</td><td>" + tradeGoose.getTotalWeight()+ "</td><td>" + (tradeGoose.getTotalWeight()*tradeGoose.getUnitPrice())+ "</td><td>" 
									+ (tradeGoose.getComments() == null ?"":tradeGoose.getComments()) + "&nbsp;</td><td >" + 
							getFarmerAndFarmInfo(tradeGoose.getFarmId()) + "</td></tr>");
				}
				out.print(result);
				
			}
			else if(searchType.equals("saleGoose")){
				String queryString = "select r from com.scau.model.goose.SaleGoose r where r.saleDate "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				
				SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
				List<SaleGoose> resultList = saleGooseService.findByCondition(queryString);
				
				result.append("<tr><td>序号</td><td>日期</td><td>数量</td><td>单价</td><td>总重量</td><td>金额合计</td><td width=\"15%\">"+
						"备注</td><td width=\"40%\">相关信息</td></tr>");
				int i = 1;
				for (SaleGoose saleGoose : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + saleGoose.getSaleDate() + "</td><td>" + saleGoose.getAmount()+ "</td><td>" + saleGoose.getUnitPrice()+ "</td><td>" + 
							saleGoose.getTotalWeight()+ "</td><td>" + (saleGoose.getTotalWeight()*saleGoose.getUnitPrice())+ "</td><td>" + 
							(saleGoose.getComments() == null ?"":saleGoose.getComments()) + "&nbsp;</td><td >" + getRetailerInfo(saleGoose.getRetailerId()) + "</td></tr>");
				}
				out.print(result);
			}
			else if(searchType.equals("buyGood")){
				//组装Hql语句
				String queryString = "select r from com.scau.view.goose.BuyGoodView r where r.date "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				
				BuyGoodViewService buyGoodViewService = (BuyGoodViewService) BeansUtil.get("buyGoodViewService");
				List<BuyGoodView> resultList = buyGoodViewService.findByCondition(queryString);
				
				result.append("<tr><td>序号</td><td>资源名称</td><td>供应商</td><td>产地</td><td>批号</td><td>单价</td><td>数量</td><td>总价</td>" + 
				"<td>时间</td><td width=\"15%\">备注</td>");
				int i =1;
				for (BuyGoodView buyGoodView : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + buyGoodView.getGoodName() + "</td><td>" + buyGoodView.getSupplierName() + "</td><td>" + buyGoodView.getOrigin()+ "</td><td>" 
							+ buyGoodView.getBatchNum()+ "</td><td>"+ buyGoodView.getUnitPrice() +"</td><td>"+ buyGoodView.getAmount() + "</td><td>"+ buyGoodView.getAmount() * buyGoodView.getUnitPrice() +
							"</td><td>"+ buyGoodView.getDate() +"</td><td>"+ buyGoodView.getComments() +"&nbsp;</td></tr>");
						}
				
				out.print(result);
			}
			else if(searchType.equals("tradeGood")){
				//组装Hql语句
				String queryString = "select r from com.scau.view.goose.TradeGoodView r where r.tradeDate "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				
				TradeGoodViewService tradeGoodViewService = (TradeGoodViewService) BeansUtil.get("tradeGoodViewService");
				List<TradeGoodView> resultList = tradeGoodViewService.findByCondition(queryString);
				
				result.append("<tr><td>序号</td><td>资源名称</td><td>农户</td><td>单价</td><td>数量</td><td>单位</td><td>总价</td>" + 
						"<td>时间</td><td width=\"15%\">备注</td>");
				int i = 1;
				for (TradeGoodView tradeGoodView : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + tradeGoodView.getGoodName() + "</td><td>" + tradeGoodView.getFarmerName() + 
							"</td><td>"+ tradeGoodView.getUnitPrice() +"</td><td>"+ tradeGoodView.getAmount() + "</td><td>"+ tradeGoodView.getGoodUnit() +"</td><td>"+ tradeGoodView.getAmount() * tradeGoodView.getUnitPrice() +
							"</td><td>"+ tradeGoodView.getTradeDate() +"</td><td>"+ tradeGoodView.getComments() +"&nbsp;</td></tr>");
				}
				
				out.print(result);
				
			}
			else if(searchType.equals("gooseRingId")){
				String ringId = request.getParameter("ringId").trim();//去除误输入的空格
				if(null != ringId){
					GooseWebServiceImpl gooseWebService = new GooseWebServiceImpl();
					ReceiveGooseWs receiveGooseWs = gooseWebService.getReceiveInfo(ringId);
					if(null != receiveGooseWs){
						result.append("<tr><td>所属农场主</td><td>电话</td><td>所属农场</td><td>农场地址</td><td>交付农场日期</td><td>该批次交付数量</td><td>备注</td></tr>"+
								"<tr><td>" + receiveGooseWs.getFarmerName() + "</td><td>" + receiveGooseWs.getPhone()+ "</td><td>" +receiveGooseWs.getFarmName() + 
								"</td><td>" +receiveGooseWs.getAddress() + "</td><td>" + receiveGooseWs.getReceiveDate()+ "</td><td>" + receiveGooseWs.getAmount()+ "</td><td>" + 
								(receiveGooseWs.getComments() == null?"":receiveGooseWs.getComments() )+ "</td></tr>");
						out.print(result);
					}
					else out.print("查无此脚环，请确认后重新输入！");
				}
				
			}
			else{
				out.print("暂无相关资料");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<font color=\"red\">查询相关资料出错!</font>");
		}
	}

	/**获得农场和农户信息
	 * */
	public String getFarmerAndFarmInfo(long farmId){
		Farm farm = new Farm();
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		Farmer farmer = new Farmer();
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		
		farm.setId(farmId);
		farm = farmService.get(farm);
		farmer.setId(farm.getFarmerId());
		farmer = farmerService.get(farmer);
		String farmMsg = "农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:"+ farmer.getPhone() + "&nbsp;&nbsp;农场名："+ farm.getName() + "&nbsp;&nbsp;地址:"
						+ farm.getAddress();
		return farmMsg;
	}
	
	/**获得销售商信息
	 * */
	public String getRetailerInfo(long retailerId){
		RetailerService retailerService = (RetailerService)BeansUtil.get("retailerService");
		Retailer retailer = new Retailer();
		retailer.setId(retailerId);
		retailer = retailerService.get(retailer);
		String msg = "销售商名:" + retailer.getName() + "&nbsp;&nbsp;联系电话:" + retailer.getPhone();
		return msg;
	}
	
	public SearchResultServlet() {
		super();
	}

	
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
