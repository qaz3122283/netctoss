/**
 * 
 */
package group7netctoss.dao;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Bill;


/**
 * 业务账单表的数据控制层
 * @author Administrator
 *
 */
public interface BillDao {
	/**
	 * 查询所有账单信息
	 * @return
	 */
	public List<Bill> selAllBills(Map map);
	/**
	 * 根据账务账号信息查询账单信息
	 * @param bill
	 * @return
	 */
	public List<Bill> selBillsByCondition(Map map);
	/**
	 * 查询三年账务账单条数
	 * @return
	 */
	public List<Bill> selBillsCount(Map map);
}
