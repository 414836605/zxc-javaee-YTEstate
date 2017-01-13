package cn.ytwy.oa.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.entity.Build;
import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuildService;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.FeeService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/fee")
public class FeeAction extends BaseAction {
	
	@Resource
	FeeService feeService;
	//显示index
	@RequestMapping(value="/index")
	public String index(){

		return goURL("fee", "fee");

	}
	
	
	//缴费
	@RequestMapping(value="/pay")
	@ResponseBody
	public Integer pay(Integer id){
		
		int i = 0;
		try {
			i = feeService.pay(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	//分页查询
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Fee> page){
		
		Page p = feeService.selectPageJointOwner(page);
		
		System.out.println(p.getReturndata());
		return p.getReturndata();

	}


}
