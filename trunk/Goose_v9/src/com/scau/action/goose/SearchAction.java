package com.scau.action.goose;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.TradeGooseService;
/**
 * 处理与鹅只记录搜索相关的请求，这部分的功能已改由com.scau.servlet.goose.SearchResultServlet来完成
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class SearchAction {
	private final static Log logger = LogFactory.getLog(SearchAction.class);
	private ReceiveGooseService receiveGooseService;
	private TradeGooseService tradeGooseService;
	private SaleGooseService saleGooseService;
	
	public String execute(){
		
		return "success";
	}
}
