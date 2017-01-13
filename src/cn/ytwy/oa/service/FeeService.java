package cn.ytwy.oa.service;

import java.io.File;
import java.util.Map;

import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Page;


public interface FeeService extends BaseService<Fee> {
	//联合用户表分页查询费用
	public Page<Fee> selectPageJointOwner(Page<Fee> page);
	
	//联合用户表分页查询费用（带条件）
	public Page<Fee> selectPageJointOwnerUseDyc(Page<Fee> page);
	
	//缴费
	public Integer pay(Integer id);

	public File selectAllJointOwnerCreateXls();
}
