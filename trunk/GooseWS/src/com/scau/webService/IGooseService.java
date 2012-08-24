package com.scau.webService;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.scau.model.goose.Retailer;
import com.scau.model.webService.FarmWs;



/**定义手持机操作的各种Web Service 方法
 * @author jianhao
 *
 */
@WebService
public interface IGooseService {
	
	/** 登录
	 * @param name
	 * @param password
	 * @return
	 */
	@WebMethod
	public boolean login(String name,String password);
	
	/** 获得全部的农场信息
	 * @return
	 */
	@WebMethod
	public List<FarmWs> getFarmList();
	
	/** 获得全部销售商信息
	 * @return
	 */
	//@WebMethod
	//public List<Retailer> getRetailerList();
	
	/** 添加一个批次的鹅苗交付记录
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addReceiveGoose(int farmId,ArrayList<String> gooseList);
	
	/** 添加一个批次的成品鹅收购收购记录
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addTradeGoose(int farmId,ArrayList<String> gooseList);
	
	/** 添加一个批次的成品鹅出售记录
	 * @param retailerId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addSaleGoose(int retailerId,ArrayList<String> gooseList);
	
	/** 验证鹅只的脚环真伪 
	 * @param gooseId
	 * @return 1：真品   0：假的
	 */
	@WebMethod
	public int Authenticate(String gooseId);
	
	/** 设置鹅只脚环无效，当鹅只死亡时，用些方法写上脚环失效标志
	 * @param gooseId
	 * @return
	 */
	@WebMethod
	public int setInvalid(String gooseId);
}
