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

import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/owner")
public class OwnerAction extends BaseAction {
	
	@Resource
	OwnerService ownerService;
	//显示owner
	@RequestMapping(value="/index")
	public String index(){

		return goURL("base", "owner");

	}
	//显示addPage
	@RequestMapping(value="/addPage")
	public String addPage(){

		return goURL("base", "owner_add");

	}
	//显示updatePage
	@RequestMapping(value="/updatePage")
	public String updatePage(@RequestParam("data") Integer id,HttpServletRequest request){
		Owner owner = new Owner();
		owner.setOwnerId(id);
		request.setAttribute("owner", ownerService.select(owner));
		
		return goURL("base", "owner_update");

	}
	
	
	
	//插入
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Owner owner){
		
		
		owner.removeNull();
		
		int i = 0;
		try {
			i = ownerService.insert(owner);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//修改
	@RequestMapping(value="/update")
	@ResponseBody
	public Integer update(Owner owner){
		
		owner.removeNull();
		
		int i = 0;
		try {
			i = ownerService.update(owner);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//删除
	@RequestMapping(value="/delete")
	@ResponseBody
	public Integer delete(Owner owner){
		
		int i = 0;
		try {
			i = ownerService.delete(owner);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//分页查询
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Owner> page){
		
		
		Page p = ownerService.selectPage(page);
		
		return p.getReturndata();

	}


}
