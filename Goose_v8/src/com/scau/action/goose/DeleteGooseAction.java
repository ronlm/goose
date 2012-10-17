package com.scau.action.goose;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.scau.action.comm.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.MutilThreadGooseService;
import com.scau.service.impl.goose.ReceiveGooseService;

@Component
public class DeleteGooseAction extends BaseAction{
	private final static Log logger = LogFactory
			.getLog(DeleteGooseAction.class);
	private FarmService farmService;
	
	public String list() {
		return "list";
	}
	
	public String delete() {
		
		List<Farm> farmList = farmService.list(new Farm());
		final CountDownLatch begin = new CountDownLatch(1);
		final CountDownLatch end = new CountDownLatch(farmList.size());
		for (Farm farm : farmList) {
			MutilThreadGooseService mutilThreadGooseService = new MutilThreadGooseService(begin, end, 365*2, farm);
			mutilThreadGooseService.start();
		}
		
		begin.countDown();
		long startTime = System.currentTimeMillis();

		try {
			end.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
			return "error";
		} finally {
			long endTime = System.currentTimeMillis();
			System.out.println("delete spend time: " + (endTime - startTime));
		}
	
		request.setAttribute("message", "成功删除两年前鹅只脚环信息！");
		return "success";
		
	}

	public FarmService getFarmService() {
		return farmService;
	}
	
	@Resource
	public void setFarmService(FarmService farmService) {
		this.farmService = farmService;
	}

	
	
}
