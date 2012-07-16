import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.scau.model.comm.CommUser;
import com.scau.service.BaseService;
import com.scau.service.impl.comm.CommUserService;


public class testUserService {

	@Test
	public void testBaseService() {
		ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		BaseService<CommUser> service = (BaseService<CommUser>) ctx.getBean("baseService");
		
		List<CommUser> users = service.listAll(new CommUser());
		for(CommUser u:users){
			System.out.println(u.getUserName());
		}
		
	}

	//@Test
	public void testBaseService2() throws Exception {
		ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
		CommUserService service =  (CommUserService) ctx.getBean("commUserService");
		
		CommUser u = new CommUser();
		u.setUserName("test");
		u.setPassword("test");
		u.setRoleId(Long.valueOf(1));
		System.out.println(service.get(u).getId());
	}
}
