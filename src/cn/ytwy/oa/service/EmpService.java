package cn.ytwy.oa.service;

import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Entry;

public interface EmpService extends BaseService<Emp> {
	/**
	 * 登陆
	 * */
	public Emp login(Emp emp);
	
	/**
	 * 员工转正审批成功后加入到员工表
	 * @return 
	 * */
	public Integer insertEntry(Entry entry);
}
