/**
 * 
 */
package group7netctoss.entity;

import java.sql.Timestamp;

/**
 * 资费表
 * @author Administrator
 *
 */
public class Fee {

	private int fee_id;//资费id
	private String fee_name;//资费名称
	private int fee_time;//基本时长（套餐） 
	private double fee_basecost;//基本费用
	private double fee_unitcost;//单位费用
	private Timestamp fee_startdate;//创建时间
	private Timestamp fee_date;//开通时间
	private int fee_type;//资费类型（1：包月2：套餐3：计时）
	private String fee_comment;//资费说明
	private int fee_state;//资费状态（0:暂停1：开通）
	/**
	 * 
	 */
	public Fee() {
		super();
	}
	
	
	
	public Fee(int fee_id) {
		super();
		this.fee_id = fee_id;
	}



	public int getFee_id() {
		return fee_id;
	}
	public void setFee_id(int fee_id) {
		this.fee_id = fee_id;
	}
	public String getFee_name() {
		return fee_name;
	}
	public void setFee_name(String fee_name) {
		this.fee_name = fee_name;
	}
	public int getFee_time() {
		return fee_time;
	}
	public void setFee_time(int fee_time) {
		this.fee_time = fee_time;
	}
	public double getFee_basecost() {
		return fee_basecost;
	}
	public void setFee_basecost(double fee_basecost) {
		this.fee_basecost = fee_basecost;
	}
	public double getFee_unitcost() {
		return fee_unitcost;
	}
	public void setFee_unitcost(double fee_unitcost) {
		this.fee_unitcost = fee_unitcost;
	}
	public Timestamp getFee_startdate() {
		return fee_startdate;
	}
	public void setFee_startdate(Timestamp fee_startdate) {
		this.fee_startdate = fee_startdate;
	}
	public Timestamp getFee_date() {
		return fee_date;
	}
	public void setFee_date(Timestamp fee_date) {
		this.fee_date = fee_date;
	}
	public int getFee_type() {
		return fee_type;
	}
	public void setFee_type(int fee_type) {
		this.fee_type = fee_type;
	}
	public String getFee_comment() {
		return fee_comment;
	}
	public void setFee_comment(String fee_comment) {
		this.fee_comment = fee_comment;
	}
	public int getFee_state() {
		return fee_state;
	}
	public void setFee_state(int fee_state) {
		this.fee_state = fee_state;
	}
	
	
}
