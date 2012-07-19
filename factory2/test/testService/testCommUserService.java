package testService;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.comm.UserAction;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommUserService;
import com.scau.util.PageController;

public class testCommUserService {

	protected ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	protected CommUserService service = (CommUserService) ctx.getBean("commUserService");
	protected CommUser u = new CommUser(); 
	
	
	//@Test
	public void testCheckUser() throws BusinessException {
		u.setUserName("test");
		u.setPassword("test");
		long id = service.checkUser(u).getId();
		assertEquals(id,1L);
		
	}

	//@Test
	public void testSave() throws BusinessException {
		u.setUserName("test2");
		u.setPassword("test2");
		service.save(u);
	}

	//@Test
	public void testGet() {
		CommUser user = new CommUser();	
		user.setId(23L);
		
		CommUser ret = service.get(user, user.getId());
		System.out.println(ret.getUserName());
		long retId = ret.getId();
		assertEquals(11L,retId);	
		
	}

	//@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		CommUser user = new CommUser();
		user.setPassword("123445");
		user.setId(5L);
		user.setUserName("去死！");
		
		service.add(user);
	}
	
	//@Test
	public void testList(){
		//PageController page = (PageController) ctx.getBean("PageController");
		List<CommUser> users = service.list(u,2 , 9, null, null);
		int ret = users.size();
		assertEquals(9, ret);
	}

}
