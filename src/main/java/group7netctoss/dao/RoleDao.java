package group7netctoss.dao;

import java.util.List;
import java.util.Map;


import group7netctoss.entity.Admin;
import group7netctoss.entity.Role;



public interface RoleDao {
	/**
	 * 查询管理员对应的角色
	 */
	public List<Role> roleByAdmin(Admin admin);
	/**
	 * 根据id查询Role
	 */
	public Role selRoleById(Role role);
	/**
	 * 查询所有角色
	 */
	public List<Role> selAllRole();
	/**
	 * 查询所有Role（分页）
	 */
	public List<Role> selAllRoleByLimit(Map map);
	/**
	 * 添加角色
	 */
	public int addRole(Role role);
	/**
	 * 添加角色对应权限
	 */
	public int addPerByRoleId(Map map);
	/**
	 * 删除角色
	 */
	public int delRoleById(Role role);
	/**
	 * 修改角色
	 */
	public int updRoleName(Role role);
	/**
	 * 删除角色对应权限
	 */
	public int delRolPerById(Role role);
	/**
	 * 通过管理员id查询管理员角色集合
	 * @param admin
	 * @return
	 */
	public List<Role> selRolesById(Admin admin);
	/**
	 * 查询所有角色数量
	 */
	public int selAllRoleCount();
	
}
