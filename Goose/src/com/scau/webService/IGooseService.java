package com.scau.webService;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.scau.model.webService.FarmWs;
import com.scau.model.webService.RetailerWs;



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
	
	/** 脚环防伪
	 * @param gooseId
	 * @return 1：为公司所发放的脚环  0：非本公司发放脚环
	 */
	@WebMethod
	public int authenticate(String gooseId);
	
	/** 鹅脚环的销号处理־
	 * @param gooseId
	 * @return 0：操作成功 1：操作出错
	 */
	@WebMethod
	public int setInvalid(String gooseId);
}
