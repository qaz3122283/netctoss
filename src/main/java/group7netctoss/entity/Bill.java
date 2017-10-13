/**
 * 
 */
package group7netctoss.entity;

import java.util.Date;

/**
 * 业务账单表的实体类
 * @author Administrator
 *
 */
public class Bill {
	private int bill_id;
	private Account acc;
	private int bill_payway;
	private String payway;
	private double bill_cost;
	private Date bill_month;
	private int bill_pstate;
	private String pstate;
	/**
	 * 
	 */
	public Bill() {
		super();
	}
	
	public Bill(int bill_id, Date bill_month) {
		super();
		this.bill_id = bill_id;
		this.bill_month = bill_month;
	}

	/**
	 * @return the bill_id
	 */
	public int getBill_id() {
		return bill_id;
	}
	/**
	 * @param bill_id the bill_id to set
	 */
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	/**
	 * @return the bill_payway
	 */
	public int getBill_payway() {
		return bill_payway;
	}
	/**
	 * @param bill_payway the bill_payway to set
	 */
	public void setBill_payway(int bill_payway) {
		this.bill_payway = bill_payway;
		if(bill_payway==1){
			this.setPayway("线上支付");
		}
		if(bill_payway==2){
			this.setPayway("线下支付");
		}
	}
	/**
	 * @return the payway
	 */
	public String getPayway() {
		return payway;
	}
	/**
	 * @param payway the payway to set
	 */
	public void setPayway(String payway) {
		this.payway = payway;
	}
	/**
	 * @return the bill_cost
	 */
	public double getBill_cost() {
		return bill_cost;
	}
	/**
	 * @param bill_cost the bill_cost to set
	 */
	public void setBill_cost(double bill_cost) {
		this.bill_cost = bill_cost;
	}
	/**
	 * @return the bill_month
	 */
	public Date getBill_month() {
		return bill_month;
	}
	/**
	 * @param bill_month the bill_month to set
	 */
	public void setBill_month(Date bill_month) {
		this.bill_month = bill_month;
	}
	/**
	 * @return the bill_pstate
	 */
	public int getBill_pstate() {
		return bill_pstate;
	}
	/**
	 * @param bill_pstate the bill_pstate to set
	 */
	public void setBill_pstate(int bill_pstate) {
		this.bill_pstate = bill_pstate;
		if(bill_pstate==0){
			this.setPstate("未支付");
		}
		if(bill_pstate==1){
			this.setPstate("已支付");
		}
	}
	/**
	 * @return the pstate
	 */
	public String getPstate() {
		return pstate;
	}
	/**
	 * @param pstate the pstate to set
	 */
	public void setPstate(String pstate) {
		this.pstate = pstate;
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
	
}
