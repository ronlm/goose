package testService;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.comm.UserAction;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommUserService;

public class testCommUserService {

	protected ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	protected CommUserService service = (CommUserService) ctx.getBean("commUserService");
	protected CommUser u = new CommUser(); 
	
	
	@Test
	public void testCheckUser() throws BusinessException {
		u.setUserName("test");
		u.setPassword("test");
		long id = service.checkUser(u).getId();
		assertEquals(id,1L);
		
	}

	@Test
	public void testSave() throws BusinessException {
		u.setUserName("test2");
		u.setPassword("test2");
		service.save(u);
	}

	@Test
	public void testAdd() {
		u.setUserName("test3");
		u.setPassword("test3");
		long ret = service.add(u);
		assertEquals(ret,1L);
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		u.setUserName("test3");
		u.setPassword("test3");
		
		u = service.get(u);
		u.setRealName("fuck you");
		service.update(u);
	}

}
