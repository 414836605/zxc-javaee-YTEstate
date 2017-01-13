package cn.ytwy.oa.entity;

import java.util.Date;

public class Source {
    private Integer sourceId;

    private String sourceItem;

    private Integer sourceNum;

    private Float sourceCoast;

    private Date sourceTime;

    private String sourceName;

    public Integer getSourceId() {
        return sourceId;
    }

    public void setSourceId(Integer sourceId) {
        this.sourceId = sourceId;
    }

    public String getSourceItem() {
        return sourceItem;
    }

    public void setSourceItem(String sourceItem) {
        this.sourceItem = sourceItem;
    }

    public Integer getSourceNum() {
        return sourceNum;
    }

    public void setSourceNum(Integer sourceNum) {
        this.sourceNum = sourceNum;
    }

    public Float getSourceCoast() {
        return sourceCoast;
    }

    public void setSourceCoast(Float sourceCoast) {
        this.sourceCoast = sourceCoast;
    }

    public Date getSourceTime() {
        return sourceTime;
    }

    public void setSourceTime(Date sourceTime) {
        this.sourceTime = sourceTime;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }
}