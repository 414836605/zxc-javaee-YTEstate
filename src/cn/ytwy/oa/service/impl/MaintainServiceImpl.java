package cn.ytwy.oa.service.impl;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Maintain;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.MaintainService;


@Service("maintainService")
public class MaintainServiceImpl extends BaseServiceImpl<Maintain> implements MaintainService {

	@Override
	public int updatepass(Maintain maintain) {
		// TODO Auto-generated method stub
		return maintainMapper.updatepass(maintain);
	}

	@Override
	public Page<Maintain> selectPageNotCheck(Page<Maintain> page) {
		Integer pageCount = maintainMapper.selectPageNotCheckCount(page);
		
		page.setData(maintainMapper.selectPageNotCheckList(page));
		
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}

	@Override
	public Page<Maintain> maintainNotAccept(Page<Maintain> page) {
		Integer pageCount = maintainMapper.selectPageNotAcceptCount(page);
		
		page.setData(maintainMapper.selectPageNotAcceptList(page));
		
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}
	
	
}
