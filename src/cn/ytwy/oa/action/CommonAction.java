package cn.ytwy.oa.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.common.MyRealm;
import cn.ytwy.oa.entity.Emp;
import cn.ytwy.oa.entity.Employee;
import cn.ytwy.oa.service.EmpService;
import cn.ytwy.oa.service.EmployeeService;

@Controller
@RequestMapping("/common")
public class CommonAction extends BaseAction {

	@Resource
	private EmpService empService;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, HttpSession session) {

		return goURL("index");
	}

	@RequestMapping(value = "/top")
	public String top(HttpServletRequest request, HttpSession session) {

		request.setAttribute("emp", session.getAttribute("emp"));
		return goURL("top");

	}

	@RequestMapping(value = "/left")
	public String left(HttpServletRequest request, HttpSession session) {

		request.setAttribute("emp", session.getAttribute("emp"));
		return goURL("left");

	}

	
	@RequestMapping(value = "/login")
	@ResponseBody
	public Object login(Emp emp, HttpSession session) {
		UsernamePasswordToken token = new UsernamePasswordToken(emp.getEmpUser(), emp.getEmpPassword());
		
		token.setRememberMe(true);
		
		Subject currentUser = SecurityUtils.getSubject(); 
		try {
			currentUser.login(token);
		}catch (Exception e) {
			// 登陆失败，返回state 0
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("state", 0);
			return map;
		}
			
		// 登陆成功，返回state 1
		// 存session
		Emp e = empService.login(emp);
		session.setAttribute("emp", e);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("state", 1);
		return map;
		
	}
}
