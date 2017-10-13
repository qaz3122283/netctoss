/**
 * 
 */
package group7netctoss.entity;

import java.util.Date;

/**
 * 业务账单明细表的实体类
 * @author Administrator
 *
 */
public class BillItem {
	private int item_id;
	private Bill bill;
	private Service ser;
	private Account acc;
	private double item_sumtime;
	private String sumtime;
	private double item_cost;
	private Date item_month;
	/**
	 * 
	 */
	public BillItem() {
		super();
	}
	/**
	 * @return the item_id
	 */
	public int getItem_id() {
		return item_id;
	}
	/**
	 * @param item_id the item_id to set
	 */
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	/**
	 * @return the item_sumtime
	 */
	public double getItem_sumtime() {
		return item_sumtime;
	}
	/**
	 * @param item_sumtime the item_sumtime to set
	 */
	public void setItem_sumtime(double item_sumtime) {
		this.item_sumtime = item_sumtime;
		int h = (int) (item_sumtime/3600);
		int m = (int)(item_sumtime%3600)/60;
		int s = (int)(item_sumtime%3600)%60;
		if(h>0){
			this.setSumtime(h+"小时"+m+"分"+s+"秒");
		}else if(m>0){
			this.setSumtime(m+"分"+s+"秒");
		}else{
			this.setSumtime(s+"秒");
		}
	}
	/**
	 * @return the item_cost
	 */
	public double getItem_cost() {
		return item_cost;
	}
	/**
	 * @param item_cost the item_cost to set
	 */
	public void setItem_cost(double item_cost) {
		this.item_cost = item_cost;
	}
	/**
	 * @return the item_month
	 */
	public Date getItem_month() {
		return item_month;
	}
	/**
	 * @param item_month the item_month to set
	 */
	public void setItem_month(Date item_month) {
		this.item_month = item_month;
	}
	/**
	 * @return the bill
	 */
	public Bill getBill() {
		return bill;
	}
	/**
	 * @param bill the bill to set
	 */
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	/**
	 * @return the ser
	 */
	public Service getSer() {
		return ser;
	}
	/**
	 * @param ser the ser to set
	 */
	public void setSer(Service ser) {
		this.ser = ser;
	}
	/**
	 * @return the acc
	 */
	public Account getAcc() {
		return acc;
	}
	/**
	 * @param acc the acc to set
	 */
	public void setAcc(Account acc) {
		this.acc = acc;
	}
	/**
	 * @return the sumtime
	 */
	public String getSumtime() {
		return sumtime;
	}
	/**
	 * @param sumtime the sumtime to set
	 */
	public void setSumtime(String sumtime) {
		this.sumtime = sumtime;
	}
	
}
