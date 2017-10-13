/**
 * 
 */
package group7netctoss.dao;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Account;
import group7netctoss.entity.Bill;
import group7netctoss.entity.Service;


 
/**
 * @author xx
 *
 */
public interface AccountDao{
	/*
	 * 插入账务账号
	 * */
	public int insertAccount(Account account);
	/*
	 * 删除账务账号
	 * */
	public int deleteAccount(Account account);
	public int deleteService(Account account);
	/**
	 * 修改账务账号
	 * 
	 */
	public int updateAccount(Account account);
	/*
	 * 搜索账务账号
	 * */
	public Account selectAccount(Account account);
	/*
	 * 查询所有账务账号
	 * */
	public List<Account> selectAllAccount(Map map);
	
	public Account selectAccountBySid(Service service);//�����˵�ģ����õ�
	
	public Account selectAccountByBid(Bill bill);
	
	/**
	 * @author caobowen
	 * @param map
	 * @return
	 */
	public List<Account> selectAllAccountByCodi(Map map);
	
	
	/**
	 * @author cbw
	 * @param accouunt
	 * @return
	 * 通过账务id查询账务信息
	 */
	public Account selectAccountById(Account accouunt);
	
	/**
	 * @author cbw
	 * @param account
	 * @return
	 * 通过账务账号查询账务信息
	 */
	public Account selectAccountByAcc(Account account);
	
	/**
	 * 改变账务账号状态
	 * 徐翔
	 */
	public int updateAccountState(Account account);
	public int updateServiceState(Account account);
}
