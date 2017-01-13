package cn.ytwy.oa.entity;

import java.io.Serializable;
import java.util.Date;

import javax.xml.crypto.Data;

import cn.ytwy.oa.tool.Tool;

public class Emp implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 10362158837741782L;

	private Integer empId;

    private String empUser;

    private String empPassword;

    private Integer empRole;

    private String empName;

    private String empSex;

    private Date empBirthdate;

    private String empEmail;

    private String empPhone;

    private String empAddress;

    private String empInfo;

    private Integer deptId;

    private Integer jobId;

    private String empRoleDetail;
    
    private String empDeptDetail;
    
    private String empJobDetail;
    
    public void setRoleAsJob(){
    	this.empRole = this.jobId;
    }
    public void setUserAsNmae(){
    	this.empUser = this.empName;
    }
    public void setPwdAs123456(){
    	this.empPassword = "123456";
    }
    public void setEmpBirthdateAs1993(){
    	this.empBirthdate = Tool.createDateUseYear(1993);
    }
    
    public String getEmpRoleDetail() {
    	switch (empRole) {
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
    
    public String getEmpDeptDetail() {
    	switch (deptId) {
		case 1:
			return "开发部";
		case 2:
			return "服务部";
		case 3:
			return "维修部";
		case 4:
			return "人事部";
		case 5:
			return "财务部";
		case 6:
			return "收费部";
		default:
			return "其他部门";
		}
		
	}

	public void setEmpRoleDetail(String empRoleDetail) {
		this.empRoleDetail = empRoleDetail;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpUser() {
        return empUser;
    }

    public void setEmpUser(String empUser) {
        this.empUser = empUser;
    }

    public String getEmpPassword() {
        return empPassword;
    }

    public void setEmpPassword(String empPassword) {
        this.empPassword = empPassword;
    }

   
    public Integer getEmpRole() {
		return empRole;
	}

	public void setEmpRole(Integer empRole) {
		this.empRole = empRole;
	}

	public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex;
    }

    public Date getEmpBirthdate() {
        return empBirthdate;
    }

    public void setEmpBirthdate(Date empBirthdate) {
        this.empBirthdate = empBirthdate;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getEmpPhone() {
        return empPhone;
    }

    public void setEmpPhone(String empPhone) {
        this.empPhone = empPhone;
    }

    public String getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(String empAddress) {
        this.empAddress = empAddress;
    }

    public String getEmpInfo() {
        return empInfo;
    }

    public void setEmpInfo(String empInfo) {
        this.empInfo = empInfo;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empUser=" + empUser
				+ ", empPassword=" + empPassword + ", empRole=" + empRole
				+ ", empName=" + empName + ", empSex=" + empSex
				+ ", empBirthdate=" + empBirthdate + ", empEmail=" + empEmail
				+ ", empPhone=" + empPhone + ", empAddress=" + empAddress
				+ ", empInfo=" + empInfo + ", deptId=" + deptId + ", jobId="
				+ jobId + ", empRoleDetail=" + empRoleDetail
				+ ", empDeptDetail=" + empDeptDetail + ", empJobDetail="
				+ empJobDetail + "]";
	}
    
}