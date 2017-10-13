package group7netctoss.service;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Account;
import group7netctoss.entity.Service;



public interface ServiceService {
	/**
	 * 插入业务信息
	 */
	public boolean insertService(Service service);
	
	/**
	 * 删除业务信息
	 */
	public boolean deleteService(Service service);
	/**
	 * 更新业务信息
	 */
	public boolean updateService(Service service);
	
	/**
	 * 开通业务
	 */
	public boolean openService(Service service);
	
	/**
	 * 查询所有业务信息
	 */
	public List<Service> selectService();
	
	/**
	 * 根据条件查询
	 */
	public List<Service> selectServiceByCondi(Map map);
	
	
	/**
	 * 通过业务id查询
	 */
	public Service selectServiceById(Service service);
	
	/**
	 * 通过业务账号查询
	 */
	public Service selectServiceByAccount(Service service);
	
	/**
	 * 通过省份证id查询
	 * @param account
	 * @return
	 */
	public List<Service> selectServiceByIdCard(Map map);
	
	/**
	 * 查询总记录数
	 * @return
	 */
	public Integer selectServiceAllCount();
}
