package group7netctoss.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import group7netctoss.dao.AccountDao;
import group7netctoss.dao.ServiceDao;
import group7netctoss.entity.Account;
import group7netctoss.entity.Service;
import group7netctoss.service.ServiceService;

@org.springframework.stereotype.Service("serviceService")
public class ServiceServiceImpl implements ServiceService {
	
	@Resource
	private ServiceDao serviceDao;
	@Resource
	private AccountDao accountDao;

	@Override
	public boolean insertService(Service service) {
		// TODO Auto-generated method stub
		if(serviceDao.selectServiceByAccount(service)==null){
			Account account = accountDao.selectAccountById(new Account(service.getAcc_id()));
			if(account.getAcc_state()==1){
				service.setSer_state(1);
			}else{
				service.setSer_state(0);
			}
			if(serviceDao.insertService(service)>0)
				return true;
		}
		return false;
	}

	@Override
	public boolean deleteService(Service service) {
		// TODO Auto-generated method stub
		if(serviceDao.deleteService(service)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateService(Service service) {
		// TODO Auto-generated method stub
		if(serviceDao.updateService(service)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean openService(Service service) {
		// TODO Auto-generated method stub
		if(service!=null){
			Account account = serviceDao.selectServiceById(service).getAccount();
			if(account!=null){
				int ustatus = account.getAcc_state();
				System.out.println(ustatus);
				if(ustatus==1){
					service.setSer_state(1);
					if(serviceDao.deleteService(service)>0){
						return true;
					}
				}
			}
		}
		return false;
	}

	@Override
	public List<Service> selectService() {
		// TODO Auto-generated method stub
		return serviceDao.selectService();
	}

	@Override
	public Service selectServiceById(Service service) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceById(service);
	}

	@Override
	public Service selectServiceByAccount(Service service) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByAccount(service);
	}

	@Override
	public List<Service> selectServiceByCondi(Map map) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByCondi(map);
	}

	@Override
	public List<Service> selectServiceByIdCard(Map map) {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceByIdCard(map);
	}

	@Override
	public Integer selectServiceAllCount() {
		// TODO Auto-generated method stub
		return serviceDao.selectServiceAllCount();
	}

}
