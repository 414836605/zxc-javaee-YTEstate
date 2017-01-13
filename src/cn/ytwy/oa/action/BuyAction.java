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
import cn.ytwy.oa.entity.Owner;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;
import cn.ytwy.oa.service.OwnerService;

@Controller
@RequestMapping("/buy")
public class BuyAction extends BaseAction {
	
	@Resource
	BuyService buyService;
	//显示申请
	@RequestMapping(value="/buy_application")
	public String buy_application(){

		return goURL("daily", "buy_application");

	}
	//显示审批
	@RequestMapping(value="/buy_check")
	public String buy_check(){

		return goURL("daily", "buy_check");

	}
	
	//显示审批详细
	@RequestMapping(value="/buy_detail")
	public String buy_detail(){

		return goURL("daily", "buy_detail");

	}

	
	//申请采购
	@RequestMapping(value="/insert")
	@ResponseBody
	public Integer insert(Buy buy){
		

		Date date = new Date();
		buy.setBuyTime(date);
		buy.setBuyStatus((byte) 0);
		int i = 0;
		try {
			i = buyService.insert(buy);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//修改是否通过审批
	@RequestMapping(value="/updatepass")
	@ResponseBody
	public Integer update(Buy buy){
		if(buy.getBuyReply() == null){
			buy.setBuyReply("");
		}
		int i = 0;
		try {
			i = buyService.updatepass(buy);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	//分页查询未审批
	@RequestMapping(value="/pageNotCheck")
	@ResponseBody
	public Object pageNotCheck(Page<Buy> page){
		

		
		Page p = buyService.selectPageNotCheck(page);
		
		return p.getReturndata();

	}
	
	//分页查询全部
	@RequestMapping(value="/page")
	@ResponseBody
	public Object page(Page<Buy> page){
		

		
		Page p = buyService.selectPage(page);
		
		return p.getReturndata();
	
	}


}
