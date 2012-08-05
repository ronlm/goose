package com.scau.action.goose;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.goose.BuyGood;
import com.scau.model.goose.GoodSupplier;
import com.scau.model.goose.Good;
import com.scau.model.goose.BuyGood;
import com.scau.service.impl.goose.BuyGoodService;
import com.scau.service.impl.goose.GoodSupplierService;
import com.scau.service.impl.goose.GoodService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class BuyGoodAction extends BaseAction implements ModelDriven<BuyGood>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(BuyGoodAction.class);
	private PageController pager;
	private BuyGood buyGood;
	private BuyGoodService buyGoodService;
	private GoodService goodService;
	private GoodSupplierService goodSupplierService;
	
	public String add() throws Exception {
		// 添加记录
		List<Good> goodList=goodService.listAll(new Good());
		List<GoodSupplier> goodSupplierList=goodSupplierService.listAll(new GoodSupplier());
		request.setAttribute("goodList", goodList);
		request.setAttribute("goodSupplierList", goodSupplierList);
		System.out.println("test--------------test,"+goodSupplierList.get(0).getName());
		System.out.println("test--------------test,"+goodSupplierList.get(1).getName());
			return "edit";		
	}
	
	public String save() throws Exception {
		// 保存表单
		try {
			String goodName=goodService.get(new Good(), buyGood.getGoodId()).getName();
			String goodSupplierName=goodSupplierService.get(new GoodSupplier(), buyGood.getGoodSupplierId()).getName();
			request.setAttribute("goodName", goodName);
			request.setAttribute("goodSupplierName", goodSupplierName);
			buyGoodService.save(buyGood);
			return show();
		} catch (Exception e) {
			// 保存原来表单已输入的内容
			return "error";
		}
	}
	
	public String list() throws Exception {
		// 取列表
			
			int totalRows = buyGoodService.listAll(new BuyGood()).size();
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<BuyGood> resourceList = buyGoodService.listAll(new BuyGood());
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}
	
	private String show() {
		// TODO Auto-generated method stub
		int totalRows = 1;
		String URL = request.getRequestURI();
		this.pager.setURL(URL);
		this.pager.setTotalRowsAmount(totalRows);
		List<BuyGood> resourceList = new ArrayList<BuyGood>();
		resourceList.add(buyGood);
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		return "list";	
	}

	
	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}
	
	public BuyGood getBuyGood() {
		return buyGood;
	}

	public void setBuyGood(BuyGood buyGood) {
		this.buyGood = buyGood;
	}

	public BuyGoodService getBuyGoodService() {
		return buyGoodService;
	}

	@Resource
	public void setBuyGoodService(BuyGoodService buyGoodService) {
		this.buyGoodService = buyGoodService;
	}
	
	public GoodService getGoodService() {
		return goodService;
	}

	@Resource
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public GoodSupplierService getGoodSupplierService() {
		return goodSupplierService;
	}

	@Resource
	public void setGoodSupplierService(GoodSupplierService goodSupplierService) {
		this.goodSupplierService = goodSupplierService;
	}

	@Override
	public BuyGood getModel() {
		// TODO Auto-generated method stub
		return buyGood;
	}

	
}
