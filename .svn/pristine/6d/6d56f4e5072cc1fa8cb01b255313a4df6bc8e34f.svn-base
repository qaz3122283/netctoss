package group7netctoss.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import group7netctoss.dao.AdminDao;
import group7netctoss.dao.PowerDao;
import group7netctoss.dao.RoleDao;
import group7netctoss.entity.Admin;
import group7netctoss.entity.Role;
import group7netctoss.service.AdminService;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource
	private AdminDao adminDao;
//	@Resource
//	private RoleDao roleDao;
//	@Resource
//	private PowerDao powerDao;
	
	public List<Admin> getAllAdmin() {
		// TODO Auto-generated method stub
		return adminDao.selAllAdmin();
	}

	@Override
	public Admin getAdminById(Admin admin) {
		// TODO Auto-generated method stub			
		return adminDao.selAdminByid(admin);
	}

	@Override
	public int delAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.delAdmin(admin);
	}

	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		int i = 0;
		i = adminDao.updAdmin(admin);
		Map<String,Integer> map = new HashMap<String,Integer>();
		if(admin.getAdmin_role()!=null){
			int a = adminDao.delRoleByAdmin(admin);
			if(a>=0){
				for(Role role : admin.getAdmin_role()){
					map.put("admin_id",admin.getAdmin_id());
					map.put("role_id",role.getRole_id());
					//System.out.println(role.getRol_id()+"  "+p.getPer_id());
					i = adminDao.addRoleByAdmin(map);
				}
			}
		}
		return i;
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		int i = adminDao.addAdmin(admin);
		int a=0;
		Map<String,Integer> map = new HashMap<String,Integer>();
		if(i>0){
			for(Role role : admin.getAdmin_role()){
				map.put("admin_id",admin.getAdmin_id());
				map.put("role_id",role.getRole_id());
				a = adminDao.addRoleByAdmin(map);
			}
		}
		return a;
	}

	@Override
	public List<Admin> getAdminBy(int pow_id, String role_name) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pow_id",pow_id);
		map.put("role_name",role_name);
		List<Admin> la = adminDao.selAdminBy(map);
		return la;
	}

	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		Admin adminLogin = null;
		adminLogin = adminDao.login(admin);
		//System.out.println("admin.getAdmin_role():"+admin.getAdmin_role());
		//判断管理员的角色集合是否为空
		if(adminLogin != null){
			if(adminLogin.getAdmin_role()!= null && !adminLogin.getAdmin_role().isEmpty()){
				//设置管理员角色字符串
				adminLogin.setAdmin_role(adminLogin.getAdmin_role());
			}
		}
		return adminLogin;
	}

	@Override
	public int modifyAdminInfo(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateAdminInfo(admin);
	}

	@Override
	public int modifyAdminPsw(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateAdminPsw(admin);
	}

	@Override
	public int updateAdminPsw(List<Admin> admins) {
		// TODO Auto-generated method stub
		int i = 0;
		for(Admin admin : admins){
			int b = adminDao.updateAdminPsw(admin);
			i++;
		}
		return i;
	}

	@Override
	public int selAdminCount() {
		// TODO Auto-generated method stub
		return adminDao.selAdminCount();
	}

	@Override
	public List<Admin> selAdminByLimit(Map map) {
		// TODO Auto-generated method stub
		return adminDao.selAllAdminByLimit(map);
	}
	
	

}
