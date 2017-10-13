package group7netctoss.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import group7netctoss.entity.Admin;
import group7netctoss.entity.Role;
import group7netctoss.service.AdminService;
import group7netctoss.service.RoleService;
import group7netctoss.util.CaptchaUtil;


@Controller
@RequestMapping("/admin")
public class AdminController {
		
	@Resource
	private AdminService adminService;
	@Resource
	private RoleService roleService;
	
	Admin adminLogin = null;
	
	@RequestMapping("/adminList.do")
	public String getAllAdmin(HttpServletRequest request){
		//查询总数，计算页数
		int i = adminService.selAdminCount();
		int pageSize=9;
		int page = (i%pageSize==0)?(i/pageSize):(i/pageSize)+1;
		//获取当前页数
		int cur = Integer.parseInt(request.getParameter("cur"))-1;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("begin",(cur*pageSize));
		map.put("size",pageSize);
		
		List<Admin> la = adminService.selAdminByLimit(map);
		
		request.setAttribute("allAdmin_list",la);
		request.setAttribute("count",page);
		int a = cur+1;
		request.setAttribute("cur",a);
		request.setAttribute("sum",i);
		
		return "view/admin/admin_list";		
	}
	@RequestMapping("/adminModi.do")
	public String changeAdmin(HttpServletRequest request){
		Admin admin = new Admin();
		admin.setAdmin_id(Integer.parseInt(request.getParameter("admin_id")));
		Admin a = adminService.getAdminById(admin);
		request.setAttribute("adminShow",a);
		
		List<Role> role= roleService.getAllRole();
		request.setAttribute("role",role);
		return "view/admin/admin_modi";
	}
	/**
	 * 动态获取所有Role
	 * @param request
	 * @return
	 */
	@RequestMapping("/getRole.do")
	public String getRole(HttpServletRequest request){
		List<Role> role= roleService.getAllRole();
		request.setAttribute("role",role);
		return "view/admin/admin_add";
	}
	@RequestMapping("/adminUpdate.do")
	public void adminUpdate(HttpServletRequest request,PrintWriter out){
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String[] rol = request.getParameterValues("rol");
		
		List<Role> lr = new ArrayList<Role>();
		for(int i =0;i<rol.length;i++){
			int rol_id = Integer.parseInt(rol[i]);
			Role role = new Role();
			role.setRole_id(rol_id);
			lr.add(role);
		}
		Admin admin = new Admin();
		admin.setAdmin_id(id);
		admin.setAdmin_name(name);
		admin.setAdmin_tel(tel);
		admin.setAdmin_email(email);
		admin.setAdmin_role(lr);
		int i = adminService.updateAdmin(admin);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	/**
	 * 添加Admin
	 * @param file
	 * @param request
	 * @param out
	 */
	@RequestMapping("/adminAdd.do")
	public void addAdmin(HttpServletRequest request,PrintWriter out){
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String psw = request.getParameter("psw");
		
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		/*//上传文件
		*//**得到图片保存目录的真实路径**//*
		String path=request.getServletContext().getRealPath("/");
		System.out.println(path+"/upload"+file.getOriginalFilename());
		try {
			file.transferTo(new File(path+"/upload"+file.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String img = request.getParameter("userimg");
		String img = path+"/upload"+file.getOriginalFilename();*/
		
		String img = "zheshitupian";
		String[] rol = request.getParameterValues("rol");
		List<Role> roles = new ArrayList<Role>();
		for(int i=0;i<rol.length;i++){
			int rol_id = Integer.parseInt(rol[i]);
			Role r = new Role();
			r.setRole_id(rol_id);
			roles.add(r);
		}
		
		Admin admin = new Admin();
		admin.setAdmin_name(name);
		admin.setAdmin_account(username);
		admin.setAdmin_psw(psw);
		admin.setAdmin_photo(img);
		admin.setAdmin_tel(tel);
		admin.setAdmin_email(email);
		admin.setAdmin_role(roles);
		
		int i = adminService.insertAdmin(admin);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	/**
	 * 删除管理员
	 * @param admin_id
	 * @param out
	 */
	@RequestMapping("/adminDelete.do")
	public void deleteAdmin(int admin_id,PrintWriter out){
		Admin admin  = new Admin();
		admin.setAdmin_id(admin_id);
		int i = adminService.delAdmin(admin);
		if(i>0){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	//条件查询管理员
	@RequestMapping("/adminListBy.do")
	public String selAdminBy(HttpServletRequest request){
		int per = Integer.parseInt(request.getParameter("per"));
		String rol_name = request.getParameter("rolename");
		List<Admin> la = adminService.getAdminBy(per,rol_name);
		
		int i = la.size();

		request.setAttribute("allAdmin_list",la);
		request.setAttribute("cur","1");
		request.setAttribute("sum",i);
		request.setAttribute("rname",rol_name);
		request.setAttribute("pname",per);
		return "view/admin/admin_list";
	}
	//处理管理员登录
	@RequestMapping("/login.do")
	public String login(@RequestParam("admin_account")String admin_account,
						@RequestParam("admin_psw")String admin_psw,
						HttpSession session,
						HttpServletResponse response,
						Model model){
//		Map<String,Object> map = new HashMap<String,Object>();
		Admin admin = new Admin(admin_account,admin_psw);
		adminLogin = adminService.login(admin);
		if(adminLogin != null){	
			session.setAttribute("admin", adminLogin);
			return "view/index";	
		}else{
			session.setAttribute("admin", admin);
			model.addAttribute("msg", -1);
			//model.addAttribute("msg", -1);//用户名或密码错误
			return "view/login";
			//return "view/login";
		}
	}
	//处理管理员修改信息（姓名，电话，email）
	@RequestMapping("/modifyAdminInfo.do")
	@ResponseBody
	public Map<String,Object> ModifyAdminInfo(@RequestParam("admin_id")String admin_id,
								@RequestParam("admin_name")String admin_name,
								@RequestParam("admin_email")String admin_email,
								@RequestParam("admin_tel")String admin_tel,
								HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		Admin adminModi = new Admin(Integer.parseInt(admin_id),admin_name,admin_tel,admin_email);
		int m = adminService.modifyAdminInfo(adminModi);
		if(m>=0){
			adminLogin.setAdmin_name(admin_name);
			adminLogin.setAdmin_email(admin_email);
			adminLogin.setAdmin_tel(admin_tel);
			session.setAttribute("admin", adminLogin);
			map.put("msg", 1);
			map.put("adminModi", adminModi);
		
		} else {
			map.put("msg", 0);
		}
		return map;
	}

	// 处理管理员修改密码
	@RequestMapping("/modifyAdminPsw.do")
	public String ModifyAdminPsw(@RequestParam("admin_id") String admin_id,
								@RequestParam("admin_psw") String admin_psw,
								@RequestParam("oldpsw") String oldpsw,
								@RequestParam("newpsw1") String newpsw,
								Model model) {
		//ModelAndView mv = new ModelAndView();
		if(oldpsw!= null && oldpsw.length()!= 0){
			if(oldpsw.trim().equals(admin_psw)){
				int m = adminService.modifyAdminPsw(new Admin(Integer.parseInt(admin_id), newpsw));
				if (m >= 0) {
					//修改密码成功,进入登录界面！
					return "redirect:/view/login.jsp";
				} 
			}
			model.addAttribute("msg", -1);
			return "view/user/user_modi_pwd";
		}else{
			model.addAttribute("msg", -1);
			return "view/user/user_modi_pwd";
		}
	}

	// 密码重置
	@RequestMapping("/updateAdminPsw.do")
	public void updateAdminPsw(HttpServletRequest request, PrintWriter out) {
		String psw[] = request.getParameterValues("psw[]");
		List<Admin> admins = new ArrayList<Admin>();
		for (int i = 0; i < psw.length; i++) {
			Admin admin = new Admin();
			admin.setAdmin_id(Integer.parseInt(psw[i]));
			admin.setAdmin_psw("123");
			admins.add(admin);
		}
		int i = adminService.updateAdminPsw(admins);
		if (i > 0) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
	
}
