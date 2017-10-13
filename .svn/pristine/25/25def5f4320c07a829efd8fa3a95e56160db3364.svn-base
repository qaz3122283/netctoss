package group7netctoss.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import group7netctoss.dao.BillItemDao;
import group7netctoss.entity.BillItem;
import group7netctoss.service.BillItemService;

@Service("billItemService")
public class BillItemServiceImpl implements BillItemService {

	@Resource
	private BillItemDao billItemDao;
	
	@Override
	public List<BillItem> getBillItem(Map map) {
		// TODO Auto-generated method stub
		return billItemDao.selBillItem(map);
	}

}
