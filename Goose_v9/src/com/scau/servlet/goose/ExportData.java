package com.scau.servlet.goose;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Collections;
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
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmStockService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.MarketService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.BuyGoodView;
import com.scau.view.goose.Market;
import com.scau.view.goose.TradeGoodView;
import com.scau.vo.goose.AppearOnMarket;
import com.scau.vo.goose.DeadInfo;
import com.scau.vo.goose.FarmStock;

/** 这个类是用于响应页面的导出excel表格的，根据从页面过来的参数type，指定表格数据的类型
 * 如存栏，农场死亡鹅只，鹅苗进场批次等
 * @author jianhao
 *
 */
public class ExportData extends HttpServlet {

	private static int ON_MARKET_DAY = 90;//设定的鹅只成熟日期
	private MarketService marketService;
	private GooseService gooseService;
	private FarmerService farmerService;
	private FarmService farmService;
	private ReceiveGooseService receiveGooseService;
	
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
	
				ExportDeadInfo export = new ExportDeadInfo(fileName, receiveGooseService.getAllFarmDeadInfo(daysWithin));
				Workbook workbook = export.exportExcel();
				workbook.write(out);
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		} 
		else if (type.equals("receiveGoose")) {
			try {
			String[] titles = (String[]) request.getSession().getAttribute("titles");	
			fileName = "鹅苗进场信息汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			List<String[]> contentList = (List<String[]>) request.getSession().getAttribute("contentList");
			ExportSearchRecord export = new ExportSearchRecord(fileName, contentList);
			export.setTitles(titles);
			Workbook workbook= export.exportExcel();
			workbook.write(out);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if (type.equals("tradeGoose")) {
			try {
			String[] titles = (String[]) request.getSession().getAttribute("titles");
			fileName = "成品鹅回购信息汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			List<String[]> contentList = (List<String[]>) request.getSession().getAttribute("contentList");
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
				String[] titles = (String[]) request.getSession().getAttribute("titles");
				fileName = "成品鹅出售信息汇总.xls";
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				@SuppressWarnings("unchecked")
				List<String[]> contentList = (List<String[]>) request.getSession().getAttribute("contentList");
				ExportSearchRecord export = new ExportSearchRecord(fileName, contentList);
				export.setTitles(titles);
				Workbook workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (type.equals("buyGood")) {
			fileName = "采购物资汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			List<BuyGoodView> contentList = (List<BuyGoodView>) request.getSession().getAttribute("contentList");
			ExportBuyGooseView export = new ExportBuyGooseView(fileName, contentList);
			Workbook workbook;
			try {
				workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (type.equals("tradeGood")) {
			fileName = "出售物资汇总.xls";
			response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			@SuppressWarnings("unchecked")
			List<TradeGoodView> contentList = (List<TradeGoodView>) request.getSession().getAttribute("contentList");
			ExportTradeGoodView export = new ExportTradeGoodView(fileName, contentList);
			Workbook workbook;
			try {
				workbook = export.exportExcel();
				workbook.write(out);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//移除放在session的titles 和内容列表contentList
		request.getSession().removeAttribute("titles");
		request.getSession().removeAttribute("contentList");
		out.close();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	public ExportData(){
		this.gooseService = (GooseService) BeansUtil.get("gooseService");
		this.marketService = (MarketService) BeansUtil.get("marketService");
		this.farmerService = (FarmerService) BeansUtil.get("farmerService");
		this.farmService = (FarmService) BeansUtil.get("farmService");
		this.receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
	}
}
