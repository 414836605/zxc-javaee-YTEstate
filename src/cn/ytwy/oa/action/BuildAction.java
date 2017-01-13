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
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuildService;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/build")
public class BuildAction extends BaseAction {
	
	@Resource
	BuildService buildService;
	//显示build
	@RequestMapping(value="/index")
	public String index(){

		return goURL("base", "build");

	}
	//显示addPage
	@RequestMapping(value="/addPage")
	public String addPage(){

		return goURL("base", "build_add");

	}
	//显示updatePage
	@RequestMapping(value="/updatePage")
	public String updatePage(@RequestParam("data") Integer id,HttpServletRequest request){

		Build build = new Build();
		build.setBuildId(id);
		request.setAttribute("build", buildService.select(build));
		
		return goURL("base", "build_update");

	}
	
	
	
	//插入
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Build build){
		
		int i = 0;
		try {
			i = buildService.insert(build);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//修改
	@RequestMapping(value="/update")
	@ResponseBody
	public Integer update(Build build){
		
		int i = 0;
		try {
			i = buildService.update(build);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	//删除
	@RequestMapping(value="/delete")
	@ResponseBody
	public Integer delete(Build build){

		
		int i = 0;
		try {
			i = buildService.delete(build);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//分页查询
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Build> page){
		
		
		Page p = buildService.selectPage(page);
		
		return p.getReturndata();

	}


}
