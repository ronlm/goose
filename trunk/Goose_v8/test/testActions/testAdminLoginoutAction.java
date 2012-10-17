package testActions;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.action.comm.AdminLoginoutAction;

public class testAdminLoginoutAction {

	protected ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	protected AdminLoginoutAction adminLoginoutAction = (AdminLoginoutAction) ctx.getBean("adminLoginoutAction");
	
	@Test
	public void testCommUserService(){
		assertEquals(adminLoginoutAction.getCommUserService() != null, Boolean.TRUE);
	}
	@Test
	public void testLogin() {
		//assertEquals(adminLoginoutAction.login(), "success");
	}

	@Test
	public void testLogout() {
		assertEquals(adminLoginoutAction.logout(), "failure");
	}

	@Test
	public void testGet() {
		assertEquals(adminLoginoutAction.get(), "edit");
	}

	@Test
	public void testSave() {
		assertEquals(adminLoginoutAction.save(), "edit");
	}

}
