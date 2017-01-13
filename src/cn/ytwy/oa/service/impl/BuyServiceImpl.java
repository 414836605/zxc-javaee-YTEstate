package cn.ytwy.oa.service.impl;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;


@Service("buyService")
public class BuyServiceImpl extends BaseServiceImpl<Buy> implements BuyService {

	@Override
	public int updatepass(Buy buy) {
		// TODO Auto-generated method stub
		return buyMapper.updatepass(buy);
	}

	@Override
	public Page<Buy> selectPageNotCheck(Page<Buy> page) {
		Integer pageCount = buyMapper.selectPageNotCheckCount(page);
		
		page.setData(buyMapper.selectPageNotCheckList(page));
		
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}
	
	
}
