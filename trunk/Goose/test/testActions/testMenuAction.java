package testActions;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.action.comm.MenuAction;

public class testMenuAction {

	protected ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	protected MenuAction menuAction = (MenuAction) ctx.getBean("menuAction");
	
	
	@Test
	public void testList() {
		assertEquals(menuAction.list(), "list");
	}

	@Test
	public void testGet() {
		assertEquals(menuAction.get(), "edit");
	}

	@Test
	public void testSave() {
		assertEquals(menuAction.save(), "getList");
	}

	@Test
	public void testDel() {
		assertEquals(menuAction.del(), "getList");
	}

	@Test
	public void testGetCommMenu() {
		assertEquals(menuAction.getCommMenu() == null, Boolean.FALSE);
	}

	@Test
	public void testGetMenuList() {
		assertEquals(menuAction.getMenuList() == null, Boolean.FALSE);
	}

}
