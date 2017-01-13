package cn.ytwy.oa.service;

import cn.ytwy.oa.entity.Employee;

public interface EmployeeService extends BaseService<Employee> {
	 public Employee login(Employee employee);
}
