package cn.ytwy.oa.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.entity.Salary;
import cn.ytwy.oa.service.BuyService;
import cn.ytwy.oa.service.ExpendService;
import cn.ytwy.oa.service.FeeService;
import cn.ytwy.oa.service.SalaryService;
import cn.ytwy.oa.tool.Tool;

@Controller
@RequestMapping("/statistics")
public class StatisticsAction extends BaseAction {

	@Resource
	FeeService feeService;
	
	@Resource
	SalaryService salaryService;
	
	@Resource
	BuyService buyService;
	
	@Resource
	ExpendService expendService;

	// 显示income
	@RequestMapping(value = "/income")
	public String index() {

		return goURL("statistics", "income");

	}

	// 显示expend
	@RequestMapping(value = "/expend")
	public String expend() {

		return goURL("statistics", "expend");

	}
	// 显示salary
	@RequestMapping(value = "/salary")
	public String salary() {

		return goURL("statistics", "salary");

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
	
	@RequestMapping(value = "/download_income")   
    public ResponseEntity<byte[]> download_income() throws IOException {
    	
        File file = feeService.selectAllJointOwnerCreateXls();
        
        
        HttpHeaders headers = new HttpHeaders();    
        String fileName=new String("收入信息报表.xls".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);      
    }  

    
    @RequestMapping(value = "/download_expend")   
    public ResponseEntity<byte[]> download_expend() throws IOException {
    	
        File file = expendService.selectAllCreateXls();
        
        
        HttpHeaders headers = new HttpHeaders();    
        String fileName=new String("支出信息报表.xls".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);      
    }  
    
    @RequestMapping(value = "/download_salary")   
    public ResponseEntity<byte[]> download_salary() throws IOException {
    	
        File file = salaryService.selectAllCreateXls();
        
        
        HttpHeaders headers = new HttpHeaders();    
        String fileName=new String("工资信息报表.xls".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);      
    }  
}
