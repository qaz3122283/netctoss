package group7netctoss.dao;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Admin;
import group7netctoss.entity.Role;



public interface AdminDao {
	/**
	 * 登录时查询
	 */
	public Admin login(Admin admin);
	
	/**
	 * 查询所有管理员
	 */
	public List<Admin> selAllAdmin();
	/**
	 * 查询所有Admin（分页）
	 */
	public List<Admin> selAllAdminByLimit(Map map);
	/**
	 * 通过id查管理员
	 */
	public Admin selAdminByid(Admin admin);
	/**
	 * 删除管理员
	 * @param admin
	 * @return
	 */
	public int delAdmin(Admin admin);
	/**
	 * 修改管理员信息
	 */
	public int updAdmin(Admin admin);
	/**
	 * 增加管理员
	 * @param admin
	 * @return
	 */
	public int addAdmin(Admin admin);
	/**
	 * 删除管理员对应角色
	 */
	public int delRoleByAdmin(Admin admin);
	/**
	 * 添加管理员对应角色
	 */
	public int addRoleByAdmin(Map map);
	/**
	 * 条件查询管理员
	 */
	public List<Admin> selAdminBy(Map map);
	/**
	 * 修改管理员个人信息（姓名，电话，邮箱）
	 */
	public int updateAdminInfo(Admin admin);
	/**
	 * 修改管理员密码
	 */
	public int updateAdminPsw(Admin admin);
	/**
	 * 查询所有管理员数量
	 */
	public int selAdminCount();
}
