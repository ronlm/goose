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

public class testGooseService {
	protected static ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	static GooseService gooseService = (GooseService) ctx.getBean("gooseService");
	static ReceiveGooseService receiveGooseService = (ReceiveGooseService) ctx.getBean("receiveGooseService");
	static TradeGooseService tradeGooseService = (TradeGooseService) ctx.getBean("tradeGooseService");
	
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
			g.setReceiveId(rg.getId());
			gooses.add(g);
		}
		gooseService.batchAdd(gooses);
	}
	
	
	public static void main(String[] args) {
		for(int i=0;i<140;i++){
			if(i%3 == 0){
				int farmId = (int) (Math.random() * 50 % 8);	
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 30, getDateBefore(i));
			}
			if(i%4 == 0){
				int farmId = (int) (Math.random() * 50 % 8);	
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 30, getDateBefore(i));
			}
			if(i%5 == 0){
				int farmId = (int) (Math.random() * 50 % 8);	
				addGooseReceive(farmId, (int) (Math.random() * 100 /1) * 30, getDateBefore(i));
			}
		}
		System.out.println("自动数据录入完成！！！！！！");
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
