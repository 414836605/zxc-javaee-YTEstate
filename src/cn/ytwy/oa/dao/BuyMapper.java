package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Page;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BuyMapper extends BaseMapper<Buy>{

	public int updatepass(Buy buy);

	public Integer selectPageNotCheckCount(Page<Buy> page);

	public List<Buy> selectPageNotCheckList(Page<Buy> page);

	
	public List<Buy> selectAllFinish();
   
}