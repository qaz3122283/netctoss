package group7netctoss.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import group7netctoss.entity.Fee;
import group7netctoss.entity.PageCount;
import group7netctoss.service.FeeService;



@Controller
@RequestMapping("/fee")
public class FeeController {
	
	@Resource
	private FeeService feeService;
	/**
	 * 查询所有记录数  分页
	 * @param pageSize
	 * @return
	 *//*
	@RequestMapping("/feePage.do")
	public @ResponseBody Integer feePage(Integer pageSize){
		Integer feecount = feeService.getAllCounts();
		return feecount;
	}
	*//**
	 * 显示资费列表
	 * @param request
	 * @return
	 *//*
	@RequestMapping("/feeList.do")
	@ResponseBody
	public List<Fee> feeList(@RequestParam(value="pageSize",required=false) Integer pageSize, 
			@RequestParam(value="currentPage",required=false, defaultValue="1") Integer currentPage){
		
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRecord", (currentPage-1)*pageSize);
		page.put("pageSize", pageSize);
		List<Fee> lf = feeService.getAllFee(page);
		return lf;
	}*/
	/**
	 * 显示所有资费列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/feeList.do")
	public String feeList(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		PageCount pc = new PageCount();
		pc.setTotleNumber(feeService.getAllCounts());
		map.put("pc", pc);
		map.put("rank", "fee_id");
		map.put("order", "asc");
		List<Fee> lf = feeService.getAllFee(map);
		HttpSession session = request.getSession();
		session.setAttribute("rank", "fee_id");
		session.setAttribute("order", "asc");
		session.setAttribute("classfee_unitcost", "sort_asc");
		session.setAttribute("classfee_basecost", "sort_asc");
		session.setAttribute("classfee_time", "sort_asc");
		request.setAttribute("lf", lf);
		request.setAttribute("pc", pc);
		return "/view/fee/fee_list";
	}

	/**
	 * 增加资费
	 * @param fee
	 * @param out
	 */
	@RequestMapping("/feeAdd")
	public void addFee(Fee fee,String time,String basecost,String unitcost,PrintWriter out){
		if(fee.getFee_name()==null||"".equals(fee.getFee_name())){
			out.println(-1);
		}else{
			if(!"".equals(time))
				fee.setFee_time(Integer.parseInt(time));
			if(!"".equals(basecost))
				fee.setFee_basecost(Double.parseDouble(basecost));
			if(!"".equals(unitcost))
				fee.setFee_unitcost(Double.parseDouble(unitcost));
			int i = feeService.addFee(fee);
			out.println(i);
		}
				
	}
	/**
	 * 显示修改资费的信息
	 * @param fee
	 * @param request
	 * @return
	 */
	@RequestMapping("/feeMessage")
	public String feeMessage(Fee fee,Model model){
		Fee fee1 = feeService.selectFeeByID(fee);
		model.addAttribute("fee", fee1);
		return "view/fee/fee_modi";
	}
	/**
	 * 修改资费
	 * @param fee
	 * @param out
	 * @return
	 */
	@RequestMapping("/feeModi")
	public String modiFee(Fee fee,PrintWriter out){		
		feeService.update(fee);
		return "redirect:/fee/feeList.do";		
	}
	
	/**
	 * 删除资费
	 * @param fee
	 * @param out
	 */
	@RequestMapping("/feeDel")
	public String delFee(Fee fee,PrintWriter out){		
		feeService.delFee(fee);
		return "redirect:/fee/feeList.do";
	}
	
	/**
	 * 启用资费
	 * @param fee
	 * @param out
	 */
	@RequestMapping("/feeStart")
	public String startFee(Fee fee,PrintWriter out){		
		int i = feeService.updateFeeState(fee);
		out.println(i);
		return "redirect:/fee/feeList.do";
	}
	
	/**
	 * 显示资费详情
	 * @param fee
	 * @return
	 */
	@RequestMapping("/feeDetail")
	public String feeDatial(Fee fee,Model model){
		Fee fee1 = feeService.selectFeeByID(fee);
		model.addAttribute("fee", fee1);
		return "/view/fee/fee_detail";
	}
	
	/**
	 * 资费排序
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/FeeRankAction")
	public String feeRank(HttpServletRequest request,Model model,PageCount pc){
		pc.setTotleNumber(feeService.getAllCounts());
		String rank = request.getParameter("rank");
		String order = request.getParameter("order");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rank", rank);
		map.put("order", order);
		map.put("pc", pc);
		List<Fee> lf = feeService.getAllFee(map);
		HttpSession session = request.getSession();
		session.setAttribute("rank", rank);
		session.setAttribute("order", order);
		session.setAttribute("class"+rank, "sort_"+order);
		request.setAttribute("lf", lf);
		request.setAttribute("pc", pc);
		return "/view/fee/fee_list";
	}
	
	/**
	 * 分页
	 * @param request
	 * @param model
	 * @param pc
	 * @return
	 */
	@RequestMapping("/TurnPage")
	public String turnPage(HttpServletRequest request,Model model,PageCount pc){
		HttpSession session = request.getSession();
		String rank = session.getAttribute("rank")+"";
		String order = session.getAttribute("order")+"";
		pc.setTotleNumber(feeService.getAllCounts());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rank", rank);
		map.put("order", order);
		map.put("pc", pc);
		List<Fee> lf = feeService.getAllFee(map);
		PageCount.setting(pc);
		request.setAttribute("lf", lf);
		request.setAttribute("pc", pc);
		return "/view/fee/fee_list";
	}
}
