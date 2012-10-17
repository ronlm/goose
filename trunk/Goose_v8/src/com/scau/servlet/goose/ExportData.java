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
		
		if(type.equals("market")){
			try {
				fileName = today + "日全部农场鹅只上市信息汇总.xls";
				response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
				
				/* 查看鹅只可上市信息
				 *候选条件：鹅苗接收批次时间在从今天算已养殖45天到105天内
				*/
				String hql =  "select m from com.scau.view.goose.Market m where m.receiveDate between '" + marketService.getDateBefore(105) + "' and '" +
							marketService.getDateBefore(45) + "' order by m.receiveDate asc";
				// 以下的计算是找出记录的总数
				List<Market> totalList = marketService.findByCondition(hql);
				
				List<AppearOnMarket> resourceList = new LinkedList<AppearOnMarket>();
				for (Market market : totalList) {	
					long feedDays = new Date().getTime() - market.getReceiveDate().getTime();//已养殖天数
					long day = ON_MARKET_DAY - feedDays/(3600*24*1000);//离上市相差的天数
					//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
				
					String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + market.getReceiveId() + "' and "
							+ "g.isValid =1 and g.tradeId=null and g.deadDate =null";
					long gooseNum = gooseService.getRecordCount(gooseCondition);
						
					AppearOnMarket a = new AppearOnMarket();
					a.setFarmer(farmerService.get(new Farmer(),market.getFarmerId()));
					a.setDayTo90(day);
					a.setGooseNum(gooseNum);
					a.setMarket(market);
					resourceList.add(a);
				}
				ExportAppearOnMarket export = new ExportAppearOnMarket(fileName, resourceList);
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
				for(Farm f :totalFarmList){
					//计算全部农场的存栏量
					FarmStockService farmStockService = new FarmStockService(totalFarmStockList, f, begin, end);
					farmStockService.start();//启动每个个农户各自的线程
				}
				
				begin.countDown();
				long startTime = System.currentTimeMillis();
				try {
					end.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} finally {
					long endTime = System.currentTimeMillis();
					System.out.println("stock spend time: " + (endTime - startTime) +"ms");
				}
				
				Collections.sort(totalFarmStockList,new FarmStock());
				ExportFarmStock export = new ExportFarmStock(fileName, totalFarmStockList);
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
				
				List<Farm> farmList = farmService.list(new Farm());
				List<DeadInfo> resourceList = new LinkedList<DeadInfo>();// 结果列
				for (Farm f : farmList) {
					// 查找每个农场的相关信息
					List<ReceiveGoose> receiveGooseList = receiveGooseService
							.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
									+ " rg.farmId='"+ f.getId() + "' and rg.receiveDate >='"
									+ receiveGooseService.getDateBefore(daysWithin)+ "'");	
					DeadInfo dead = new DeadInfo();
					dead.setFarm(f);
					dead.setFarmer(farmerService.get(new Farmer(),f.getFarmerId()));
					if (receiveGooseList.size() > 0) {
						dead.setFarm(f);
						List<Goose> gooseList = new LinkedList<Goose>();
						for (ReceiveGoose rg : receiveGooseList) {
							// 得到一个批次的死亡鹅只死亡记录

							List<Goose> tempList = gooseService.findByCondition("from com.scau.model.goose.Goose g where " +
									"g.receiveId = " + rg.getId() + " and g.isValid=0 ");					
							gooseList.addAll(tempList);
						}
						dead.setDeadNum(gooseList.size());
					} else {
						dead.setDeadNum(0);
					}
					resourceList.add(dead);// 加入到结果
				}
				
				ExportDeadInfo export = new ExportDeadInfo(fileName, resourceList);
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
