/**
 * 
 */
package group7netctoss.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * 管理员表
 * @author Administrator
 *
 */
public class Admin {
	private int admin_id;//管理员ID
	private String admin_name;//管理员姓名
	private String admin_account;//管理员登录账号
	private String admin_tel;//管理员电话
	private String admin_photo;//管理员照片
	private String admin_email;//管理员邮箱
	private String admin_psw;//管理员密码
	private Timestamp admin_date;//创建时间
	private List<Role> admin_role;//管理员角色集合
	private List<Power> admin_power;//管理员权限集合
	private String admin_role_string;//管理员角色字符串
	/**
	 * 
	 */
	public Admin() {
		super();
	}
	//管理员账号密码（登录）
	public Admin(String admin_account, String admin_psw) {
		super();
		this.admin_account = admin_account;
		this.admin_psw = admin_psw;
	}
		

	public Admin(int admin_id, String admin_name, String admin_tel, String admin_email) {
		super();
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_tel = admin_tel;
		this.admin_email = admin_email;
	}
		
	public Admin(int admin_id, String admin_psw) {
		super();
		this.admin_id = admin_id;
		this.admin_psw = admin_psw;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_account() {
		return admin_account;
	}
	public void setAdmin_account(String admin_account) {
		this.admin_account = admin_account;
	}
	public String getAdmin_tel() {
		return admin_tel;
	}
	public void setAdmin_tel(String admin_tel) {
		this.admin_tel = admin_tel;
	}
	public String getAdmin_photo() {
		return admin_photo;
	}
	public void setAdmin_photo(String admin_photo) {
		this.admin_photo = admin_photo;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_psw() {
		return admin_psw;
	}
	public void setAdmin_psw(String admin_psw) {
		this.admin_psw = admin_psw;
	}
	public List<Role> getAdmin_role() {
		return admin_role;
	}
	public void setAdmin_role(List<Role> admin_role) {
		this.admin_role = admin_role;
		String admin_role_string = "";
		for(int i = 0; i < admin_role.size(); i++){
			if( i != admin_role.size()-1){
				admin_role_string = admin_role_string + admin_role.get(i).getRole_name()+"、";
			}else{
				admin_role_string = admin_role_string + admin_role.get(i).getRole_name();
			}
		}
		this.setAdmin_role_string(admin_role_string);
	}
	public Timestamp getAdmin_date() {
		return admin_date;
	}
	public void setAdmin_date(Timestamp admin_date) {
		this.admin_date = admin_date;
	}
	public List<Power> getAdmin_power() {
		return admin_power;
	}
	public void setAdmin_power(List<Power> admin_power) {
		
		this.admin_power = admin_power;
	}
	public String getAdmin_role_string() {
		return admin_role_string;
	}
	public void setAdmin_role_string(String admin_role_string) {
		this.admin_role_string = admin_role_string;
	}
	
}
