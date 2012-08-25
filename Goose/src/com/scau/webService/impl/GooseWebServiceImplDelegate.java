package com.scau.webService.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebMethod;
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

@javax.jws.WebService(targetNamespace = "http://impl.webService.scau.com/", serviceName = "GooseWebServiceImplService", portName = "GooseWebServiceImplPort", wsdlLocation = "WEB-INF/wsdl/GooseWebServiceImplService.wsdl")
public class GooseWebServiceImplDelegate {

	com.scau.webService.impl.GooseWebServiceImpl gooseWebServiceImpl = new com.scau.webService.impl.GooseWebServiceImpl();

	public boolean login(String name, String password) {
		return gooseWebServiceImpl.login(name, password);
	}

	public List<FarmWs> getFarmList() {
		return gooseWebServiceImpl.getFarmList();
	}

	public List<RetailerWs> getRetailerList() {
		return gooseWebServiceImpl.getRetailerList();
	}

	public int addReceiveGoose(long farmId, ArrayList<String> gooseList,
			String comments) {
		return gooseWebServiceImpl.addReceiveGoose(farmId, gooseList, comments);
	}

	public int addTradeGoose(long farmId, ArrayList<String> gooseList,
			Double totalWeight, Double unitPrice, String comments) {
		return gooseWebServiceImpl.addTradeGoose(farmId, gooseList,
				totalWeight, unitPrice, comments);
	}

	public int addSaleGoose(long retailerId, ArrayList<String> gooseList,
			Double totalWeight, Double unitPrice, String comments) {
		return gooseWebServiceImpl.addSaleGoose(retailerId, gooseList,
				totalWeight, unitPrice, comments);
	}

	public int authenticate(String gooseId) {
		return gooseWebServiceImpl.authenticate(gooseId);
	}

	public int setInvalid(String gooseId) {
		return gooseWebServiceImpl.setInvalid(gooseId);
	}

}