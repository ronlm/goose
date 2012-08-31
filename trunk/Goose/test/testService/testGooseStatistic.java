package testService;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.goose.vo.FarmStock;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class testGooseStatistic {
	protected static ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	static GooseService gooseService = (GooseService) ctx.getBean("gooseService");
	static ReceiveGooseService receiveGooseService = (ReceiveGooseService) ctx.getBean("receiveGooseService");
	static TradeGooseService tradeGooseService = (TradeGooseService) ctx.getBean("tradeGooseService");
	static FarmService farmService = (FarmService) BeansUtil.get("farmService");
	static char[] CHARS = "0123456789ABCDEF".toCharArray();
	
	@Test
	public void testGetGooseStock(){
		List<Farm> farmList = farmService.findByCondition(1,10,"from com.scau.model.goose.Farm f order by f.id asc");
		
		//String queryString = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + findFarmIdQueryString + "'";
		for(Farm f :farmList){
			//找出所有属于某个农场的所有接收鹅苗批次
			ReceiveGoose rg = new ReceiveGoose();
			rg.setFarmId(f.getId());	
			List<ReceiveGoose>	receiveList = receiveGooseService.list(rg);
			long gooseNum = 0;
			for(ReceiveGoose receiveGoose : receiveList){
				//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
				/*goose = new Goose();
				goose.setReceiveId(receiveGoose.getId());
				goose.setIsValid(1);*/
				String queryString = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + receiveGoose.getId() + "' and "
						+ "g.isValid ='1'";
								
				try {
					gooseNum = gooseNum + gooseService.getRecordCount(queryString);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(gooseNum);
			}
			
		}
	}
}
