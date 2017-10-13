package group7netctoss.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import group7netctoss.dao.BillDetailDao;
import group7netctoss.entity.BillDetail;
import group7netctoss.service.BillDeatilService;

@Service("billDetailService")
public class BillDetailServiceImpl implements BillDeatilService {

	@Resource
	private BillDetailDao billDetailDao;
	
	@Override
	public List<BillDetail> getBillDetail(Map map) {
		// TODO Auto-generated method stub
		return billDetailDao.selBillDetail(map);
	}

}
