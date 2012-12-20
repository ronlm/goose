package com.scau.service.impl.goose;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.util.BeansUtil;

/**用多线程去各自执行删除每个农场的一定时间的鹅只数据
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class MutilThreadGooseService extends Thread{
	final CountDownLatch begin;
	final CountDownLatch end;
	
	private GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
	private ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
	private int daysBefore;//要删除daysBefore天以前的数据
	private Farm farm;
	/**
	 * 删除农场的daysBefort前的鹅只数据
	 * @param f
	 * @param daysBefore
	 * @throws Exception
	 */
	public  void DeleteGooseData(Farm f ,int daysBefore) throws Exception{
		//找出所有属于某个农场的所有dayBefore天以前的交付鹅苗批次记录
		List<ReceiveGoose> receiveGooses = receiveGooseService.findByCondition("from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId() +
											" and rg.receiveDate <'" + receiveGooseService.getDateBefore(daysBefore) + "'");
		try {
			for (ReceiveGoose receiveGoose : receiveGooses) {
				Goose goose = new Goose();
				goose.setReceiveId(receiveGoose.getId());
				List<Goose> gooseList = gooseService.list(goose);
				
				for (Goose goose2 : gooseList) {
					gooseService.delete(goose2);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			}
	}
	//多线程删除每个农场的鹅只数据
	public void run(){
		if(null != farm){
			
			synchronized (farm) {
				try {
					begin.await();
					DeleteGooseData(farm, daysBefore);
				} catch (Exception e) {
					e.printStackTrace();
				}
				finally{
					end.countDown();
				}
			}
		}
	}
	
	
	public MutilThreadGooseService(CountDownLatch begin, CountDownLatch end,
			int daysBefore, Farm farm) {
		super();
		this.begin = begin;
		this.end = end;
		this.daysBefore = daysBefore;
		this.farm = farm;
	}
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	
	
}
