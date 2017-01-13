package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Page;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface FeeMapper extends BaseMapper<Fee>{
	
	Integer selectPageCountJointOwner(Page<Fee> page);

	List<Fee> selectPageListJointOwner(Page<Fee> page);
	
	
	Integer selectPageCountJointOwnerUseDyc(Page<Fee> page);

	List<Fee> selectPageListJointOwnerUseDyc(Page<Fee> page);

	Integer pay(Integer id);


	List<Fee> selectAllJointOwnerPayed();


}