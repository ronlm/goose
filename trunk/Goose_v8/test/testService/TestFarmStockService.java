package testService;

import java.util.List;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;

import org.junit.Test;

import com.scau.model.goose.Farm;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmStockService;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.FarmStock;

public class TestFarmStockService {
	static FarmService farmService = (FarmService) BeansUtil.get("farmService");
	
	@Test
	public void test(){
		List<Farm> farmList = farmService.list(new Farm());
		List<FarmStock> stockList = new Vector<FarmStock>();
		final CountDownLatch begin = new CountDownLatch(1);
		final CountDownLatch end = new CountDownLatch(farmList.size());
		
		for (Farm farm : farmList) {
			FarmStockService farmStockService = new FarmStockService(stockList, farm,begin,end);
			farmStockService.start();	
		}
		begin.countDown();
		long startTime = System.currentTimeMillis();

		try {
			end.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			long endTime = System.currentTimeMillis();
			System.out.println("spend time: " + (endTime - startTime));
		}
		for (FarmStock farmStock : stockList) {
			System.out.println(farmStock.getStock());
		}
		System.out.println(stockList.size());
	}
}
