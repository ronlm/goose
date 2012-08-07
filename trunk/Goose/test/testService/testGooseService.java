package testService;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.chainsaw.Main;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.model.goose.Farmer;
import com.scau.model.goose.Goose;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;

public class testGooseService {
	protected static ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	static GooseService gooseService = (GooseService) ctx.getBean("gooseService");
	
	public static void addGoose(long receiveId,int num){
		List<Goose> gooses = new ArrayList<Goose>();
		for(int i = 0;i< num;i++){
			Goose g = new Goose();
			g.setIsValid(1);
			g.setReceiveId(receiveId);
			gooses.add(g);
		}
		gooseService.batchAdd(gooses);
	}
	
	public static void main(String[] args) {
		addGoose(1l, 15);
		addGoose(2l, 10);
		
	}
}
