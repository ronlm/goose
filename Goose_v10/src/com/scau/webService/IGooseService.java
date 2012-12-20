package com.scau.webService;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.scau.model.goose.DeadReason;
import com.scau.model.webService.FarmWs;
import com.scau.model.webService.ReceiveGooseWs;
import com.scau.model.webService.RetailerWs;
import com.scau.model.webService.SaleGooseWs;



/**为手持机提供的Web Service 可能的脚环数据操作
 * @author jianhao
 *
 */
@WebService
public interface IGooseService {
	
	/** 登录操作
	 * @param name
	 * @param password
	 * @return
	 */
	@WebMethod
	public boolean login(String name,String password);
	
	/**获得农场的信息
	 * @return
	 */
	@WebMethod
	public List<FarmWs> getFarmList();
	
	/** 获得销售商信息
	 * @return
	 */
	@WebMethod
	public List<RetailerWs> getRetailerList();
	
	/**添加一个公司向农场交付鹅苗批次
	 * @param farmId
	 * @param gooseList
	 * @return 0：操作成功 1：操作出错
	 */
	@WebMethod
	public int addReceiveGoose(long farmId,ArrayList<String> gooseList,String comments);
	
	/**添加一个公司向农场收购成品鹅的批次
	 * @param farmId
	 * @param gooseList
	 * @return 0：操作成功 1：操作出错
	 */
	@WebMethod
	public int addTradeGoose(long farmId, ArrayList<String> gooseList,Double totalWeight,Double unitPrice,String comments);
	
	/**添加一个公司向销售商出售成品鹅的批次
	 * @param retailerId
	 * @param gooseList
	 * @return 0：操作成功 1：操作出错
	 */
	@WebMethod
	public int addSaleGoose(long retailerId,ArrayList<String> gooseList,Double totalWeight,Double unitPrice,String comments);
	
	/** 读取脚环，获得该鹅苗批次的信息
	 * @param gooseId
	 * @return 
	 */
	@WebMethod
	public ReceiveGooseWs getReceiveInfo(String gooseId);
	
	/** 读取脚环，获得该鹅只销售批次的信息
	 * @param gooseId
	 * @return 
	 */
	@WebMethod
	public SaleGooseWs getSaleGooseInfo(String gooseId);
	
	
	/** 鹅脚环的销号处理־
	 * @param gooseId
	 * @return 0：操作成功 1：操作出错
	 */
	@WebMethod
	public int setInvalid(String gooseId);
	/**
	 * 鹅只死亡处理
	 * @param gooseId
	 * @param deadReasonId 死亡原因id
	 * @return
	 */
	@WebMethod
	public int setDeadGoose(String gooseId,long deadReasonId);
	
	/**
	 * 获得全部的死亡原因列表
	 * @return
	 */
	@WebMethod
	public List<DeadReason> getAllDeadReasons();
}
