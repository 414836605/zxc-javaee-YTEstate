package cn.ytwy.oa.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;

@Controller
@RequestMapping("/emp")
public class EmpAction extends BaseAction {
	
	@Resource
	private EmpService empService;

	// 显示index
	@RequestMapping(value = "/index")
	public String index() {

		return goURL("personnel", "employee");

	}

	// 显示addPage
	@RequestMapping(value = "/addPage")
	public String addPage() {

		return goURL("personnel", "employee_add");

	}

	// 显示updatePage
	@RequestMapping(value = "/updatePage")
	public String updatePage(@RequestParam("data") Integer id,
			HttpServletRequest request) {
		Emp emp = new Emp();
		emp.setEmpId(id);

		request.setAttribute("emp", empService.select(emp));

		return goURL("personnel", "employee_update");

	}

	
	// @RequestMapping("/doAjax")
	// @ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	// public Object doAjax(Supplier supplier){
	// supplier.setSupName("supName1");
	// return supplier;
	// }

	// 插入
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Integer insert(Emp emp) {

		emp.setEmpBirthdateAs1993();
		emp.setRoleAsJob();
		emp.setUserAsNmae();
		emp.setPwdAs123456();

		int i = 0;
		try {
			i = empService.insert(emp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	// 修改
	@RequestMapping(value = "/update")
	@ResponseBody
	public Integer update(Emp emp) {

		emp.setRoleAsJob();

		int i = 0;
		try {
			i = empService.update(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Integer delete(Emp emp) {

		int i = 0;
		try {
			i = empService.delete(emp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	// 分页查询
	@RequestMapping(value = "/page")
	@ResponseBody
	public Object page(Page<Emp> page) {

		Page p = empService.selectPage(page);

		return p.getReturndata();

	}
}
