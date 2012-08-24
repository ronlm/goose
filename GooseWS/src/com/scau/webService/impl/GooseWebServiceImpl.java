package com.scau.webService.impl;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;

import com.scau.model.goose.Retailer;
import com.scau.model.webService.FarmWs;
import com.scau.webService.IGooseService;

public class GooseWebServiceImpl implements IGooseService{

	@WebMethod
	public boolean login(String name, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@WebMethod
	public List<FarmWs> getFarmList() {
		// TODO Auto-generated method stub
		return null;
	}

	@WebMethod
	public List<Retailer> getRetailerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@WebMethod
	public int addReceiveGoose(int farmId, ArrayList<String> gooseList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@WebMethod
	public int addTradeGoose(int farmId, ArrayList<String> gooseList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@WebMethod
	public int addSaleGoose(int retailerId, ArrayList<String> gooseList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@WebMethod
	public int authenticate(String gooseId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@WebMethod
	public int setInvalid(String gooseId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
