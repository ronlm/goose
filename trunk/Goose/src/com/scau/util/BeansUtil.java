package com.scau.util;



import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/** 通过Spring 容器获得Spring 所管理的对象
 * @author jianhao
 *
 */

public class BeansUtil{
	
	protected static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	@SuppressWarnings("unchecked")
	public static Object get(String beanId) {
		return ctx.getBean(beanId);
	}
	
	
}
