package cn.ytwy.oa.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ytwy.oa.entity.Empleave;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.LeaveService;



@Controller
@RequestMapping("/leave")
public class LeaveAction extends BaseAction {
	
	@Resource
	LeaveService leaveService;
	//显示申请
	@RequestMapping(value="/leave_application")
	public String leave_application(HttpServletRequest request, HttpSession session){
		request.setAttribute("emp", session.getAttribute("emp"));
		return goURL("personnel", "leave_application");

	}
	//显示请假
	@RequestMapping(value="/leave_check")
	public String leave_check(){

		return goURL("personnel", "leave_check");

	}
	//显示销假
	@RequestMapping(value="/leave_cancel")
	public String leave_cancel(){

		return goURL("personnel", "leave_cancel");

	}
	
	
	//申请入职
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Empleave empleave){
		int i = 0;
		try {
			i = leaveService.insert(empleave);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//修改是否通过审批
	@RequestMapping(value="/updatepass")
	@ResponseBody
	public Integer updatepass(Empleave empleave){
		int i = 0;
		try {
			i = leaveService.updatepass(empleave);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	

	//分页查询请假审批
	@RequestMapping(value="/pageNotCheckLeave")
	@ResponseBody
	public Object pageNotCheckLeave(Page<Empleave> page){
		Empleave empleave = new Empleave();
		empleave.setEmpleaveStatus((byte) 0);
		page.setCondition(empleave);
		Page p = leaveService.selectPageUseDyc(page);
		
		return p.getReturndata();

	}
	
	//分页查询销假
	@RequestMapping(value="/pageNotCheckCancel")
	@ResponseBody
	public Object pageNotCheckCancel(Page<Empleave> page){
		Empleave empleave = new Empleave();
		empleave.setEmpleaveStatus((byte) 1);
		page.setCondition(empleave);
		Page p = leaveService.selectPageUseDyc(page);
		
		return p.getReturndata();

	}
	


}
