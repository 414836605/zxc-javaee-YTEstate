package cn.ytwy.oa.entity;

public class Image {
    private Integer imageId;

    private String imageType;

    private Integer imageRefId;

    private byte[] imageData;

    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    public Integer getImageRefId() {
        return imageRefId;
    }

    public void setImageRefId(Integer imageRefId) {
        this.imageRefId = imageRefId;
    }

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }
}