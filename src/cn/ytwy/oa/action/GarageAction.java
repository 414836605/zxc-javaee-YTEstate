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
import cn.ytwy.oa.entity.Garage;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuildService;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.GarageService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/garage")
public class GarageAction extends BaseAction {
	
	@Resource
	GarageService garageService;
	//显示build
	@RequestMapping(value="/index")
	public String index(){

		return goURL("base", "garage");

	}
	//显示addPage
	@RequestMapping(value="/addPage")
	public String addPage(){

		return goURL("base", "garage_add");

	}
	//显示updatePage
	@RequestMapping(value="/updatePage")
	public String updatePage(@RequestParam("data") Integer id,HttpServletRequest request){

		Garage garage = new Garage();
		garage.setGarageId(id);
		request.setAttribute("garage", garageService.select(garage));
		
		return goURL("base", "garage_update");

	}
	
	
	
	//插入
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Garage garage){
		
		int i = 0;
		try {
			i = garageService.insert(garage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//修改
	@RequestMapping(value="/update")
	@ResponseBody
	public Integer update(Garage garage){
		
		int i = 0;
		try {
			i = garageService.update(garage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//删除
	@RequestMapping(value="/delete")
	@ResponseBody
	public Integer delete(Garage garage){

		
		int i = 0;
		try {
			i = garageService.delete(garage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//分页查询
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Garage> page){
		
		
		Page p = garageService.selectPage(page);
		
		return p.getReturndata();

	}


}
