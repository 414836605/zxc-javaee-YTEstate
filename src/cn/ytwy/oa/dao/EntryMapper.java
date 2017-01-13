package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Entry;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EntryMapper extends BaseMapper<Entry>{
    
	int updatepass(Entry entry);
}