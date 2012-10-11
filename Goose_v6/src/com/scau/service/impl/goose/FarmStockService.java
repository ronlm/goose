package com.scau.service.impl.goose;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.model.goose.Farm;
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
	private List<FarmStock> stockList;
	private Farm farm;
	
	public FarmStock getFarmStock(Farm f) throws Exception{
		//找出所有属于某个农场的所有接收鹅苗批次:接收日期在今天的200天之内（打死你也不相信养一个鹅200天 + 吧）	
		String idHql = "select rg.id from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId()
				+" and rg.receiveDate >='" + gooseService.getDateBefore(200) + "' order by rg.receiveDate desc";
		
		long gooseNum = 0;
		String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId in(" +
									idHql +") and g.isValid =1 and g.tradeId is null and g.saleId is null" ;
		gooseNum = gooseService.getRecordCount(gooseCondition);
		FarmStock stock = new FarmStock();
		stock.setFarm(f);
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					end.countDown();
				}
			}
		}
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
