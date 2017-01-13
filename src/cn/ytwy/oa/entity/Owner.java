package cn.ytwy.oa.entity;

public class Owner {
    private Integer ownerId;

    private String ownerName;

    private String ownerPerid;

    private String ownerSex;

    private String ownerPhone;

    private String ownerEmail;

    private String ownerInfo;

    private Integer ownerBuild;

    private String ownerHome;

    private Integer ownerGarage;

    private Integer ownerPark;

    public void removeNull(){
    	ownerBuild = 0;
    	ownerHome = "0";
    	ownerGarage = 0;
    	ownerPark = 0;
    }
    
    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerPerid() {
        return ownerPerid;
    }

    public void setOwnerPerid(String ownerPerid) {
        this.ownerPerid = ownerPerid;
    }

    public String getOwnerSex() {
        return ownerSex;
    }

    public void setOwnerSex(String ownerSex) {
        this.ownerSex = ownerSex;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public String getOwnerInfo() {
        return ownerInfo;
    }

    public void setOwnerInfo(String ownerInfo) {
        this.ownerInfo = ownerInfo;
    }

    public Integer getOwnerBuild() {
        return ownerBuild;
    }

    public void setOwnerBuild(Integer ownerBuild) {
        this.ownerBuild = ownerBuild;
    }

    public String getOwnerHome() {
        return ownerHome;
    }

    public void setOwnerHome(String ownerHome) {
        this.ownerHome = ownerHome;
    }

    public Integer getOwnerGarage() {
        return ownerGarage;
    }

    public void setOwnerGarage(Integer ownerGarage) {
        this.ownerGarage = ownerGarage;
    }

    public Integer getOwnerPark() {
        return ownerPark;
    }

    public void setOwnerPark(Integer ownerPark) {
        this.ownerPark = ownerPark;
    }
}