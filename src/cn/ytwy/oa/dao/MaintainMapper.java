package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Maintain;
import cn.ytwy.oa.entity.Page;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MaintainMapper extends BaseMapper<Maintain>{

	int updatepass(Maintain maintain);

	Integer selectPageNotCheckCount(Page<Maintain> page);

	List<Maintain> selectPageNotCheckList(Page<Maintain> page);

	Integer selectPageNotAcceptCount(Page<Maintain> page);

	List<Maintain> selectPageNotAcceptList(Page<Maintain> page);
    
}