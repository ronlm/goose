package testService;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import com.scau.model.goose.SaleGoose;
import com.scau.service.BaseDao;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.util.BeansUtil;

public class testSaleStatistic {
	static SaleGooseService saleGooseService = (SaleGooseService) BeansUtil.get("saleGooseService");
	Date fromDate = new Date(-1) ;//默认 1970-01-01
	Date toDate = new Date(new java.util.Date().getTime());//默认今天
	static BaseDao<SaleGoose> dao = (BaseDao<SaleGoose>) BeansUtil.get("baseDao");
	@Test
	public void testSum() {
		String sumStr = "select sum(sg.amount),sum(sg.totalValue),sum(sg.totalWeight) from com.scau.model.goose.SaleGoose sg" +
				" where sg.retailerId ='" + 2l + "' and sg.saleDate between '" + fromDate +"' and '" + toDate + "'";
		System.out.println(sumStr);
		List<Object> tempResultList = saleGooseService.getSum(sumStr);
		//System.out.println(tempResultList.size());
		for ( Object o: tempResultList) {
			System.out.println(o.getClass().toString() + "  "+ o.toString());
		}
	
	}
}
