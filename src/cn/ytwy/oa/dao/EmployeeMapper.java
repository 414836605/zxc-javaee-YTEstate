package cn.ytwy.oa.dao;

import cn.ytwy.oa.entity.Employee;

public interface EmployeeMapper extends BaseMapper<Employee>{
    public Employee login(Employee employee); 
}