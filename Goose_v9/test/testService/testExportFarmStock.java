package testService;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;

import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scau.excelExport.ExportFarmStock;
import com.scau.model.goose.Farm;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmStockService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.FarmStock;

public class testExportFarmStock {
	protected static ApplicationContext  ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
	static GooseService gooseService = (GooseService) ctx.getBean("gooseService");
	static ReceiveGooseService receiveGooseService = (ReceiveGooseService) ctx.getBean("receiveGooseService");
	static TradeGooseService tradeGooseService = (TradeGooseService) ctx.getBean("tradeGooseService");
	static FarmService farmService = (FarmService) BeansUtil.get("farmService");
	static char[] CHARS = "0123456789ABCDEF".toCharArray();
	
	@Test
	public void test() throws Exception{
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
		ExportFarmStock exportFarmStock = new ExportFarmStock( new Date(new java.util.Date().getTime()).toString()+"日农场存栏表.xls", 
				stockList);
		FileOutputStream out = new FileOutputStream(new Date(new java.util.Date().getTime()).toString()+"日农场存栏表.xls");
		Workbook workbook = exportFarmStock.exportExcel();
		workbook.write(out);
		
		out.close();
		
		System.out.println("finish");
	}
	
}
