package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Empleave;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpleaveMapper extends BaseMapper<Empleave>{

	int updatepass(Empleave empleave);
}