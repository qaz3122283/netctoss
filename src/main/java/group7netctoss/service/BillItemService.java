/**
 * 
 */
package group7netctoss.service;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.BillItem;

/**
 * 业务账单明细表的业务层
 * @author Administrator
 *
 */
public interface BillItemService {
	/**
	 * 获取某一账单的详细信息
	 * @param item
	 * @return
	 */
	public List<BillItem> getBillItem(Map map);
}
