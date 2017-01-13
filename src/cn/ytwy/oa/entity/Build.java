package cn.ytwy.oa.entity;

public class Build {
    private Integer buildId;

	private String buildType;

	private Integer buildArea;

	private Float buildFee;

	public Integer getBuildId() {
		return buildId;
	}

	public void setBuildId(Integer buildId) {
		this.buildId = buildId;
	}

	public String getBuildType() {
		return buildType;
	}

	public void setBuildType(String buildType) {
		this.buildType = buildType;
	}

	public Integer getBuildArea() {
		return buildArea;
	}

	public void setBuildArea(Integer buildArea) {
		this.buildArea = buildArea;
	}

	public Float getBuildFee() {
		return buildFee;
	}

	public void setBuildFee(Float buildFee) {
		this.buildFee = buildFee;
	}

}