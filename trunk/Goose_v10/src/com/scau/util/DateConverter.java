package com.scau.util;

import java.text.SimpleDateFormat;
import java.sql.Date;
import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

public class DateConverter extends DefaultTypeConverter {  

    @Override 
    public Object convertValue(Object value, Class toType) { 
        if (toType == Date.class) {  //浏览器向服务器提交时，进行String to Date的转换 
            String[] params = (String[])value; 
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            String dateString=params[0];
            try {
				return  new java.sql.Date(format.parse(dateString).getTime());
			} catch (Exception e) {
				// TODO: handle exception
			}             
        } 
        else if (toType == String.class) {   //服务器向浏览器输出时，进行Date to String的类型转换 
            return value.toString();//输出的格式是yyyy-MM-dd 
        } 
        
        return super.convertValue(value, toType); 
    }

}