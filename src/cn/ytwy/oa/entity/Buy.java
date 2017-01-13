package cn.ytwy.oa.entity;

import java.util.Date;

public class Buy {
    private Integer buyId;

    private String buyName;

    private String buyItem;

    private Integer buyNum;

    private Float buyCoast;

    private String buyUse;

    private String buyPhone;

    private Date buyTime;

    private Byte buyStatus;
    
    private String buyReply;

	public Integer getBuyId() {
		return buyId;
	}

	public void setBuyId(Integer buyId) {
		this.buyId = buyId;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public String getBuyItem() {
		return buyItem;
	}

	public void setBuyItem(String buyItem) {
		this.buyItem = buyItem;
	}

	public Integer getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}

	public Float getBuyCoast() {
		return buyCoast;
	}

	public void setBuyCoast(Float buyCoast) {
		this.buyCoast = buyCoast;
	}

	public String getBuyUse() {
		return buyUse;
	}

	public void setBuyUse(String buyUse) {
		this.buyUse = buyUse;
	}

	public String getBuyPhone() {
		return buyPhone;
	}

	public void setBuyPhone(String buyPhone) {
		this.buyPhone = buyPhone;
	}

	public Date getBuyTime() {
		return buyTime;
	}

	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}

	public Byte getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(Byte buyStatus) {
		this.buyStatus = buyStatus;
	}

	public String getBuyReply() {
		return buyReply;
	}

	public void setBuyReply(String buyReply) {
		this.buyReply = buyReply;
	}
    
    

}