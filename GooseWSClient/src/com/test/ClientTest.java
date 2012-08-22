package com.test;  
  
import java.util.List;  
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;  

import com.scau.webService.IGooseService;
  
public class ClientTest {  
    public static void main(String[] args) {
    	String url = "http://localhost:8090/gooseWebServices";
        //����WebService�ͻ��˴�����     
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();     
        //ע��WebService�ӿ�     
        factory.setServiceClass(IGooseService.class);     
        //����WebService��ַ     
        factory.setAddress(url);          
        IGooseService service = (IGooseService)factory.create();    
        
        
        System.out.println("invoke userinfo webservice...");  
        
       
        
        // ����Map  
//      testMap(userServices);  
        // ����List  
        //testList(userServices);  
        // ����Array  
//      testArray(userServices);  
        System.exit(0);     
    }   
   
}  