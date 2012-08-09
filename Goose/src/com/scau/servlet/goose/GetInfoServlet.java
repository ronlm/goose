package com.scau.servlet.goose;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.util.BeansUtil;

public class GetInfoServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=	utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Farm farm = new Farm();
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		Farmer farmer = new Farmer();
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		
		try {
			if(request.getParameter("infoType").equals("farmInfo")){
				Long farmId = Long.parseLong(request.getParameter("farmId"));
				farm.setId(farmId);
				farm = farmService.get(farm);
				
				farmer.setId(farm.getFarmerId());
				farmer = farmerService.get(farmer);
				out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:" + farmer.getPhone() +"&nbsp;&nbsp;农场名：" + farm.getName() + "&nbsp;&nbsp;地址:" + farm.getAddress());
				
			}else if(request.getParameter("infoType").equals("farmerInfo")){
				Long farmerId = Long.parseLong(request.getParameter("farmerId"));
				farmer.setId(farmerId);
				farmer = farmerService.get(farmer);
				out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:" + farmer.getPhone() +"&nbsp;&nbsp;住址:" + farmer.getAddress());	
			}
			else{
				out.print("暂无相关资料");
			}
		} catch (Exception e) {
			out.print("<font color=\"red\">查询相关资料出错!</font>");
		}
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
