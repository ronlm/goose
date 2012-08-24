package com.scau.webService.impl;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebMethod;
import com.scau.model.goose.Retailer;
import com.scau.model.webService.FarmWs;
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

	public List<Retailer> getRetailerList() {
		return gooseWebServiceImpl.getRetailerList();
	}

	public int addReceiveGoose(int farmId, ArrayList<String> gooseList) {
		return gooseWebServiceImpl.addReceiveGoose(farmId, gooseList);
	}

	public int addTradeGoose(int farmId, ArrayList<String> gooseList) {
		return gooseWebServiceImpl.addTradeGoose(farmId, gooseList);
	}

	public int addSaleGoose(int retailerId, ArrayList<String> gooseList) {
		return gooseWebServiceImpl.addSaleGoose(retailerId, gooseList);
	}

	public int authenticate(String gooseId) {
		return gooseWebServiceImpl.authenticate(gooseId);
	}

	public int setInvalid(String gooseId) {
		return gooseWebServiceImpl.setInvalid(gooseId);
	}

}