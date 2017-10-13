/**
 * 
 */
package group7netctoss.entity;

import java.util.Date;

/**
 * 明细表的实体类
 * @author Administrator
 *
 */
public class BillDetail {
	private int det_id;
	private Service ser;
	private BillItem item;
	private Date det_intime;
	private Date det_outtime;
	private String det_ip;
	private double det_cost;
	private double det_duration;
	private String duration;
	/**
	 * 
	 */
	public BillDetail() {
		super();
	}
	/**
	 * @return the det_id
	 */
	public int getDet_id() {
		return det_id;
	}
	/**
	 * @param det_id the det_id to set
	 */
	public void setDet_id(int det_id) {
		this.det_id = det_id;
	}
	/**
	 * @return the det_intime
	 */
	public Date getDet_intime() {
		return det_intime;
	}
	/**
	 * @param det_intime the det_intime to set
	 */
	public void setDet_intime(Date det_intime) {
		this.det_intime = det_intime;
	}
	/**
	 * @return the det_outtime
	 */
	public Date getDet_outtime() {
		return det_outtime;
	}
	/**
	 * @param det_outtime the det_outtime to set
	 */
	public void setDet_outtime(Date det_outtime) {
		this.det_outtime = det_outtime;
	}
	/**
	 * @return the det_ip
	 */
	public String getDet_ip() {
		return det_ip;
	}
	/**
	 * @param det_ip the det_ip to set
	 */
	public void setDet_ip(String det_ip) {
		this.det_ip = det_ip;
	}
	/**
	 * @return the det_cost
	 */
	public double getDet_cost() {
		return det_cost;
	}
	/**
	 * @param det_cost the det_cost to set
	 */
	public void setDet_cost(double det_cost) {
		this.det_cost = det_cost;
	}
	/**
	 * @return the det_duration
	 */
	public double getDet_duration() {
		return det_duration;
	}
	/**
	 * @param det_duration the det_duration to set
	 */
	public void setDet_duration(double det_duration) {
		this.det_duration = det_duration;
		int h = (int) (det_duration/3600);
		int m = (int)(det_duration%3600)/60;
		int s = (int)(det_duration%3600)%60;
		if(h>0){
			this.setDuration(h+"小时"+m+"分"+s+"秒");
		}else if(m>0){
			this.setDuration(m+"分"+s+"秒");
		}else{
			this.setDuration(s+"秒");
		}
	}
	public Service getSer() {
		return ser;
	}
	public void setSer(Service ser) {
		this.ser = ser;
	}
	/**
	 * @return the duration
	 */
	public String getDuration() {
		return duration;
	}
	/**
	 * @param duration the duration to set
	 */
	public void setDuration(String duration) {
		this.duration = duration;
	}
	/**
	 * @return the item
	 */
	public BillItem getItem() {
		return item;
	}
	/**
	 * @param item the item to set
	 */
	public void setItem(BillItem item) {
		this.item = item;
	}
	
}
