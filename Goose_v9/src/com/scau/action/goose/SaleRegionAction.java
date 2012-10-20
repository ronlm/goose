package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.SaleRegion;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.PageController;
/**
 * 处理与销售分区相关请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class SaleRegionAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(SaleRegionAction.class);
	private PageController pager;
	private SaleRegionService saleRegionService;
	private SaleRegion saleRegion;
	
	/**
	 * 列出全部的销售分区信息
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		// 取列表		
			int totalRows = saleRegionService.listAll(new SaleRegion()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<SaleRegion> resourceList = saleRegionService.list(new SaleRegion(),this.pager.getPageStartRow(),this.pager.getPageSize(),null,null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	/**
	 *点了添加或者点了修改销售分区信息
	 * @return
	 * @throws Exception
	 */
	public String get() {
			saleRegion = saleRegionService.get(saleRegion);
			request.setAttribute("saleRegion", saleRegion);
			return "edit";
	}


	/**
	 *保存编辑的销售分区信息表单
	 * @return
	 * @throws Exception
	 */	
	public String save() throws Exception {
		try {	
			saleRegionService.save(saleRegion);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("saleRegion", saleRegion);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}
	
	/**
	 *删除选中的销售分区信息
	 * @return
	 * @throws Exception
	 */	
	public String del() throws Exception {
			String[] ids = request.getParameterValues("id");
			SaleRegion saleRegion = new SaleRegion();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					saleRegion.setId(Long.valueOf(id));
					saleRegionService.delete(saleRegion,Long.parseLong(id));
				}
			}
			return list();//返回取列表页面，并刷新列表
	}

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public SaleRegionService getSaleRegionService() {
		return saleRegionService;
	}

	@Resource
	public void setSaleRegionService(SaleRegionService saleRegionService) {
		this.saleRegionService = saleRegionService;
	}

	public SaleRegion getSaleRegion() {
		return saleRegion;
	}

	public void setSaleRegion(SaleRegion saleRegion) {
		this.saleRegion = saleRegion;
	}

	

	
}
