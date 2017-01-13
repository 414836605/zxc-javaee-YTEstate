package cn.ytwy.oa.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.entity.Salary;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.FeeService;
import cn.ytwy.oa.service.SalaryService;
import cn.ytwy.oa.tool.Tool;

@Controller
@RequestMapping("/finace")
public class FianceAction extends BaseAction {

	@Resource
	FeeService feeService;
	
	@Resource
	SalaryService salaryService;
	
	@Resource
	BuyService buyService;

	// 显示income
	@RequestMapping(value = "/income")
	public String index() {

		return goURL("finace", "income");

	}

	// 显示expend
	@RequestMapping(value = "/expend")
	public String expend() {

		return goURL("finace", "expend");

	}
	// 显示salary
	@RequestMapping(value = "/salary")
	public String salary() {

		return goURL("finace", "salary");

	}

	// 缴费
	// @RequestMapping(value="/pay")
	// @ResponseBody
	// public Integer pay(Integer id){
	//
	// int i = 0;
	// try {
	// i = feeService.pay(id);
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// return i;
	// }

	// 分页查询
	@RequestMapping(value = "/page_fee")
	@ResponseBody
	public Object page_fee(Page<Fee> page) {
		//SearchText是get来的要转换编码
		page.setSearchText(Tool.iso8859ToUtf8(page.getSearchText()));
		
		Fee fee = new Fee();
		fee.setFeeType((byte) 1);

		page.setCondition(fee);

		Page p = feeService.selectPageJointOwnerUseDyc(page);

		return p.getReturndata();

	}

	// 分页查询
	@RequestMapping(value = "/page_salary")
	@ResponseBody
	public Object page_salary(Page<Salary> page) {
		//SearchText是get来的要转换编码
		page.setSearchText(Tool.iso8859ToUtf8(page.getSearchText()));

		Page p = salaryService.selectPage(page);

		return p.getReturndata();

	}

	// 分页查询
	@RequestMapping(value = "/page_buy")
	@ResponseBody
	public Object page_buy(Page<Buy> page) {
		//SearchText是get来的要转换编码
		page.setSearchText(Tool.iso8859ToUtf8(page.getSearchText()));
		
		Buy buy = new Buy();
		buy.setBuyStatus((byte) 1);
		
		page.setCondition(buy);

		Page p = buyService.selectPageUseDyc(page);

		return p.getReturndata();

	}

}
