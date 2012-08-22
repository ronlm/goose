package com.scau.webService;

import java.util.ArrayList;

import javax.jws.WebService;

import com.scau.model.goose.Farm;

/**定义手持机操作的各种Web Service 方法
 * @author jianhao
 *
 */
@WebService
public interface IGooseService {
	
	
	/** 登录功能
	 * @param name
	 * @param password
	 * @return
	 */
	public int login(String name,String password);
	
	/** 获得全部的农场信息
	 * @return
	 */
	public ArrayList<Farm> getFarmList();
	
	/** 添加一个批次的鹅苗交付记录
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	public int addReceiveGoose(int farmId,ArrayList<Integer> gooseList);
	
	/** 添加一个批次的成品鹅收购收购记录
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	public int addTradeGoose(int farmId,ArrayList<Integer> gooseList);
	
	/** 添加一个批次的成品鹅出售记录
	 * @param retailerId
	 * @param gooseList
	 * @return
	 */
	public int addSaleGoose(int retailerId,ArrayList<Integer> gooseList);
	
}
