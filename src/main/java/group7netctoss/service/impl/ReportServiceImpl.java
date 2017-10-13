package group7netctoss.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import group7netctoss.dao.ReportDao;
import group7netctoss.entity.Report;
import group7netctoss.service.ReportService;



@org.springframework.stereotype.Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Resource
	private ReportDao reportDao;
	
	@Override
	public List<Report> getAccountMonthtime() {
		// TODO Auto-generated method stub
		List<Report> lr = new ArrayList<Report>();
		lr = reportDao.selectAccountMonthtime();
		for(int i=0;i<lr.size();i++){
			//将Bill_month中的年和月取出转为字符串
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(lr.get(i).getBill().getBill_month());
			String month = String.valueOf(calendar.get(Calendar.YEAR))+"年"+
					String.valueOf(calendar.get(Calendar.MONTH)+1)+"月";
			lr.get(i).setBmonth(month);
			//将int类型的数据转为时长(秒)
			String accountSumTimeString= "";
			int accountMonthSumTime = lr.get(i).getAcount_month_sumtime();
			if((accountMonthSumTime/3600)==0){
				accountSumTimeString =String.valueOf(accountMonthSumTime/60)+"分";
			}else{
				accountSumTimeString = String.valueOf(accountMonthSumTime/3600)+"小时"+
				String.valueOf((accountMonthSumTime%3600)/60)+"分";
			}
			lr.get(i).setAccountSumTimeString(accountSumTimeString);
		}
		return lr;
	}

	@Override
	public List<Report> getSeripUseTimeRank() {
		// TODO Auto-generated method stub
		List<Report> lr = new ArrayList<Report>();
		lr = reportDao.selectSeripUseTimeRank();
		for(int i=0;i<lr.size();i++){
			//将int类型的数据转为时长(秒)
			int seripSumtme = lr.get(i).getSer_ip_sumtime();
			String seripSumTimeString = "";
			if(seripSumtme/3600==0){
				seripSumTimeString = String.valueOf(seripSumtme/60)+"分";
			}else{
				seripSumTimeString = String.valueOf(seripSumtme/3600)+"小时"+
						String.valueOf((seripSumtme%3600)/60)+"分";
			}
			lr.get(i).setSeripSumTimeString(seripSumTimeString);	
		}
		return lr;
	}

	@Override
	public List<Report> getSeripFtypeCount() {
		// TODO Auto-generated method stub
		return null;
	}

}
