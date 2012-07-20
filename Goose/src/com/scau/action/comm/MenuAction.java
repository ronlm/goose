package com.scau.action.comm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.comm.CommMenu;
import com.scau.model.comm.CommMenu2;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommRoleResource;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommMenuService;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.util.PageController;

import cn.com.ege.mvc.exception.BusinessException;

@Component
@Scope("prototype")
public class MenuAction extends BaseAction implements Serializable ,ModelDriven<CommMenu>{
	private final static Log logger = LogFactory.getLog(MenuAction.class);
	private PageController pageController ;
	private CommMenuService commMenuService;
	private CommMenu commMenu;
	private CommMenu menu;
	private List<CommMenu> menuList = new ArrayList<CommMenu>();
	private CommResourceService commResourceService;

	public String list() {
		// 取列表
			int totalRows = commMenuService.getRecordCount(new CommMenu());
			String URL = request.getRequestURI();
			this.pageController.setURL(URL);
			this.pageController.setTotalRowsAmount(totalRows);
			List<CommMenu> mList = commMenuService.list(new CommMenu(), null, null,
					null, null);
			List<CommMenu2> tempList = new ArrayList<CommMenu2>();
			this.save(mList, tempList);
			List<CommMenu2> tempList2 = new ArrayList<CommMenu2>();
			this.setMenu(0l, tempList, tempList2);
			tempList = new ArrayList<CommMenu2>();
			this.display(tempList2, tempList);
			if (tempList.size() <= this.pageController.getPageEndRow()) {
				tempList = tempList.subList(this.pageController.getPageStartRow(),
						tempList.size());
			} else {
				tempList = tempList.subList(this.pageController.getPageStartRow(),
						this.pageController.getPageEndRow());
			}
			pageController.setData(tempList);
			return "list";
	}

	public String get() {		
			// 点了添加或者点了修改
			CommMenu temp = commMenuService.get(menu);
			if (null != temp) {
				commMenu = temp;
			}
			this.menuList = commMenuService.listAll(new CommMenu());
			request.setAttribute("menuList", this.menuList);
			List<CommResource> resourceList = commResourceService.listAll(new CommResource());
			request.setAttribute("resourceList", resourceList);
			return "edit";	
	}

	public String save() {
		// 保存表单
		try {
			commMenuService.save(menu);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("menu", commMenu);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public String del() {
		// 删除
		String[] ids = request.getParameterValues("id");
		for (String id : ids) {
			CommMenu menu = new CommMenu();
			if (null != id && !("".equals(id))) {
				menu.setId(Long.valueOf(id));
				commMenuService.delete(menu);
			}
		}
		return list();
	}

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
	
	private void setMenu(Long pid, List<CommMenu2> menuList, List<CommMenu2> resultList) {
		List<CommMenu2> sub = getSubList(pid, menuList);
		// 取得的subMenu 是空的。。。。擦
		resultList.addAll(sub);
		for (CommMenu2 menu : resultList) {
			setMenu(menu.getId(), menuList, menu.getMenuList());
		}
		
	}
	
	private List<CommMenu2> getSubList(Long pid, List<CommMenu2> menuList){
		// pid 就是父菜单的ID号， 子菜单以此得到父菜单号
		List<CommMenu2> subList = new ArrayList<CommMenu2>();
		for (CommMenu2 menu2 : menuList) {
			if ((long)menu2.getPid() == (long)pid) {
				subList.add(menu2);
			}		
		}
		return subList;
	}
	
	private void display(List<CommMenu2> resultList, List<CommMenu2> sortedList) {
		if(resultList.size() > 0){
			for (CommMenu2 m : resultList) {
				sortedList.add(m);
				if (m.getMenuList().size() > 0) {
				}
				display(m.getMenuList(), sortedList);
			}
		}else {
		}
	}

	public String printMainMenu(HttpServletRequest request, List<CommRoleResource> crrList) {
		
		List<CommMenu2> tempList2 = new ArrayList<CommMenu2>();
		List<CommMenu> tempList = commMenuService.list(new CommMenu(), null, null, null, null);
		this.save(tempList, tempList2);
		List<CommMenu2> resultList = new ArrayList<CommMenu2>();
		this.setMenu(0L, tempList2, resultList);
		String menuStr =  getMenuHTML(resultList, request, crrList);
		return menuStr;
	}

	private int level = 0;
	private String getMenuHTML(List<CommMenu2> mainMenu2, HttpServletRequest request, List<CommRoleResource> crrList) {
		StringBuffer sb = new StringBuffer();
		sb.append(level==0?"<ul id=\"menu\">":"<ul>");
		level++;
		for(CommMenu2 menu2: mainMenu2){
			sb.append("<li>");
			if (menu2.getPid() == 0) {
				for (CommRoleResource crr : crrList) {
					if ((long)crr.getResourceId() == (long)menu2.getResourceId()) {
						sb.append("<a href=\""+menu2.getUrl()+"\" target=\"mainIframe\" style=\"cursor: pointer;\"><img src=\""+request.getContextPath()+menu2.getImage()+"\" align=\"absmiddle\" style=\"padding-right:5px;\" />"+menu2.getName()+"</a>");
					}
				}
			} else {
				for (CommRoleResource crr : crrList) {
					if ((long)crr.getResourceId() == (long)menu2.getResourceId()) {
						sb.append("<a href=\""+request.getContextPath()+menu2.getUrl()+"\" target=\"mainIframe\" style=\"cursor: pointer;\">"+menu2.getName()+"</a>");
					}
				}
			}
			if(menu2.getMenuList().size()>0){
				sb.append(getMenuHTML(menu2.getMenuList(), request, crrList));
			}
			sb.append("</li>");
		}
		sb.append("</ul>");
		return sb.toString();
	}

	

	public PageController getPageController() {
		return pageController;
	}

	@Resource
	public void setPageController(PageController pageController) {
		this.pageController = pageController;
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

	public CommMenu getCommMenu() {
		return commMenu;
	}

	@Resource
	public void setCommMenu(CommMenu commMenu) {
		this.commMenu = commMenu;
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
	@Resource
	public void setMenu(CommMenu menu) {
		this.menu = menu;
	}

	public CommMenu getModel() {
		// TODO Auto-generated method stub
		return menu;
	}
	
	

}
