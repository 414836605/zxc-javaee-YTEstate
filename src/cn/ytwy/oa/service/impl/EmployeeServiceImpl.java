package cn.ytwy.oa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ytwy.oa.dao.EmployeeMapper;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService {
	
	@Override
	public Employee login(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.login(employee);
	}
	
	@Autowired
	private EmployeeMapper employeeMapper;

}
