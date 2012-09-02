package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;

@Component
public class DeleteGooseAction extends BaseAction{
	private final static Log logger = LogFactory
			.getLog(DeleteGooseAction.class);
	private ReceiveGooseService receiveGooseService;
	private GooseService gooseService;
	
	public String list() {
		return "list";
	}
	
	public String delete() {
		List<ReceiveGoose> receiveGooses = receiveGooseService.findByCondition("from com.scau.model.goose.ReceiveGoose rg where rg.receiveDate <'"
											+ receiveGooseService.getDateBefore(365*2) + "'");
		for (ReceiveGoose receiveGoose : receiveGooses) {
			Goose goose = new Goose();
			goose.setReceiveId(receiveGoose.getId());
			List<Goose> gooseList = gooseService.list(goose);
			
			for (Goose goose2 : gooseList) {
				gooseService.delete(goose2);
			}
			
		}
		request.setAttribute("message", "成功删除两年前鹅只脚环信息！");
		return "success";
	}

	public ReceiveGooseService getReceiveGooseService() {
		return receiveGooseService;
	}

	@Resource
	public void setReceiveGooseService(ReceiveGooseService receiveGooseService) {
		this.receiveGooseService = receiveGooseService;
	}

	public GooseService getGooseService() {
		return gooseService;
	}

	@Resource
	public void setGooseService(GooseService gooseService) {
		this.gooseService = gooseService;
	}
	
	
}
