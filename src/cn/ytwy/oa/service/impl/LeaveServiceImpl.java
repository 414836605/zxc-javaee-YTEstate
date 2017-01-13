package cn.ytwy.oa.service.impl;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Empleave;
import cn.ytwy.oa.entity.Entry;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.EntryService;
import cn.ytwy.oa.service.LeaveService;


@Service("leaveService")
public class LeaveServiceImpl extends BaseServiceImpl<Empleave> implements LeaveService {

	@Override
	public int updatepass(Empleave empleave) {
		return empleaveMapper.updatepass(empleave);
	}

}
