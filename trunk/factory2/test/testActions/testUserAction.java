package testActions;
import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.action.comm.UserAction;


public class testUserAction {

	protected ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	protected UserAction userAction = (UserAction) ctx.getBean("userAction");
	@Test
	public void testList() {
		assertEquals(userAction.list(), "list");
	}

	@Test
	public void testGet() {
		assertEquals(userAction.get(), "edit");
	}

	@Test
	public void testSave() {
		assertEquals(userAction.save(), "getList");
	}

	@Test
	public void testDel() {
		assertEquals(userAction.del(), "error");
	}

	@Test
	public void testGetCommUserService() {
		assertEquals(userAction.getCommUserService() == null, Boolean.TRUE);
	}

}
