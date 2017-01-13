package cn.ytwy.oa.entity;

public class Empleave {
    private Integer empleaveId;

    private String empleaveName;

    private String empleavePhone;

    private String empleaveReason;

    private Integer empleaveDay;

    private Integer jobId;

    private Byte empleaveStatus;

    private String empJobDetail;
    
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
    public Integer getEmpleaveId() {
        return empleaveId;
    }

    public void setEmpleaveId(Integer empleaveId) {
        this.empleaveId = empleaveId;
    }

    public String getEmpleaveName() {
        return empleaveName;
    }

    public void setEmpleaveName(String empleaveName) {
        this.empleaveName = empleaveName;
    }

    public String getEmpleavePhone() {
        return empleavePhone;
    }

    public void setEmpleavePhone(String empleavePhone) {
        this.empleavePhone = empleavePhone;
    }

    public String getEmpleaveReason() {
        return empleaveReason;
    }

    public void setEmpleaveReason(String empleaveReason) {
        this.empleaveReason = empleaveReason;
    }

    public Integer getEmpleaveDay() {
        return empleaveDay;
    }

    public void setEmpleaveDay(Integer empleaveDay) {
        this.empleaveDay = empleaveDay;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public Byte getEmpleaveStatus() {
        return empleaveStatus;
    }

    public void setEmpleaveStatus(Byte empleaveStatus) {
        this.empleaveStatus = empleaveStatus;
    }

	@Override
	public String toString() {
		return "Empleave [empleaveId=" + empleaveId + ", empleaveName="
				+ empleaveName + ", empleavePhone=" + empleavePhone
				+ ", empleaveReason=" + empleaveReason + ", empleaveDay="
				+ empleaveDay + ", jobId=" + jobId + ", empleaveStatus="
				+ empleaveStatus + "]";
	}
    
    
}