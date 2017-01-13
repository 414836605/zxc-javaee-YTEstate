package cn.ytwy.oa.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ytwy.oa.dao.EmpMapper;
import cn.ytwy.oa.dao.EmployeeMapper;
import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Entry;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;

@Service("empService")
public class EmpServiceImpl extends BaseServiceImpl<Emp> implements EmpService {

	@Override
	public Emp login(Emp emp) {
		return empMapper.login(emp);
	}
	
	public Integer insertEntry(Entry entry){
		Emp emp = new Emp();
		
	    emp.setEmpName(entry.getEntryName());
		emp.setUserAsNmae();
		emp.setPwdAs123456();
		emp.setDeptId(entry.getDeptId());
		emp.setJobId(entry.getJobId());
		emp.setRoleAsJob();
		emp.setEmpSex(entry.getEntrySex());
		emp.setEmpBirthdateAs1993();
		emp.setEmpEmail(entry.getEntryEmail());
		emp.setEmpPhone(entry.getEntryPhone());
		emp.setEmpAddress(entry.getEntryAddress());
		emp.setEmpInfo(entry.getEntryInfo());
		
		return baseMapper.insert(emp);
		
	}
	
}
