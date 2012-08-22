package com.scau.webService;

import java.util.ArrayList;

import javax.jws.WebService;

import com.scau.model.goose.Farm;

/**�����ֳֻ������ĸ���Web Service ����
 * @author jianhao
 *
 */
@WebService
public interface IGooseService {
	
	
	/** ��¼����
	 * @param name
	 * @param password
	 * @return
	 */
	public int login(String name,String password);
	
	/** ���ȫ����ũ����Ϣ
	 * @return
	 */
	public ArrayList<Farm> getFarmList();
	
	/** ���һ�����εĶ��罻����¼
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	public int addReceiveGoose(int farmId,ArrayList<Integer> gooseList);
	
	/** ���һ�����εĳ�Ʒ���չ��չ���¼
	 * @param farmId
	 * @param gooseList
	 * @return
	 */
	public int addTradeGoose(int farmId,ArrayList<Integer> gooseList);
	
	/** ���һ�����εĳ�Ʒ����ۼ�¼
	 * @param retailerId
	 * @param gooseList
	 * @return
	 */
	public int addSaleGoose(int retailerId,ArrayList<Integer> gooseList);
	
}
