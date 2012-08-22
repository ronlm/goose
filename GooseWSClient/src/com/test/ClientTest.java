package com.test;  
  
import java.util.List;  
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;  

import com.scau.webService.IGooseService;
  
public class ClientTest {  
    public static void main(String[] args) {
    	String url = "http://localhost:8090/gooseWebServices";
        //创建WebService客户端代理工厂     
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();     
        //注册WebService接口     
        factory.setServiceClass(IGooseService.class);     
        //设置WebService地址     
        factory.setAddress(url);          
        IGooseService service = (IGooseService)factory.create();    
        
        
        System.out.println("invoke userinfo webservice...");  
        
       
        
        // 测试Map  
//      testMap(userServices);  
        // 测试List  
        //testList(userServices);  
        // 测试Array  
//      testArray(userServices);  
        System.exit(0);     
    }   
   
}  