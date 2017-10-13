package group7netctoss.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import group7netctoss.dao.BillDao;
import group7netctoss.entity.Bill;
import group7netctoss.service.BillService;

@Service("billService")
public class BillServiceImpl implements BillService {
	
	@Resource
	private BillDao billDao;
	
	@Override
	public List<Bill> getAllBills(Map map) {
		// TODO Auto-generated method stub
		return billDao.selAllBills(map);
	}

	@Override
	public List<Bill> getBillsByCondition(Map map) {
		// TODO Auto-generated method stub
		return billDao.selBillsByCondition(map);
	}

	@Override
	public int getBillsCount(Map map) {
		// TODO Auto-generated method stub
		return billDao.selBillsCount(map).size();
	}

}
