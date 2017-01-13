package cn.ytwy.oa.service;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Maintain;
import cn.ytwy.oa.entity.Page;

public interface MaintainService extends BaseService<Maintain> {

	public int updatepass(Maintain maintain);

	public Page<Maintain> selectPageNotCheck(Page<Maintain> page);

	public Page<Maintain> maintainNotAccept(Page<Maintain> page);
	 
}
