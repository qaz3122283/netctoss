/**
 * 
 */
package group7netctoss.service;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Account;



/**
 * @author xx
 *
 */
public interface AccountService {
	/*
	 * ��������
	 * */
	public boolean insertAccount(Account account);
	/*
	 * ɾ������
	 * */
	public boolean deleteAccount(Account account);
	/*
	 * �޸�����
	 * */
	public boolean updateAccount(Account account);
	/*
	 * ��ѯ����
	 * */
	public Account selectAccount(Account account);
	/*
	 * ��ѯ��������
	 * */
	public List<Account> selectAllAccount(Map map);
	
	
	/**
	 * @author caobowen
	 * @param account
	 * @return
	 * 通过id查询账务信息
	 */
	public Account selectAccountById(Account account);
	
	/**
	 * @author caobowen
	 * @param account
	 * @return
	 * 通过账务账号查询账务id
	 */
	public Account selectAccountByAcc(Account account);
	
	/**
	 * @author caobowen
	 * @param map
	 * @return
	 * 条件查询
	 */
	
	public List<Account> selectAllAccountByCodi(Map map);
	
	/**
	 * 改变账务账号状态
	 * 徐翔
	 */
	public boolean updateAccountState(Account account);
	
}
