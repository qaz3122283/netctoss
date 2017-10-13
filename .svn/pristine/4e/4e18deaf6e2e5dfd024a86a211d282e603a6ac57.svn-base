/**
 * 
 */
package group7netctoss.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import group7netctoss.entity.Account;
import group7netctoss.entity.Bill;
import group7netctoss.entity.BillItem;
import group7netctoss.entity.PageCount;
import group7netctoss.service.BillItemService;

/**
 * 账单明细表的控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/billItem")
public class BillItemController {
	@Resource
	private BillItemService billItemService;
	
	@RequestMapping("/BillItemListController")
	public String showBillItem(Bill bill,Model model,PageCount pc){
		BillItem item = new BillItem();
		item.setBill(bill);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("item", item);
		System.out.println(pc.getPageSize());
		pc.setTotleNumber(billItemService.getBillItem(map).size());
		System.out.println(pc.getPageSize());
		PageCount.setting(pc);
		map.put("pc", pc);
		List<BillItem> litem = billItemService.getBillItem(map);
		if(!litem.isEmpty()){
			BillItem item1 = litem.get(0);
			model.addAttribute("item", item1);
		}
		model.addAttribute("pc", pc);
		model.addAttribute("litem", litem);
		return "view/bill/bill_item";
	}
}
