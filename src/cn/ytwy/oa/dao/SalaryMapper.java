package cn.ytwy.oa.dao;

import java.util.List;

import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Salary;


public interface SalaryMapper extends BaseMapper<Salary>{

	List<Salary> selectAll();

    
}