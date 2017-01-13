package cn.ytwy.oa.entity;

import java.util.Date;

public class Maintain {
    private Integer maintainId;

    private String maintainName;

    private String maintainItem;

    private String maintainDescribe;

    private String maintainPhone;

    private Date maintainTime;

    private Byte maintainStatus;

    public Integer getMaintainId() {
        return maintainId;
    }

    public void setMaintainId(Integer maintainId) {
        this.maintainId = maintainId;
    }

    public String getMaintainName() {
        return maintainName;
    }

    public void setMaintainName(String maintainName) {
        this.maintainName = maintainName;
    }

    public String getMaintainItem() {
        return maintainItem;
    }

    public void setMaintainItem(String maintainItem) {
        this.maintainItem = maintainItem;
    }

    public String getMaintainDescribe() {
        return maintainDescribe;
    }

    public void setMaintainDescribe(String maintainDescribe) {
        this.maintainDescribe = maintainDescribe;
    }

    public String getMaintainPhone() {
        return maintainPhone;
    }

    public void setMaintainPhone(String maintainPhone) {
        this.maintainPhone = maintainPhone;
    }

    public Date getMaintainTime() {
        return maintainTime;
    }

    public void setMaintainTime(Date maintainTime) {
        this.maintainTime = maintainTime;
    }

    public Byte getMaintainStatus() {
        return maintainStatus;
    }

    public void setMaintainStatus(Byte maintainStatus) {
        this.maintainStatus = maintainStatus;
    }
}