package com.scau.action.comm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.exception.BusinessException;
import com.scau.model.comm.CommMenu;
import com.scau.model.comm.CommMenu2;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRoleResource;
import com.scau.service.impl.comm.CommMenuService;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.util.PageController;


/** 处理与系统菜单管理相关的请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class MenuAction extends BaseAction implements Serializable {
	private final static Log logger = LogFactory.getLog(MenuAction.class);
	private PageController pager;
	private CommMenuService commMenuService;
	private CommMenu menu;
	private List<CommMenu> menuList = new ArrayList<CommMenu>();
	private CommResourceService commResourceService;
	/***
	 * 获得菜单的html显示文本返回到页面中
	 * @return
	 */
	public String list() {
		
		int totalRows = commMenuService.getRecordCount(new CommMenu());
		String URL = getListURL();
		this.pager.setURL(URL);
		this.pager.setTotalRowsAmount(totalRows);
		List<CommMenu> mList = commMenuService.list(new CommMenu(),null, null,
				null, null);
		List<CommMenu2> tempList = new ArrayList<CommMenu2>();
		this.save(mList, tempList);
		List<CommMenu2> tempList2 = new ArrayList<CommMenu2>();
		this.setMenu(0l, tempList, tempList2);
		tempList = new ArrayList<CommMenu2>();
		this.display(tempList2, tempList);
		if (tempList.size() <= this.pager.getPageEndRow()) {
			tempList = tempList.subList(this.pager.getPageStartRow(),
					tempList.size() );
		} else {
			tempList = tempList.subList(this.pager.getPageStartRow(),
					this.pager.getPageEndRow());
		}
		pager.setData(tempList);
		
		request.setAttribute("pager", pager);
		return "list";
	}

	public String get() {
		// 点了添加或者点了修改
		menu = commMenuService.get(menu);
		if(null == menu){
			menu = new CommMenu();
		}
		this.menuList = commMenuService.listAll(new CommMenu());
		request.setAttribute("menuList", this.menuList);
		List<CommResource> resourceList = commResourceService
				.listAll(new CommResource());
		request.setAttribute("resourceList", resourceList);
		request.setAttribute("menu", menu);
		return "edit";
	}

	public String save() {
		// 保存表单
		try {
			commMenuService.save(menu);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("menu", menu);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public String del() {
		// 删除
		String[] ids = request.getParameterValues("id");
		for (String id : ids) {
			if (null != id && !("".equals(id))) {
				menu=new CommMenu();
				menu.setId(Long.parseLong(id));
				commMenuService.delete(menu,menu.getId());
			}
		}
		return list();
	}
	/**
	 * 保存编辑的菜单
	 * @param originList
	 * @param objectList
	 */
	private void save(List<CommMenu> originList, List<CommMenu2> objectList) {
		for (CommMenu menu : originList) {
			CommMenu2 menu2 = new CommMenu2();
			menu2.setId(menu.getId());
			menu2.setName(menu.getName());
			menu2.setPid(menu.getPid());
			menu2.setUrl(menu.getUrl());
			menu2.setImage(menu.getImage());
			menu2.setResourceId(menu.getResourceId());
			objectList.add(menu2);
		}
	}

	/**
	 * 迭代设置选中的
	 * @param pid
	 * @param menuList
	 * @param resultList
	 */
	private void setMenu(Long pid, List<CommMenu2> menuList,
			List<CommMenu2> resultList) {
		List<CommMenu2> sub = getSubList(pid, menuList);
		resultList.addAll(sub);
		for (CommMenu2 menu : resultList) {
			setMenu(menu.getId(), menuList, menu.getMenuList());
		}

	}

	/**
	 * 获得菜单的子菜单
	 * @param pid
	 * @param menuList
	 * @return
	 */
	private List<CommMenu2> getSubList(Long pid, List<CommMenu2> menuList) {
		// pid 就是父菜单的ID号， 子菜单以此得到父菜单号
		List<CommMenu2> subList = new ArrayList<CommMenu2>();
		for (CommMenu2 menu2 : menuList) {
			if ((long) menu2.getPid() == (long) pid) {
				subList.add(menu2);
			}
		}
		return subList;
	}

	private void display(List<CommMenu2> resultList, List<CommMenu2> sortedList) {
		if (resultList.size() > 0) {
			for (CommMenu2 m : resultList) {
				sortedList.add(m);
				if (m.getMenuList().size() > 0) {
				}
				display(m.getMenuList(), sortedList);
			}
		} else {
		}
	}

	public String printMainMenu(HttpServletRequest request,
			List<CommRoleResource> crrList) {

		List<CommMenu2> tempList2 = new ArrayList<CommMenu2>();
		List<CommMenu> tempList = commMenuService.list(new CommMenu(), null,
				null, null, null);
		this.save(tempList, tempList2);
		List<CommMenu2> resultList = new ArrayList<CommMenu2>();
		this.setMenu(0L, tempList2, resultList);
		String menuStr = getMenuHTML(resultList, request, crrList);
		return menuStr;
	}

	private int level = 0;

	/**
	 * 把主界面的菜单页打印成html
	 * @param mainMenu2
	 * @param request
	 * @param crrList
	 * @return 菜单的html展示格式
	 */
	private String getMenuHTML(List<CommMenu2> mainMenu2,
			HttpServletRequest request, List<CommRoleResource> crrList) {
		StringBuffer sb = new StringBuffer();
		sb.append(level == 0 ? "<ul id=\"menu\">" : "<ul>");
		level++;
		for (CommMenu2 menu2 : mainMenu2) {
			sb.append("<li>");
			if (menu2.getPid() == 0) {
				//这是一级菜单
				for (CommRoleResource crr : crrList) {
					if ((long) crr.getResourceId() == (long) menu2
							.getResourceId()) {
						// 迭代获得菜单下的所有子菜单，以html展示
						sb.append("<a href=\""
								+ menu2.getUrl()
								+ "\" target=\"mainIframe\" style=\"cursor: pointer;\"><img src=\""
								+ request.getContextPath()
								+ menu2.getImage()
								+ "\" align=\"absmiddle\" style=\"padding-right:5px;\" />"
								+ menu2.getName() + "</a>");
					}
				}
			} else {
				//这是子菜单
				for (CommRoleResource crr : crrList) {
					if ((long) crr.getResourceId() == (long) menu2
							.getResourceId()) {
						sb.append("<a href=\""
								+ request.getContextPath()
								+ menu2.getUrl()
								+ "\" target=\"mainIframe\" style=\"cursor: pointer;\">"
								+ menu2.getName() + "</a>");
					}
				}
			}
			if (menu2.getMenuList().size() > 0) {
				sb.append(getMenuHTML(menu2.getMenuList(), request, crrList));
			}
			sb.append("</li>");
		}
		sb.append("</ul>");
		return sb.toString();
	}

	

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public List<CommMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<CommMenu> menuList) {
		this.menuList = menuList;
	}

	public CommMenuService getCommMenuService() {
		return commMenuService;
	}

	@Resource
	public void setCommMenuService(CommMenuService commMenuService) {
		this.commMenuService = commMenuService;
	}

	public CommResourceService getCommResourceService() {
		return commResourceService;
	}

	@Resource
	public void setCommResourceService(CommResourceService commResourceService) {
		this.commResourceService = commResourceService;
	}

	public CommMenu getMenu() {
		return menu;
	}

	public void setMenu(CommMenu menu) {
		this.menu = menu;
	}

}
