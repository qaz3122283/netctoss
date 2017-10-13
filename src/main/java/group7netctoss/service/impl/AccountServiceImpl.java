/**
 * 
 */
package group7netctoss.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import group7netctoss.dao.AccountDao;
import group7netctoss.dao.ServiceDao;
import group7netctoss.entity.Account;
import group7netctoss.service.AccountService;

/**
 * @author xx
 *
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {
@Resource
private AccountDao accountDao;
@Resource
private ServiceDao serviceDao;
	/* (non-Javadoc)
	 * @see group7netctoss.service.AccountService#insertAccount(group7netctoss.entity.Account)
	 */
	@Override
	public boolean insertAccount(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.insertAccount(account);
		if(i>0) return true;
		return false;
	}

	/* (non-Javadoc)
	 * @see group7netctoss.service.AccountService#deleteAccount(group7netctoss.entity.Account)
	 */
	@Override
	public boolean deleteAccount(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.deleteAccount(account);
		int j=accountDao.deleteService(account);
		if(i>0&&j>=0) return true;
		return false;
	}

	/* (non-Javadoc)
	 * @see group7netctoss.service.AccountService#updateAccount(group7netctoss.entity.Account)
	 */
	@Override
	public boolean updateAccount(Account account) {
		// TODO Auto-generated method stub
		int i=accountDao.updateAccount(account);
		if(i>0) return true;
		return false;
	}

	/* (non-Javadoc)
	 * @see group7netctoss.service.AccountService#selectAccount(group7netctoss.entity.Account)
	 */
	@Override
	public Account selectAccount(Account account) {
		// TODO Auto-generated method stub
		
		return accountDao.selectAccount(account);
	}

	/* (non-Javadoc)
	 * @see group7netctoss.service.AccountService#selectAllAccount()
	 */
	@Override
	public List<Account> selectAllAccount(Map map) {
		// TODO Auto-generated method stub
		return accountDao.selectAllAccount(map);
	}

	@Override
	public Account selectAccountById(Account account) {
		// TODO Auto-generated method stub
		return accountDao.selectAccountById(account);
	}

	@Override
	public Account selectAccountByAcc(Account account) {
		// TODO Auto-generated method stub
		return accountDao.selectAccountByAcc(account);
	}

	@Override
	public List<Account> selectAllAccountByCodi(Map map) {
		// TODO Auto-generated method stub
		return accountDao.selectAllAccountByCodi(map);
	}

	@Override
	public boolean updateAccountState(Account account) {
		int j = 0;
		int i=accountDao.updateAccountState(account);
		if(account.getAcc_state()==0)
		 j=accountDao.updateServiceState(account);
		if(i>0&&j>=0) return true;
		return false;
	}


	

}
