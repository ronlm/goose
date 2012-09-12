package com.scau.servlet.goose;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;

import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleRegion;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.SaleStatisticInfo;
import com.sun.org.apache.bcel.internal.generic.Select;

public class SaleStatisticServlet extends HttpServlet {

	private SaleRegionService saleRegionService ;
	private RetailerService retailerService;
	private SaleGooseService saleGooseService;
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		Date fromDate = new Date(-1) ;//默认 1970-01-01
		Date toDate = new Date(new java.util.Date().getTime());//默认今天
		StringBuffer resultHtml = new StringBuffer();
		long totalGooseNum = 0 ;//销售鹅只总数
		double  totalGooseValue = 0 , totalGooseWeight = 0 ;//销售总金额和销售总重量
		
		//获得开始时间和终止时间
		try{
			fromDate = Date.valueOf(request.getParameter("fromDate"));
			toDate = Date.valueOf(request.getParameter("toDate"));
			System.out.println(fromDate.toString() + "  " + toDate.toString());
		}catch(Exception e){
			out.print("<font color=\"red\">日期查询相关资料出错!</font>");
		}
		
		String type = request.getParameter("type");
		if(type.equals("all")){
			//查看全部分区的销售信息
			
			List<SaleRegion> saleRegions = saleRegionService.list(new SaleRegion());
			int i = 1;
			for (SaleRegion saleRegion : saleRegions) {
				//计算每个分区下所有的销售的销售鹅只总数、销售总金额和销售总重量
				Retailer retailer = new Retailer();
				retailer.setRegionId(saleRegion.getId());
				List<Retailer> retailerList = retailerService.list(retailer);
				
				for (Retailer retailer2 : retailerList) {
					//迭代一个分区里的所有销售商的销售业绩
					List<Object> tempResultList = saleGooseService.getSum("select sum(sg.amount),sum(sg.totalValue),sum(sg.totalWeight) from com.scau.model.goose.SaleGoose sg" +
							" where sg.retailerId='" + retailer2.getId() + "' and sg.saleDate between '" + fromDate +"' and '" + toDate + "'" );
					
					if(3 == tempResultList.size() && null != tempResultList.get(0) && null != tempResultList.get(1) && 
							null != tempResultList.get(2)){
						//只得总数量，总价值，总重量不为null 才加入统计
						totalGooseNum += (Long)tempResultList.get(0);
						totalGooseValue += (Double)tempResultList.get(1);
						totalGooseWeight += (Double)tempResultList.get(2);
					}
					
				}
				
				resultHtml.append("<tr><td>" + i + "</td><td>" + saleRegion.getRegion()+ "</td><td>" + totalGooseNum + "</td><td>" + totalGooseWeight +
						"</td><td>"+ totalGooseValue  + "</td>");
				i++;
				totalGooseNum =0;
				totalGooseValue = 0;
				totalGooseWeight= 0;
			}
			
		
		}
		else if (type.equals("single")) {
			// 查看单个分区所有销售商的销售信息
			Long regionId = Long.valueOf(request.getParameter("regionId"));
			
			Retailer retailer = new Retailer();
			retailer.setRegionId(regionId);
			List<Retailer> retailerList = retailerService.list(retailer);
			int i=1;
			for (Retailer retailer2 : retailerList) {
				//迭代该分区内所有的销售商
				List<Object> tempResultList = saleGooseService.getSum("select sum(sg.amount),sum(sg.totalValue),sum(sg.totalWeight) from com.scau.model.goose.SaleGoose sg" +
						" where sg.retailerId='" + retailer2.getId() + "' and sg.saleDate between '" + fromDate +"' and '" + toDate + "'" );
				if(3 >= tempResultList.size()){
					totalGooseNum += (Long)tempResultList.get(0);
					totalGooseWeight  += (Double)tempResultList.get(1);
					totalGooseValue += (Double)tempResultList.get(2);
				}
					resultHtml.append("<tr><td>" + i + "</td><td>" + retailer2.getName() + "</td><td>" + totalGooseNum + "</td><td>" + totalGooseValue +
							"</td><td>"+ totalGooseWeight + "</td>");
					i++;
					totalGooseNum =0;
					totalGooseValue = 0;
					totalGooseWeight= 0;
				
			}
			
			
		}else {
			resultHtml.append("查找信息出错，请重新输入条件！");
		}
		//返回结果，并显示给页面
		request.setAttribute("fromDate", fromDate);
		request.setAttribute("toDate", toDate);
		request.setAttribute("saleRegionList", saleRegionService.list(new SaleRegion()));
		out.print(resultHtml);
	}

	public SaleStatisticServlet() {
		super();
		this.saleRegionService = (SaleRegionService) BeansUtil.get("saleRegionService");
		this.retailerService = (RetailerService) BeansUtil.get("retailerService");
		this.saleGooseService = (SaleGooseService)BeansUtil.get("saleGooseService");
	}
	
	

}
