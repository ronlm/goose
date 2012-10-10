package com.scau.action.goose;

import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.PageController;
import com.scau.vo.goose.DeadDetail;
import com.scau.vo.goose.DeadInfo;

/** 与鹅只死亡相关的统计
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class DeadGooseStatisticAction extends BaseAction {
	private final static Log logger = LogFactory
			.getLog(DeadGooseStatisticAction.class);
	private PageController pager;
	private FarmService farmService;
	private GooseService gooseService;
	private ReceiveGooseService receiveGooseService;
	private Farm farm;
	private ReceiveGoose receiveGoose;

	public String dead() {
		// 查看鹅只非正常死亡信息
		int daysWithin = 100;
		String URL = request.getRequestURI();
		this.pager.setURL(URL);

		// 取得要显示 的日期条件
		if (null != request.getParameter("daysWithin")) {
			daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
			request.getSession().removeAttribute("daysWithin");
		} else if (null != request.getSession().getAttribute("daysWithin")) {
			daysWithin = (Integer) request.getSession().getAttribute("daysWithin");
		}

		int totalRowCount = farmService.list(new Farm()).size();
		this.pager.setTotalRowsAmount(totalRowCount);// 设置总记录条数

		List<Farm> farmList = farmService.findByCondition(
				pager.getPageStartRow(), pager.getPageSize(),
				"from com.scau.model.goose.Farm f order by f.id asc");
		List<DeadInfo> resourceList = new LinkedList<DeadInfo>();// 结果列
		for (Farm f : farmList) {
			// 查找每个农场的相关信息
			List<ReceiveGoose> receiveGooseList = receiveGooseService
					.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
							+ " rg.farmId='"
							+ f.getId()
							+ "' and rg.receiveDate >='"
							+ receiveGooseService.getDateBefore(daysWithin)
							+ "'");	
			DeadInfo dead = new DeadInfo();
			dead.setFarm(f);
			if (receiveGooseList.size() > 0) {
				dead.setFarm(f);
				List<Goose> gooseList = new LinkedList<Goose>();
				for (ReceiveGoose rg : receiveGooseList) {
					// 得到一个批次的死亡鹅只死亡记录

					List<Goose> tempList = gooseService.findByCondition("from com.scau.model.goose.Goose g where " +
							"g.receiveId = " + rg.getId() + " and g.isValid=0 ");					
					gooseList.addAll(tempList);
				}
				dead.setDeadNum(gooseList.size());
				dead.setDeadGooses(gooseList);

			} else {
				dead.setDeadNum(0);
			}
			resourceList.add(dead);// 加入到结果
		}
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		request.setAttribute("today", new Date(new java.util.Date().getTime()));
		request.getSession().setAttribute("daysWithin", daysWithin);
		return "dead";
	}

	public String deadDetail() {
		// 查看一个指定农场的所以存栏 的receiveGoose 的死亡信息和存活率
		int daysWithin = 0;
		farm = farmService.get(farm);
		String URL = request.getRequestURI() + "?farm.id=" + farm.getId();
		this.pager.setURL(URL);
		// 取得要显示的日期条件
		if (null != request.getParameter("daysWithin")) {
			daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
			request.getSession().removeAttribute("daysWithin");
		} else if (null != request.getSession().getAttribute("daysWithin")) {
			daysWithin = (Integer) request.getSession().getAttribute(
					"daysWithin");
		}
		List<DeadDetail> resourceList = new ArrayList<DeadDetail>();
		if (null != farm) {
			// 查看某个农场最近接收的鹅苗交付信息
			ReceiveGoose receiveGoose = new ReceiveGoose();
			receiveGoose.setFarmId(farm.getId());

			String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId="
					+ receiveGoose.getFarmId()
					+ " and rg.receiveDate >='"
					+ receiveGooseService.getDateBefore(daysWithin)
					+ "' order by rg.receiveDate desc";

			List<ReceiveGoose> receiveGooseList = receiveGooseService
					.findByCondition(hql);
			int totalRows = receiveGooseList.size();// 总的记录条数
			this.pager.setTotalRowsAmount(totalRows);
			int toIndex = Math.min(receiveGooseList.size(), pager.getPageStartRow() + pager.getPageSize());
			
			for (ReceiveGoose receiveGoose2 : receiveGooseList.subList(
					this.pager.getPageStartRow(), toIndex)) {
				// 迭代要显示在页面的所有批次
				// 查找出所属该批次的已死亡鹅只,未出售
				List<Goose> deadGooseList = gooseService.findByCondition("from com.scau.model.goose.Goose g where " +
							"g.receiveId = " + receiveGoose2.getId() + " and g.isValid=0 and g.tradeId=null");
				DeadDetail deadDetail = new DeadDetail();
				deadDetail.setDeadGooses(deadGooseList);
				deadDetail.setReceiveGoose(receiveGoose2);
				deadDetail.setCurrentNum(receiveGoose2.getAmount()
						- deadGooseList.size());
				deadDetail.setDeadNum(deadGooseList.size());
				deadDetail.setSurviveRate((float) (1.00000 - deadGooseList
						.size() * 1.00000 / receiveGoose2.getAmount()));
				resourceList.add(deadDetail);
			}
		}

		pager.setData(resourceList);
		request.setAttribute("farm", farm);
		request.setAttribute("pager", pager);
		request.getSession().setAttribute("daysWithin", daysWithin);
		return "deadDetail";
	}

	
	/** 查看该个接收鹅苗批次里每只鹅的死亡时间
	 * @return
	 */
	public String deadGooseList() {
		receiveGoose = receiveGooseService.get(receiveGoose);
		farm = farmService.get(new Farm(), receiveGoose.getFarmId());
		String URL = request.getRequestURI();
		this.pager.setURL(URL);
		
		int daysWithin = 0;
		// 取得要显示的日期条件
		if (null != request.getParameter("daysWithin")) {
			daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
			request.getSession().removeAttribute("daysWithin");
		} else if (null != request.getSession().getAttribute("daysWithin")) {
				daysWithin = (Integer) request.getSession().getAttribute("daysWithin");
		}
		
		List<Goose> resourceList = gooseService.findByCondition(pager.getPageStartRow(), pager.getPageSize(),
						"select g from com.scau.model.goose.Goose g where g.receiveId=" + receiveGoose.getId() + " and g.isValid=0");
		pager.setData(resourceList);
		pager.setTotalRowsAmount(resourceList.size());
		
		request.setAttribute("total", resourceList.size());
		request.getSession().setAttribute("daysWithin", daysWithin);
		request.setAttribute("pager", pager);
		request.setAttribute("reveiveGoose", receiveGoose);
		request.setAttribute("farm", farm);
		return "deadGooseList";
	}

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public FarmService getFarmService() {
		return farmService;
	}

	@Resource
	public void setFarmService(FarmService farmService) {
		this.farmService = farmService;
	}

	public GooseService getGooseService() {
		return gooseService;
	}

	@Resource
	public void setGooseService(GooseService gooseService) {
		this.gooseService = gooseService;
	}

	public ReceiveGooseService getReceiveGooseService() {
		return receiveGooseService;
	}

	@Resource
	public void setReceiveGooseService(ReceiveGooseService receiveGooseService) {
		this.receiveGooseService = receiveGooseService;
	}

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}

	public ReceiveGoose getReceiveGoose() {
		return receiveGoose;
	}

	public void setReceiveGoose(ReceiveGoose receiveGoose) {
		this.receiveGoose = receiveGoose;
	}
	
	
}
