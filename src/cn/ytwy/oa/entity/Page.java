package cn.ytwy.oa.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> implements Serializable {


	private static final long serialVersionUID = 337297181251071639L;
	
	private Integer draw;//datatables绘制计数器
	private Integer start;//开始
	private Integer length;//长度
	
	private Integer recordsTotal;//总记录数
	private Integer recordsFiltered;//过滤后的记录数
	private List<T> data;//查询数据
	
	
	private T condition;//查询条件
	
	
	private Date startTime;//查询开始时间
	private Date endTime;//查询结束时间
	private String searchText;//查询关键词
	
	@Override
	public String toString() {
		return "Page [draw=" + draw + ", start=" + start + ", length=" + length
				+ ", recordsTotal=" + recordsTotal + ", recordsFiltered="
				+ recordsFiltered + ", data=" + data + ", condition="
				+ condition + ", startTime=" + startTime + ", endTime="
				+ endTime + ", searchText=" + searchText + ", returndata="
				+ returndata + "]";
	}

	
	public String getSearchText() {
		return searchText;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	

	private Map<Object, Object> returndata = new HashMap<Object, Object>();//返回数据

	public Integer getDraw() {
		return draw;
	}

	public void setDraw(Integer draw) {
		this.returndata.put("draw", draw);
		this.draw = draw;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public Integer getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(Integer recordsTotal) {
		this.returndata.put("recordsTotal", recordsTotal);
		this.recordsTotal = recordsTotal;
	}

	public Integer getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(Integer recordsFiltered) {
		this.returndata.put("recordsFiltered", recordsFiltered);
		this.recordsFiltered = recordsFiltered;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.returndata.put("data", data);
		this.data = data;
	}

	public Map<Object, Object> getReturndata() {
		return returndata;
	}

	public void setReturndata(Map<Object, Object> returndata) {
		this.returndata = returndata;
	}


	public T getCondition() {
		return condition;
	}

	public void setCondition(T condition) {
		this.condition = condition;
	}

	

}
