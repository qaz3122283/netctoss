package group7netctoss.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import group7netctoss.entity.Account;
import group7netctoss.entity.PageCount;
import group7netctoss.service.AccountService;

/**
 * @author xx
 *
 */

	@Controller
	@RequestMapping("/account")
	public class AccountController {
		@Resource
		private AccountService accountService;
		
		
		@RequestMapping("/selectAllAccount.do")
		public String selectAllaccount(PageCount pc,HttpSession session){
			List<Account> account=new ArrayList();
			Map<String,Object> map = new HashMap<String,Object>();
			pc.setTotleNumber(accountService.selectAllAccount(map).size());
			map.put("pc", pc);
			account=accountService.selectAllAccount(map);
			session.setAttribute("accounts", account);
			session.setAttribute("pc", pc);
			return "view/account/account_list";
		}
		
		@RequestMapping("/sereach.do")
		public String sereach(PageCount pc,Account account,HttpServletRequest request,HttpSession session){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("acc", account);
			pc.setTotleNumber(accountService.selectAllAccountByCodi(map).size());
			map.put("pc", pc);
			session.setAttribute("accounts", accountService.selectAllAccountByCodi(map));
			request.setAttribute("showAccount", account);
			PageCount.setting(pc);
			request.setAttribute("pc", pc);
			return "forward:../view/account/account_list.jsp";
		}

		@RequestMapping("/AddAccountAction.do")
		public String AddaccountAction(HttpServletRequest request){
			int rSex = 0;
			int Acc_postcode=0;
			String name=request.getParameter("acc_name");
			String Acc_idcrad=request.getParameter("acc_idcard");
			String Acc_account=request.getParameter("acc_login");
			String psw=request.getParameter("acc_psw");
			String Acc_phonenum=request.getParameter("acc_tel");
			String recidcard=request.getParameter("acc_recidcard");
			String Acc_email=request.getParameter("acc_email");
			int job=Integer.parseInt(request.getParameter("acc_job"));
			String radSex=request.getParameter("acc_sex");
			String cP=request.getParameter("acc_zipcode");
			if(radSex!=null&&radSex!="")
				rSex=Integer.parseInt(radSex);
			String Acc_address=request.getParameter("acc_address");
			
			String qq=request.getParameter("acc_qq");
			
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
//			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		     String time = sdf.format(d);  
			System.out.println(d+"12");
			Account account=new Account();
			account.setAcc_name(name);
			account.setAcc_idcard(Acc_idcrad);
			account.setAcc_login(Acc_account);
			account.setAcc_psw(psw);
			account.setAcc_tel(Acc_phonenum);
			account.setAcc_recidcard(recidcard);
			account.setAcc_email(Acc_email);
			account.setAcc_job(job);
			account.setAcc_sex(rSex);
			account.setAcc_zipcode(cP);
			account.setAcc_qq(qq);
			/*account.setAcc_createtime(d);*/
			
			boolean b=accountService.insertAccount(account);
			if(b) return "redirect:selectAllAccount.do";
			return "error";
		}
	
		@RequestMapping("/MiddleAccountAction.do")
		public String MiddleaccountAction(HttpSession session,HttpServletRequest request){
			List<Account> allAccount=(List<Account>) session.getAttribute("accounts");
			String details=request.getParameter("details");
			String modify=request.getParameter("modify");
			System.out.println(details+",,"+modify);
			int id=-1;
			if(details==null&&modify!=null){
				 id=Integer.parseInt(modify);
				 for(Account c:allAccount){
						if(c.getAcc_id()==id){
							request.setAttribute("Accent", c);
							return "view/account/account_modi";
						}
					}
			}else if(details!=null&&modify==null){
				id=Integer.parseInt(details);
				for(Account c:allAccount){
					if(c.getAcc_id()==id){
						request.setAttribute("cl", c);
						return "view/account/account_detail";
					}
				}
			}else{
				return "error";
			}
			
			
			return "error";
		}
		@RequestMapping("/updateAccount.do")
		public void updateAccount(Account account,HttpServletResponse response,PrintWriter out,HttpServletRequest request){
			String psw=request.getParameter("acc_psw");
			String oldpsw=request.getParameter("oldpsw");
			System.out.println("密码"+psw+"lao"+oldpsw);
			if(psw!=null&&psw!="") account.setAcc_psw(psw);
			else account.setAcc_psw(oldpsw);
			boolean b=accountService.updateAccount(account);
			if(b) out.print(1);
			else out.print(0);
			
		}
		
		@RequestMapping("/deleteAccount.do")
		public void deleteaccount(HttpServletRequest request,HttpServletResponse response,PrintWriter out){
			
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int id=Integer.parseInt(request.getParameter("dele"));
			Timestamp  d = new Timestamp(System.currentTimeMillis());
			Account account=new Account();
			account.setAcc_id(id);
			account.setAcc_recordtime(d);
			boolean b=accountService.deleteAccount(account);
			if(b) out.print(1);
			else out.print(0);
		}
		@RequestMapping("/setState.do")
		public void setState(PrintWriter out,HttpServletRequest request){
			int acc_id=Integer.parseInt(request.getParameter("id"));
			int acc_state=Integer.parseInt(request.getParameter("state"));
			Timestamp d = null;	
			System.out.println(acc_state);
			if(acc_state==0){
				 d = new Timestamp(System.currentTimeMillis());
			}
			Account account=new Account();
			account.setAcc_id(acc_id);
			account.setAcc_state(acc_state);
			account.setAcc_recordtime(d);
			boolean b=accountService.updateAccountState(account);
			if(b) out.print(1);
			else out.print(0);
		}
		
}
