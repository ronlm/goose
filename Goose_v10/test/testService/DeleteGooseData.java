package testService;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import com.scau.model.goose.Farm;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.MutilThreadGooseService;
import com.scau.util.BeansUtil;

/** 你没看错，这个类是用于测试时，删除Goose表里的数据的
 * @author jianhao
 *
 */
public class DeleteGooseData {
	static FarmService farmService = (FarmService) BeansUtil.get("farmService");
	
	public static void deleteGoose(int daysBefore) {
		List<Farm> farmList = farmService.list(new Farm());
		final CountDownLatch begin = new CountDownLatch(1);
		final CountDownLatch end = new CountDownLatch(farmList.size());
		for (Farm farm : farmList) {
			MutilThreadGooseService mutilThreadGooseService = new MutilThreadGooseService(begin, end, daysBefore, farm);
			mutilThreadGooseService.start();
		}
		
		begin.countDown();
		long startTime = System.currentTimeMillis();

		try {
			end.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			long endTime = System.currentTimeMillis();
			System.out.println("delete spend time: " + (endTime - startTime));
		}
	}
	
	public static void main(String[] args) {
		DeleteGooseData.deleteGoose(365);
	}
	
}
