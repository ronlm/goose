package com.scau.action.goose;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class SearchAction {
	private final static Log logger = LogFactory.getLog(SearchAction.class);
	
	public String execute(){
		return "success";
	}
}
