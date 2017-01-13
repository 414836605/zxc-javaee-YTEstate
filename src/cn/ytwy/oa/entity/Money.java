package cn.ytwy.oa.entity;

import java.util.Date;

public class Money {
    private Integer moneyId;

    private Integer empId;

    private Integer moneyAtt;

    private Date moneyTime;

    public Integer getMoneyId() {
        return moneyId;
    }

    public void setMoneyId(Integer moneyId) {
        this.moneyId = moneyId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getMoneyAtt() {
        return moneyAtt;
    }

    public void setMoneyAtt(Integer moneyAtt) {
        this.moneyAtt = moneyAtt;
    }

    public Date getMoneyTime() {
        return moneyTime;
    }

    public void setMoneyTime(Date moneyTime) {
        this.moneyTime = moneyTime;
    }
}