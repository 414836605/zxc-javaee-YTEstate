package cn.ytwy.oa.service;

import java.io.File;

import cn.ytwy.oa.entity.Salary;


public interface SalaryService extends BaseService<Salary> {

	File selectAllCreateXls();
	 
}
