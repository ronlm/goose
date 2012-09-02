package testService;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.TradeGooseService;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class DataAutoInput {
	protected static ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	static GooseService gooseService = (GooseService) ctx.getBean("gooseService");
	static ReceiveGooseService receiveGooseService = (ReceiveGooseService) ctx.getBean("receiveGooseService");
	static TradeGooseService tradeGooseService = (TradeGooseService) ctx.getBean("tradeGooseService");
	static char[] CHARS = "0123456789ABCDEF".toCharArray();
	
	//以下用于输入测试数据 新建一条鹅苗交付记录
	public static void addGooseReceive(long farmId,int num,Date date){
		ReceiveGoose rg = new ReceiveGoose();
		rg.setFarmId(farmId);
		rg.setAmount(num);
		rg.setReceiveDate(date);
		receiveGooseService.add(rg);
		rg = receiveGooseService.get(rg);
		
		List<Goose> gooses = new ArrayList<Goose>();
		for(int i = 0;i< num;i++){
			Goose g = new Goose();
			g.setIsValid(1);
			g.setRingId(genernateRingId());
			g.setReceiveId(rg.getId());
			gooses.add(g);
		}
		gooseService.batchAdd(gooses);
	}
	
	
	public static void main(String[] args) {
		for(int i=0;i<1200;i++){
			// 从今天的前1200天内自动生成数据
			if(i%3 == 0){
				int farmId = (int) (Math.random() * 50 % 11) + 1;	
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 44, getDateBefore(i));
			}
			if(i%5 == 0){
				int farmId = (int) (Math.random() * 50 % 11) + 1;	
				//加入n*100只鹅
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 34, getDateBefore(i));
			}
			if(i%7 == 0){
				int farmId = (int) (Math.random() * 50 % 11) + 1;	
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 30, getDateBefore(i));
			}
		}
		System.out.println("自动数据录入完成！！！！！！");
	}
	
	
	public static String genernateRingId(){
		StringBuffer ringIdBuffer = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			ringIdBuffer.append(CHARS[(int) (Math.random()*100%16)]);
		}
		return ringIdBuffer.toString();
	}
	
	public static Date getDateBefore(long daysBefore){
		if(daysBefore < 0){
			return new Date(0);
		}
		else {
			long millisecondsInterval = daysBefore * 24 * 3600 * 1000;
			java.util.Date today = new java.util.Date();
			Date tar = new Date(today.getTime() - millisecondsInterval);
			return tar;	
		}
	}
}
