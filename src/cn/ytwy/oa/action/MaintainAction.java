package cn.ytwy.oa.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Maintain;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.MaintainService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/maintain")
public class MaintainAction extends BaseAction {
	
	@Resource
	MaintainService maintainService;
	//显示申请
	@RequestMapping(value="/maintain_application")
	public String maintain_application(){

		return goURL("daily", "maintain_application");

	}
	//显示审批
	@RequestMapping(value="/maintain_check")
	public String maintain_check(){

		return goURL("daily", "maintain_check");

	}
	
	//显示审批详细
	@RequestMapping(value="/maintain_accept")
	public String maintain_detail(){

		return goURL("daily", "maintain_accept");

	}

	
	//申请采购
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Maintain maintain){
		
		Date date = new Date();
		maintain.setMaintainTime(date);
		maintain.setMaintainStatus((byte) 0);
		int i = 0;
		try {
			i = maintainService.insert(maintain);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//修改是否通过审批
	@RequestMapping(value="/updatepass")
	@ResponseBody
	public Integer update(Maintain maintain){
		
		int i = 0;
		try {
			i = maintainService.updatepass(maintain);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	//分页查询未审批
	@RequestMapping(value="/maintainNotCheck")
	@ResponseBody
	public Object maintainNotCheck(Page<Maintain> page){
		
		
		Page p = maintainService.selectPageNotCheck(page);
		
		return p.getReturndata();

	}
	//分页查询未验收
	@RequestMapping(value="/maintainNotAccept")
	@ResponseBody
	public Object maintainNotAccept(Page<Maintain> page){
		
		
		Page p = maintainService.maintainNotAccept(page);
		
		return p.getReturndata();

	}
	//分页查询全部
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Maintain> page){
		
		
		Page p = maintainService.selectPage(page);
		
		return p.getReturndata();
	
	}


}
