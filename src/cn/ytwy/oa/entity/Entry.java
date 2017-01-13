package cn.ytwy.oa.entity;

import java.util.Date;

public class Entry {
    private Integer entryId;

    private String entryName;

    private String entrySex;

    private Date entryBirthdate;

    private String entryEmail;

    private String entryPhone;

    private String entryAddress;

    private String entryInfo;

    private Integer deptId;

    private Integer jobId;

    private Byte status;
    
    private String entryDeptDetail;
    
    private String entryJobDetail;
    
    public String getEntryJobDetail() {
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
    
    public String getEntryDeptDetail() {
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

    public Integer getEntryId() {
        return entryId;
    }

    public void setEntryId(Integer entryId) {
        this.entryId = entryId;
    }

    public String getEntryName() {
        return entryName;
    }

    public void setEntryName(String entryName) {
        this.entryName = entryName;
    }

    public String getEntrySex() {
        return entrySex;
    }

    public void setEntrySex(String entrySex) {
        this.entrySex = entrySex;
    }

    public Date getEntryBirthdate() {
        return entryBirthdate;
    }

    public void setEntryBirthdate(Date entryBirthdate) {
        this.entryBirthdate = entryBirthdate;
    }

    public String getEntryEmail() {
        return entryEmail;
    }

    public void setEntryEmail(String entryEmail) {
        this.entryEmail = entryEmail;
    }

    public String getEntryPhone() {
        return entryPhone;
    }

    public void setEntryPhone(String entryPhone) {
        this.entryPhone = entryPhone;
    }

    public String getEntryAddress() {
        return entryAddress;
    }

    public void setEntryAddress(String entryAddress) {
        this.entryAddress = entryAddress;
    }

    public String getEntryInfo() {
        return entryInfo;
    }

    public void setEntryInfo(String entryInfo) {
        this.entryInfo = entryInfo;
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


	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Entry [entryId=" + entryId + ", entryName=" + entryName
				+ ", entrySex=" + entrySex + ", entryBirthdate="
				+ entryBirthdate + ", entryEmail=" + entryEmail
				+ ", entryPhone=" + entryPhone + ", entryAddress="
				+ entryAddress + ", entryInfo=" + entryInfo + ", deptId="
				+ deptId + ", jobId=" + jobId + ", status=" + status
				+ ", entryDeptDetail=" + entryDeptDetail + ", entryJobDetail="
				+ entryJobDetail + "]";
	}
	
	
}