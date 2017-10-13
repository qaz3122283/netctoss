package group7netctoss.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import group7netctoss.dao.AdminDao;
import group7netctoss.entity.Admin;
import group7netctoss.entity.Power;
import group7netctoss.entity.Role;
import group7netctoss.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Resource
	private RoleService roleService;
	@Resource
	private AdminDao adminDao;
	/**
	 * 显示所有Role
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleList.do")
	public String getAllRole(HttpServletRequest request){
		//查询总数，计算页数
		int i = roleService.selAllRoleCount();
		int pageSize=8;
		int page = (i%pageSize==0)?(i/pageSize):(i/pageSize)+1;
		//获取当前页数
		int cur = Integer.parseInt(request.getParameter("cur"))-1;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("begin",(cur*pageSize));
		map.put("size",pageSize);
		
		List<Role> roles = roleService.getAllRoleByLimit(map);;
		for(Role role:roles){
			StringBuffer stringBuffer=new StringBuffer("");
			for(Power power:role.getPower()){
				stringBuffer = stringBuffer.append(power.getPow_name()+" , ");
			}
			stringBuffer.deleteCharAt(stringBuffer.length()-2);
			role.setPowers(stringBuffer);
		}
		request.setAttribute("list",roles);
		request.setAttribute("count",page);
		request.setAttribute("sum",i);
		int a = cur+1;
		request.setAttribute("cur",a);
		
		return "view/role/role_list";
	}
	/**
	 * 添加Role
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleAdd.do")
	public void addRole(HttpServletRequest request,PrintWriter out){
		String name = request.getParameter("per_name");
		String role[] = request.getParameterValues("per");
		boolean b = false;
		if(role.length==0){
			b = false;
		}else{
			b = true;
		}
		List<Power> p = new ArrayList<Power>();
		for(int i =0;i<role.length;i++){
			int a = Integer.parseInt(role[i]);
			Power per = new Power();
			per.setPow_id(a);
			p.add(per);
		}
		Role r = new Role();
		r.setRole_name(name);
		r.setPower(p);
		int i = roleService.addRole(r);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	/**
	 * 删除role
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleDelete.do")
	public void deleteRole(String role_id,PrintWriter out){
		/*int rol_id = Integer.parseInt(request.getParameter("role_id"));*/
		Role role = new Role();
		role.setRole_id(Integer.parseInt(role_id));
		int i = roleService.deleteRole(role);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
	}

	/**
	 * 修改role
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleUpdate.do")
	public void updateRole(HttpServletRequest request,PrintWriter out){
		int rol_id = Integer.parseInt(request.getParameter("id"));
		String name = (String) request.getParameter("name");
		String[] per = request.getParameterValues("per");
		List<Power> lp = new ArrayList<Power>();
		for(int i =0;i<per.length;i++){
			int per_id = Integer.parseInt(per[i]);
			Power p = new Power();
			p.setPow_id(per_id);
			lp.add(p);
		}
		Role role = new Role();
		role.setRole_id(rol_id);
		role.setRole_name(name);
		role.setPower(lp);
		int i = roleService.updateRole(role);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}	
	}
	/**
	 * 显示要修改的role
	 * @param request
	 * @return
	 */
	@RequestMapping("/roleUpdateShow.do")
	public String updateShowRole(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("rol_id"));
		Role r = new Role();
		r.setRole_id(id);
		Role role = roleService.getRoleById(r);
		request.setAttribute("role",role);
		return "view/role/role_modi";
	}
	/**
	 * 查询当前已被使用的role
	 */
	@RequestMapping("/roleUseNow.do")
	public void useRoleNow(int role_id,PrintWriter out){
		int i = 0;
		List<Admin> admins = adminDao.selAllAdmin();
		for(Admin admin:admins){
			for(Role r:admin.getAdmin_role()){
				if(r.getRole_id()==role_id){
					i = 1;
				}
			}
		}
		out.print(i);
	}
}
