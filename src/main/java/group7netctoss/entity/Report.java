/**
 * 
 */
package group7netctoss.entity;

/**
 * 报表实体类
 * @author Pro451
 *
 */
public class Report {
	private Account account;//账务账号
	private Service service;//业务
	private Bill bill;//账单
	private int year;//年份
	private int month;//月份
	private String bmonth;//月份字符串
	private int ftype1;//1，代表资费类型为包月
	private int ftype2;//2，代表资费类型为套餐
	private int ftype3;//3，代表资费类型为计时
	private int acount_month_sumtime;//用户月使用时长
	private String accountSumTimeString;//用户月使用时长字符串
	private int ser_ip_sumtime;//服务器累计时长
	private String seripSumTimeString;//服务器累计时长字符串
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//每位客户每月的累计时长
	public Report(Account account, Bill bill, int year, String bmonth, int acount_month_sumtime,
			String accountSumTimeString) {
		super();
		this.account = account;
		this.bill = bill;
		this.year = year;
		this.bmonth = bmonth;
		this.acount_month_sumtime = acount_month_sumtime;
		this.accountSumTimeString = accountSumTimeString;
	}
	
	public Report(Account account, Bill bill, int year, int month, int acount_month_sumtime) {
		super();
		this.account = account;
		this.bill = bill;
		this.year = year;
		this.month = month;
		this.acount_month_sumtime = acount_month_sumtime;
	}

	public Report(Account account, Bill bill, int acount_month_sumtime) {
		super();
		this.account = account;
		this.bill = bill;
		this.acount_month_sumtime = acount_month_sumtime;
	}

	//每台服务器上累计时长最高的前三名客户
	public Report(Account account, Service service, int ser_ip_sumtime, String seripSumTimeString) {
		super();
		this.account = account;
		this.service = service;
		this.ser_ip_sumtime = ser_ip_sumtime;
		this.seripSumTimeString = seripSumTimeString;
	}
	
	public Report(Account account, Service service, int ser_ip_sumtime) {
		super();
		this.account = account;
		this.service = service;
		this.ser_ip_sumtime = ser_ip_sumtime;
	}

	//每台服务器每种资费标准的使用次数
	//???
	
	public Account getAccount() {
		return account;
	}
	
	
	public void setAccount(Account account) {
		this.account = account;
	}
	public Service getService() {
		return service;
	}
	public void setService(Service service) {
		this.service = service;
	}
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public int getBill_year() {
		return year;
	}
	public void setBill_year(int bill_year) {
		this.year = bill_year;
	}
	public int getBill_month() {
		return month;
	}
	public void setBill_month(int bill_month) {
		this.month = bill_month;
	}
	public int getFtype1() {
		return ftype1;
	}
	public void setFtype1(int ftype1) {
		this.ftype1 = ftype1;
	}
	public int getFtype2() {
		return ftype2;
	}
	public void setFtype2(int ftype2) {
		this.ftype2 = ftype2;
	}
	public int getFtype3() {
		return ftype3;
	}
	public void setFtype3(int ftype3) {
		this.ftype3 = ftype3;
	}
	public int getAcount_month_sumtime() {
		return acount_month_sumtime;
	}
	public void setAcount_month_sumtime(int acount_month_sumtime) {
		this.acount_month_sumtime = acount_month_sumtime;
	}
	public String getAccountSumTimeString() {
		return accountSumTimeString;
	}
	public void setAccountSumTimeString(String accountSumTimeString) {
		this.accountSumTimeString = accountSumTimeString;
	}
	public int getSer_ip_sumtime() {
		return ser_ip_sumtime;
	}
	public void setSer_ip_sumtime(int ser_ip_sumtime) {
		this.ser_ip_sumtime = ser_ip_sumtime;
	}
	public String getSeripSumTimeString() {
		return seripSumTimeString;
	}
	public void setSeripSumTimeString(String seripSumTimeString) {
		this.seripSumTimeString = seripSumTimeString;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getBmonth() {
		return bmonth;
	}

	public void setBmonth(String bmonth) {
		this.bmonth = bmonth;
	}
	
}
