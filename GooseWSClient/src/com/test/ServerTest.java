package com.test;  
  
import java.net.URL;

import javax.xml.ws.Endpoint;   

import com.scau.webService.impl.GooseWebServiceImpl;
  
public class ServerTest {  
   
    public static void main(String[] args) {  
        // Æô¶¯·þÎñ  
    	String url = "http://localhost:8090/gooseWebServices";
    	Endpoint.publish(url, new GooseWebServiceImpl());
     
        System.out.println("Server ready...");     
       
    }  
}  