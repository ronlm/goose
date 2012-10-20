package com.scau.servlet.goose;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

import com.scau.excelExport.ExportAppearOnMarket;
import com.scau.excelExport.ExportBuyGooseView;
import com.scau.excelExport.ExportDeadInfo;
import com.scau.excelExport.ExportFarmStock;
import com.scau.excelExport.ExportSearchRecord;
import com.scau.excelExport.ExportTradeGoodView;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.ReceiveGoose;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleGoose;
import com.scau.model.goose.TradeGoose;
import com.scau.service.impl.goose.BuyGoodViewService;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmStockService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.MarketService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.TradeGoodViewService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.BuyGoodView;
import com.scau.view.goose.TradeGoodView;
import com.scau.vo.goose.FarmStock;

/** 这个类是用于响应页面的导出excel表格的，根据从页面过来的参数type，指定表格数据的类型
 * 如存栏，农场死亡鹅只，鹅苗进场批次等
 * @author jianhao
 *
 */
public class ExportData extends HttpServlet {

	private FarmService farmService;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutputStream out = response.getOutputStream();
		response.setContentType("application/msexcel;charset=UTF-8");
		String type = request.getParameter("type");
		String today = (new java.sql.Date(new Date().getTime())).toString();
		String fileName ;
		StringBuffer result = new StringBuffer();
		Date fromDate = new Date(-1) ;//默认 1970-01-01
		Date toDate = new Date(new java.util.Date().getTime());//默认今天
		long fromNum = 0,toNum = 0;
		
		if(null != request.getParameter("fromDate") && null != request.getParameter("toDate")){
			try {
				fromDate = java.sql.Date.valueOf(request.getParameter("fromDate"));
				toDate = java.sql.Date.valueOf(request.getParameter("toDate"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(null != request.getParameter("fromNum") && null != request.getParameter("toNum")){
			fromNum = Long.parseLong(request.getParameter("fromNum"));
			toNum = Long.parseLong(request.getParameter("toNum"));
		}
		
		if(type.equals("market")){
			try {
				fileName = today + "日全部农场鹅只上市信息汇总.xls";
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				MarketService marketService = (MarketService) BeansUtil.get("marketService");
				ExportAppearOnMarket export = new ExportAppearOnMarket(fileName, marketService.getAppearOnMarketList());
				Workbook workbook = export.exportExcel();
				workbook.write(out);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (type.equals("farmStock")) {
			fileName = today + "日全部农场存栏汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			try {
				List<Farm> totalFarmList = farmService.list(new Farm());
				
				final CountDownLatch begin = new CountDownLatch(1);
				final CountDownLatch end = new CountDownLatch(totalFarmList.size());
				
				List<FarmStock> totalFarmStockList = new LinkedList<FarmStock>();
				FarmStockService farmStockService = new FarmStockService(totalFarmStockList, begin, end);
				ExportFarmStock export = new ExportFarmStock(fileName, farmStockService.getTotalFarmStockList());
				Workbook workbook =  export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if (type.equals("deadInfo")){
			int daysWithin = 10;
			// 取得要显示 的日期条件
			try {
				if (null != request.getParameter("daysWithin")) {
					daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
				} else if (null != request.getSession().getAttribute("daysWithin")) {
					daysWithin = (Integer) request.getSession().getAttribute("daysWithin");
				}
				fileName = today + "最近" + daysWithin + "日内全部农场鹅只死亡统计信息.xls";
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				ExportDeadInfo export = new ExportDeadInfo(fileName, farmService.getAllFarmDeadInfo(daysWithin));
				Workbook workbook = export.exportExcel();
				workbook.write(out);
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		} 
		else if (type.equals("receiveGoose")) {
			try {
				
			String queryString = "select r from com.scau.model.goose.ReceiveGoose r where r.receiveDate " + 
						"between '"+ fromDate +"' and '"+ toDate + "'";
			if(0 != fromNum && 0 != toNum){
				queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
			}
		
			ReceiveGooseService receiveGooseService = (ReceiveGooseService)BeansUtil.get("receiveGooseService");
			List<ReceiveGoose> resultList = receiveGooseService.findByCondition(queryString);
			
			List<String[]> contentList = new LinkedList<String[]>();
			for (ReceiveGoose receiveGoose : resultList) {
				List<String> content = new ArrayList<String>();
				content.add(receiveGoose.getReceiveDate().toString());
				content.addAll(sliptMsg(getFarmerAndFarmInfo(receiveGoose.getFarmId())));
				content.add(receiveGoose.getAmount().toString());
				content.add(receiveGoose.getComments());
				String[] temp = new String[content.size()];
				contentList.add(content.toArray(temp));
			}	
					
			fileName = "鹅苗进场信息汇总.xls";
			String[] titles = {"日期","农户","联系电话","农场","地址","数量","备注"};
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			ExportSearchRecord export = new ExportSearchRecord(fileName, contentList);
			export.setTitles(titles);
			Workbook workbook= export.exportExcel();
			workbook.write(out);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if (type.equals("tradeGoose")) {
			try {
				
				//导出成品鹅回购记录
				//组装Hql语句
				String queryString = "select r from com.scau.model.goose.TradeGoose r where r.tradeDate "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				NumberFormat f=NumberFormat.getInstance();  //创建一个格式化类f
				f.setMaximumFractionDigits(5);    //设置小数位的格式
				TradeGooseService tradeGooseService = (TradeGooseService) BeansUtil.get("tradeGooseService");
				List<TradeGoose> resultList = tradeGooseService.findByCondition(queryString);
				
				List<String[]> contentList = new LinkedList<String[]>();
				for (TradeGoose tradeGoose : resultList) {
					List<String> content = new ArrayList<String>();
					content.add(tradeGoose.getTradeDate().toString());
					content.addAll(sliptMsg(getFarmerAndFarmInfo(tradeGoose.getFarmId())));
					content.add(tradeGoose.getAmount().toString());
					content.add(tradeGoose.getUnitPrice().toString());
					content.add(tradeGoose.getTotalWeight().toString());
					content.add((f.format(tradeGoose.getTotalWeight() * tradeGoose.getUnitPrice())));
					content.add(tradeGoose.getComments());
					String[] temp = new String[content.size()];
					contentList.add(content.toArray(temp));
				}
				
				fileName = "成品鹅回购信息汇总.xls";
				String[] titles = {"日期","农户","联系电话","农场","地址","数量","单价","总量(重量或数量)","金额合计","备注"};
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				@SuppressWarnings("unchecked")
				ExportSearchRecord export = new ExportSearchRecord(fileName, contentList);
				export.setTitles(titles);
				Workbook workbook = export.exportExcel();
				workbook.write(out);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		else if (type.equals("saleGoose")) {
			try {
						
				//导出成品鹅出售记录
				String queryString = "select r from com.scau.model.goose.SaleGoose r where r.saleDate "
						+ "between '"+ fromDate + "' and '"+ toDate +"'";
				if(0 != fromNum && 0 != toNum){
					queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
				}
				
				SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
				List<SaleGoose> resultList = saleGooseService.findByCondition(queryString);
				
				List<String[]> contentList = new LinkedList<String[]>();
				int i = 1;
				for (SaleGoose saleGoose : resultList) {
					result.append("<tr><td>" + (i++) + "</td><td>" + saleGoose.getSaleDate() + "</td><td>" + saleGoose.getAmount()+ "</td><td>" + saleGoose.getUnitPrice()+ "</td><td>" + 
							saleGoose.getTotalWeight()+ "</td><td>" + (saleGoose.getTotalWeight()*saleGoose.getUnitPrice())+ "</td><td>" + 
							(saleGoose.getComments() == null ?"":saleGoose.getComments()) + "&nbsp;</td><td >" + getRetailerInfo(saleGoose.getRetailerId()) + "</td></tr>");
					List<String> content = new ArrayList<String>();
					content.add(saleGoose.getSaleDate().toString());
					content.addAll(sliptMsg(getRetailerInfo(saleGoose.getRetailerId())));
					content.add(saleGoose.getAmount().toString());
					content.add(saleGoose.getUnitPrice().toString());
					content.add(saleGoose.getTotalWeight().toString());
					content.add(saleGoose.getTotalValue().toString());
					content.add(saleGoose.getComments());
					String[] temp = new String[content.size()];
					contentList.add(content.toArray(temp));
				}	
				
				fileName = "成品鹅出售信息汇总.xls";
				String[] titles = {"日期","销售商","联系电话","数量","单价","总量","金额合计","备注"};
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				@SuppressWarnings("unchecked")
				ExportSearchRecord export = new ExportSearchRecord(fileName, contentList);
				export.setTitles(titles);
				Workbook workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (type.equals("buyGood")) {
	
			//导出物资采购记录
			//组装Hql语句
			String queryString = "select r from com.scau.view.goose.BuyGoodView r where r.date "
					+ "between '"+ fromDate + "' and '"+ toDate +"'";
			if(0 != fromNum && 0 != toNum){
				queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
			}
			
			BuyGoodViewService buyGoodViewService = (BuyGoodViewService) BeansUtil.get("buyGoodViewService");
			List<BuyGoodView> resultList = buyGoodViewService.findByCondition(queryString);
			
			fileName = "采购物资汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			ExportBuyGooseView export = new ExportBuyGooseView(fileName, resultList);
			Workbook workbook;
			try {
				workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (type.equals("tradeGood")) {

			//导出物资销售记录
			//组装Hql语句
			String queryString = "select r from com.scau.view.goose.TradeGoodView r where r.tradeDate " + "between '"+ fromDate + "' and '"+ toDate +"'";
			if(0 != fromNum && 0 != toNum){
				queryString = queryString + " and r.amount between " + fromNum +" and "+ toNum;
			}
			
			TradeGoodViewService tradeGoodViewService = (TradeGoodViewService) BeansUtil.get("tradeGoodViewService");
			List<TradeGoodView> resultList = tradeGoodViewService.findByCondition(queryString);
			
			fileName = "出售物资汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			ExportTradeGoodView export = new ExportTradeGoodView(fileName, resultList);
			Workbook workbook;
			try {
				workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		out.close();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	public ExportData(){
		this.farmService = (FarmService) BeansUtil.get("farmService");
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
		String farmMsg = "农户名:" + farmer.getName() + "     电话:"+ farmer.getPhone() + "      农场名:"+ farm.getName() + "       地址:"
						+ farm.getAddress();
		return farmMsg;
	}
	
	/**获得销售商信息
	 * */
	private String getRetailerInfo(long retailerId){
		RetailerService retailerService = (RetailerService)BeansUtil.get("retailerService");
		Retailer retailer = new Retailer();
		retailer.setId(retailerId);
		retailer = retailerService.get(retailer);
		String msg = "销售商名:" + retailer.getName() + "   联系电话:" + retailer.getPhone();
		return msg;
	}
	
	private List<String> sliptMsg(String farmAndFarmerInfo){
		List<String> result = new ArrayList<String>();
		for (String string : farmAndFarmerInfo.split(".{2,4}:")) {
			if(!string.equals("")){
				result.add(string.replaceAll(";...", ""));
			}
		}
		return result;
	}
}
