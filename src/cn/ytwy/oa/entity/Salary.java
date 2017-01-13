package cn.ytwy.oa.entity;

import java.util.Date;

public class Salary {

	private Integer salaryId;
	private Integer empId;
	private String salaryBc;
	private Integer salaryDay;
	private Byte salaryAttendance;
	private Integer salaryAdd;
	private Integer salaryFull;
	private Integer salaryOvertimeMoney;
	private Integer salaryOvertimeDay;
	private Integer salarySubsidy;
	private Integer salaryMeal;
	private Integer salaryDeductPhone;
	private Integer salaryDeductFine;
	private Integer salaryDeductTax;
	private Integer salaryDeductInsurance;
	private Date salaryTime;
	
	private String empName;
	private String empIdcard;

	private Integer jobId;
	
	private String empJobDetail;
	private Integer salaryTimeIncome;
	private Integer salaryOverTimeIncome;
	private Integer salaryIncome;
	private Integer salaryDeduct;
	private Integer salarySum;
	
	public Integer getSalaryTimeIncome(){
		return this.salaryDay * this.salaryAttendance;
	}
	
	public Integer getSalaryOverTimeIncome(){
		return this.salaryOvertimeDay * this.salaryOvertimeMoney;
	}
	
	public Integer getSalaryIncome(){
		return this.getSalaryTimeIncome()
				+ this.getSalaryOverTimeIncome() 
				+ this.salaryAdd + this.salaryFull + this.salarySubsidy + this.salaryMeal;
	}
	
	public Integer getSalaryDeduct(){
		return this.salaryDeductPhone + this.salaryDeductFine + this.salaryDeductTax + this.salaryDeductInsurance;
	}
	
	public Integer getSalarySum(){
		return this.getSalaryIncome() - this.getSalaryDeduct();
	}
	
	public String getEmpJobDetail() {
    	switch (jobId) {
		case 1:
			return "开发者";
		case 2:
			return "普通员工";
		case 3:
			return "维修工";
		case 4:
			return "人资干事";
		case 5:
			return "会计";
		case 6:
			return "收费员";
		default:
			return "其他人员";
		}
		
	}
	
	public Integer getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(Integer salaryId) {
		this.salaryId = salaryId;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getSalaryBc() {
		return salaryBc;
	}

	public void setSalaryBc(String salaryBc) {
		this.salaryBc = salaryBc;
	}

	public Integer getSalaryDay() {
		return salaryDay;
	}

	public void setSalaryDay(Integer salaryDay) {
		this.salaryDay = salaryDay;
	}

	public Byte getSalaryAttendance() {
		return salaryAttendance;
	}

	public void setSalaryAttendance(Byte salaryAttendance) {
		this.salaryAttendance = salaryAttendance;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	

	public Integer getSalaryOvertimeMoney() {
		return salaryOvertimeMoney;
	}

	public void setSalaryOvertimeMoney(Integer salaryOvertimeMoney) {
		this.salaryOvertimeMoney = salaryOvertimeMoney;
	}

	public Integer getSalaryOvertimeDay() {
		return salaryOvertimeDay;
	}

	public void setSalaryOvertimeDay(Integer salaryOvertimeDay) {
		this.salaryOvertimeDay = salaryOvertimeDay;
	}

	public Integer getSalarySubsidy() {
		return salarySubsidy;
	}

	public void setSalarySubsidy(Integer salarySubsidy) {
		this.salarySubsidy = salarySubsidy;
	}

	public Integer getSalaryMeal() {
		return salaryMeal;
	}

	public void setSalaryMeal(Integer salaryMeal) {
		this.salaryMeal = salaryMeal;
	}

	public Integer getSalaryDeductPhone() {
		return salaryDeductPhone;
	}

	public void setSalaryDeductPhone(Integer salaryDeductPhone) {
		this.salaryDeductPhone = salaryDeductPhone;
	}

	public Integer getSalaryDeductFine() {
		return salaryDeductFine;
	}

	public void setSalaryDeductFine(Integer salaryDeductFine) {
		this.salaryDeductFine = salaryDeductFine;
	}

	public Integer getSalaryDeductTax() {
		return salaryDeductTax;
	}

	public void setSalaryDeductTax(Integer salaryDeductTax) {
		this.salaryDeductTax = salaryDeductTax;
	}

	public Integer getSalaryDeductInsurance() {
		return salaryDeductInsurance;
	}

	public void setSalaryDeductInsurance(Integer salaryDeductInsurance) {
		this.salaryDeductInsurance = salaryDeductInsurance;
	}

	public Integer getSalaryFull() {
		return salaryFull;
	}

	public void setSalaryFull(Integer salaryFull) {
		this.salaryFull = salaryFull;
	}

	public Integer getSalaryAdd() {
		return salaryAdd;
	}

	public void setSalaryAdd(Integer salaryAdd) {
		this.salaryAdd = salaryAdd;
	}

	public Date getSalaryTime() {
		return salaryTime;
	}

	public void setSalaryTime(Date salaryTime) {
		this.salaryTime = salaryTime;
	}

	public String getEmpIdcard() {
		return empIdcard;
	}

	public void setEmpIdcard(String empIdcard) {
		this.empIdcard = empIdcard;
	}
    
}