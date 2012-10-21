package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.DeadReason;
import com.scau.service.impl.goose.DeadReasonService;
import com.scau.util.PageController;
/**
 * 处理与鹅只死亡原因相关请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class DeadReasonAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(DeadReasonAction.class);
	private PageController pager;
	private DeadReasonService deadReasonService;
	private DeadReason deadReason;
	
	/**
	 * 列出全部的销售分区信息
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		// 取列表		
			int totalRows = deadReasonService.listAll(new DeadReason()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<DeadReason> resourceList = deadReasonService.list(new DeadReason(),this.pager.getPageStartRow(),this.pager.getPageSize(),null,null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	/**
	 *点了添加或者点了修改鹅只死亡信息
	 * @return
	 * @throws Exception
	 */
	public String get() {
			deadReason = deadReasonService.get(deadReason);
			request.setAttribute("saleRegion", deadReason);
			return "edit";
	}


	/**
	 *保存编辑的鹅只死亡信息表单
	 * @return
	 * @throws Exception
	 */	
	public String save() throws Exception {
		try {	
			deadReasonService.save(deadReason);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("deadReason", deadReason);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}
	
	/**
	 *删除选中的鹅只死亡原因信息
	 * @return
	 * @throws Exception
	 */	
	public String del() throws Exception {
			String[] ids = request.getParameterValues("id");
			DeadReason deadReason  = new DeadReason();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					deadReason.setId(Long.valueOf(id));
					deadReasonService.delete(deadReason,Long.parseLong(id));
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

	public DeadReasonService getDeadReasonService() {
		return deadReasonService;
	}

	@Resource
	public void setDeadReasonService(DeadReasonService deadReasonService) {
		this.deadReasonService = deadReasonService;
	}

	public DeadReason getDeadReason() {
		return deadReason;
	}

	public void setDeadReason(DeadReason deadReason) {
		this.deadReason = deadReason;
	}

	

	

	
}
