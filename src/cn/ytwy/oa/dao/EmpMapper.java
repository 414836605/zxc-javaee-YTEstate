package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Emp;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpMapper extends BaseMapper<Emp>{

	public Emp login(Emp emp);
    
}