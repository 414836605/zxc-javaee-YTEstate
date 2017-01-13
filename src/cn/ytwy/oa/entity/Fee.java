package cn.ytwy.oa.entity;

import java.util.Date;

public class Fee {

	private Integer feeId;

    private Integer ownerId;

    private Date feeTime;

    private Byte feeType;

    private Integer feeBuild;
    
    private Integer feePark;

    private Integer feeGarage;
    
    
    //总数
    private Integer feeSum;

    public Integer getFeeSum() {
    	this.feeSum = feeBuild + feePark + feeGarage;
		return feeSum;
	}
	public void setFeeSum(Integer feeSum) {
		this.feeSum = feeSum;
	}

	//缴费人
	private String ownerName;
	
	public Integer getFeeId() {
		return feeId;
	}



	public void setFeeId(Integer feeId) {
		this.feeId = feeId;
	}



	public Integer getOwnerId() {
		return ownerId;
	}



	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}



	public Date getFeeTime() {
		return feeTime;
	}



	public void setFeeTime(Date feeTime) {
		this.feeTime = feeTime;
	}



	public Byte getFeeType() {
		return feeType;
	}



	public void setFeeType(Byte feeType) {
		this.feeType = feeType;
	}



	public Integer getFeeBuild() {
		return feeBuild;
	}



	public void setFeeBuild(Integer feeBuild) {
		this.feeBuild = feeBuild;
	}



	public Integer getFeePark() {
		return feePark;
	}



	public void setFeePark(Integer feePark) {
		this.feePark = feePark;
	}



	public Integer getFeeGarage() {
		return feeGarage;
	}



	public void setFeeGarage(Integer feeGarage) {
		this.feeGarage = feeGarage;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}



	
    

    
    
}