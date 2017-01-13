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


import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.entity.Entry;
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.EntryService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/entry")
public class EntryAction extends BaseAction {
	
	@Resource
	EntryService entryService;
	
	@Resource
	EmpService empService;
	//显示申请
	@RequestMapping(value="/entry_application")
	public String entry_application(){

		return goURL("personnel", "entry_application");

	}
	//显示入职审批
	@RequestMapping(value="/entry_check")
	public String entry_check(){

		return goURL("personnel", "entry_check");

	}
	//显示转正审批
	@RequestMapping(value="/regularworker_check")
	public String regularworker_check(){

		return goURL("personnel", "regularworker_check");

	}
	
	
	//申请入职
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Entry entry){
		
		int i = 0;
		try {
			i = entryService.insert(entry);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//修改是否通过审批
	@RequestMapping(value="/updatepass")
	@ResponseBody
	public Integer update(Entry entry){
		int i = 0;
		try {
			i = entryService.updatepass(entry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	//修改是否通过转正审批
	@RequestMapping(value="/updatepass_regularworker_check")
	@ResponseBody
	public Integer updatepass_regularworker_check(Entry entry){
		int i = 0;
		try {
			empService.insertEntry(entry);
			i = entryService.updatepass(entry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	//分页查询入职审批
	@RequestMapping(value="/pageNotCheckEntry")
	@ResponseBody
	public Object pageNotCheckEntry(Page<Entry> page){
		Entry entry = new Entry();
		entry.setStatus((byte) 0);
		page.setCondition(entry);
		Page p = entryService.selectPageUseDyc(page);
		
		return p.getReturndata();

	}
	
	//分页查询转正审批
	@RequestMapping(value="/pageNotCheckRegularworker")
	@ResponseBody
	public Object pageNotCheckRegularworker(Page<Entry> page){
		Entry entry = new Entry();
		entry.setStatus((byte) 1);
		page.setCondition(entry);
		Page p = entryService.selectPageUseDyc(page);
		
		return p.getReturndata();

	}
	


}
