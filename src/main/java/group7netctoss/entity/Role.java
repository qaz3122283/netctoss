/**
 * 
 */
package group7netctoss.entity;

import java.util.Arrays;
import java.util.List;


/**角色实体类
 * @author hp
 *
 */
public class Role {
	
	private int role_id;//角色ID
	private String role_name;//角色名称
	private List<Power> power;//角色权限
	
	private StringBuffer powers;
	private String[] rpowers;
	
	/**
	 * 
	 */
	public Role() {
		super();
	}
	/**
	 * @param role_id
	 */
	public Role(int role_id) {
		super();
		this.role_id = role_id;
	}
	/**获取角色ID
	 * @return the role_id
	 */
	public int getRole_id() {
		return role_id;
	}
	/**设置角色ID
	 * @param role_id the role_id to set
	 */
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	/**获取角色名称
	 * @return the role_name
	 */
	public String getRole_name() {
		return role_name;
	}
	/**设置角色名称
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	/**
	 * @return the powers
	 */
	public StringBuffer getPowers() {
		return powers;
	}
	/**
	 * @param powers the powers to set
	 */
	public void setPowers(StringBuffer powers) {
		this.powers = powers;
	}
	/**
	 * @return the rpowers
	 */
	public String[] getRpowers() {
		return rpowers;
	}
	/**
	 * @param rpowers the rpowers to set
	 */
	public void setRpowers(String[] rpowers) {
		this.rpowers = rpowers;
	}
	public List<Power> getPower() {
		return power;
	}
	public void setPower(List<Power> power) {
		this.power = power;
	}
	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", role_name=" + role_name + ", power=" + power + ", powers=" + powers
				+ ", rpowers=" + Arrays.toString(rpowers) + "]";
	}
}
