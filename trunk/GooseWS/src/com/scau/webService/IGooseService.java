package com.scau.webService;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.scau.model.goose.Retailer;
import com.scau.model.webService.FarmWs;



/**�����ֳֻ������ĸ���Web Service ����
 * @author jianhao
 *
 */
@WebService
public interface IGooseService {
	
	/** ��¼
	 * @param name
	 * @param password
	 * @return
	 */
	@WebMethod
	public boolean login(String name,String password);
	
	/** ���ȫ����ũ����Ϣ
	 * @return
	 */
	@WebMethod
	public List<FarmWs> getFarmList();
	
	/** ���ȫ����������Ϣ
	 * @return
	 */
	//@WebMethod
	//public List<Retailer> getRetailerList();
	
	/** ���һ�����εĶ��罻����¼
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addReceiveGoose(int farmId,ArrayList<String> gooseList);
	
	/** ���һ�����εĳ�Ʒ���չ��չ���¼
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addTradeGoose(int farmId,ArrayList<String> gooseList);
	
	/** ���һ�����εĳ�Ʒ����ۼ�¼
	 * @param retailerId
	 * @param gooseList
	 * @return
	 */
	@WebMethod
	public int addSaleGoose(int retailerId,ArrayList<String> gooseList);
	
	/** ��֤��ֻ�ĽŻ���α 
	 * @param gooseId
	 * @return 1����Ʒ   0���ٵ�
	 */
	@WebMethod
	public int Authenticate(String gooseId);
	
	/** ���ö�ֻ�Ż���Ч������ֻ����ʱ����Щ����д�ϽŻ�ʧЧ��־
	 * @param gooseId
	 * @return
	 */
	@WebMethod
	public int setInvalid(String gooseId);
}
