package com.scau.service.impl.goose;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.ReceiveGoose;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.FarmStock;

/** 因查找一个农场的存栏时，使用Hql比较慢去查找全部农场的存栏，所以用多线程去各自执行
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class FarmStockService extends Thread{
	final CountDownLatch begin;
	final CountDownLatch end;
	
	private GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
	private ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
	private FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
	private List<FarmStock> stockList;
	private Farm farm;
	
	public FarmStock getFarmStock(Farm f) throws Exception{
		//找出所有属于某个农场的所有接收鹅苗批次:接收日期在今天的200天之内
		String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId()
				+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(200) + "' order by rg.receiveDate desc";
		List<ReceiveGoose>	receiveList = receiveGooseService.findByCondition(hql);
		
		long gooseNum = 0;
		for(ReceiveGoose receiveGoose : receiveList){
			String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + receiveGoose.getId() + "' and "
					+ "g.isValid ='1' and g.tradeId=null" ;
			gooseNum += gooseService.getRecordCount(gooseCondition);
		}
		FarmStock stock = new FarmStock();
		stock.setFarm(f);
		stock.setFarmer(farmerService.get(new Farmer(),f.getFarmerId()));
		stock.setStock(gooseNum);
		return stock;
	}
	//多线程计算每个农场的存栏数
	public void run(){
		if(null != farm){
			
			synchronized (farm) {
				try {
					begin.await();
					stockList.add(getFarmStock(farm));
				} catch (Exception e) {
					e.printStackTrace();
				}
				finally{
					end.countDown();
				}
			}
		}
	}
	/**
	 * 获得全部农场的存栏数
	 * @return
	 */
	public List<FarmStock> getTotalFarmStockList(){
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		List<Farm> totalFarmList = farmService.list(new Farm());
		
		final CountDownLatch begin = new CountDownLatch(1);
		final CountDownLatch end = new CountDownLatch(totalFarmList.size());
		List<FarmStock> totalFarmStockList = new LinkedList<FarmStock>();
		for(Farm f :totalFarmList){
			//计算全部农场的存栏量
			FarmStockService farmStockService = new FarmStockService(totalFarmStockList, f, begin, end);
			farmStockService.start();//启动每个个农户各自的线程
		}
		
		begin.countDown();
		long startTime = System.currentTimeMillis();
		try {
			end.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			long endTime = System.currentTimeMillis();
			System.out.println("stock spend time: " + (endTime - startTime) +"ms");
		}
		
		Collections.sort(totalFarmStockList,new FarmStock());
		return totalFarmStockList;
	}
	/**
	 * 这个构造方法用对全部农场统计存栏数量
	 * @param stockList
	 * @param begin
	 * @param end
	 */
	public FarmStockService(List<FarmStock> stockList,final CountDownLatch begin,
			final CountDownLatch end){
		this.begin = begin;
		this.end = end;
		this.stockList = stockList;
	}
	
	public FarmStockService(List<FarmStock> stockList,Farm farm,final CountDownLatch begin,
			final CountDownLatch end) {
		super();
		this.begin = begin;
		this.end = end;
		this.stockList = stockList;
		this.farm = farm;
	}

	public List<FarmStock> getStockList() {
		return stockList;
	}

	public void setStockList(List<FarmStock> stockList) {
		this.stockList = stockList;
	}
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	
	
}
