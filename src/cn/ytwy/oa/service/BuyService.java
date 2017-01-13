package cn.ytwy.oa.service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Page;

public interface BuyService extends BaseService<Buy> {

	public int updatepass(Buy buy);
	

	public Page<Buy> selectPageNotCheck(Page<Buy> page);
	 
}
