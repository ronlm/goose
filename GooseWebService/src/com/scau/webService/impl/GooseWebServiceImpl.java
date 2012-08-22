package com.scau.webService.impl;

import java.util.ArrayList;

import javax.jws.WebService;

import com.scau.model.goose.Farm;
import com.scau.webService.IGooseService;

@WebService
public class GooseWebServiceImpl implements IGooseService{

	@Override
	public int login(String name, String password) {
		System.out.println("³É¹¦µÇÂ¼£¡");
		return 0;
	}

	@Override
	public ArrayList<Farm> getFarmList() {
		System.out.println("call the get farmList method...");
		return null;
	}

	@Override
	public int addReceiveGoose(int farmId, ArrayList<Integer> gooseList) {
		System.out.println("call the get addReceiveGoose method...");
		return 0;
	}

	@Override
	public int addTradeGoose(int farmId, ArrayList<Integer> gooseList) {
		System.out.println("call the get addTradeGoose method...");
		return 0;
	}

	@Override
	public int addSaleGoose(int retailerId, ArrayList<Integer> gooseList) {
		System.out.println("call the get addSaleGoose method...");
		return 0;
	}

}
