package cn.ytwy.oa.service.impl;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Entry;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.EntryService;


@Service("entryService")
public class EntryServiceImpl extends BaseServiceImpl<Entry> implements EntryService {

	@Override
	public int updatepass(Entry entry) {
		return entryMapper.updatepass(entry);
	}

}
