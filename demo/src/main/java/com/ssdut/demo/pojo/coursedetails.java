package com.ssdut.demo.pojo;

public class coursedetails extends coursedetailsKey {
    private String homework;

    private String videourl;

    private String ppturl;

    public String getHomework() {
        return homework;
    }

    public void setHomework(String homework) {
        this.homework = homework == null ? null : homework.trim();
    }

    public String getVideourl() {
        return videourl;
    }

    public void setVideourl(String videourl) {
        this.videourl = videourl == null ? null : videourl.trim();
    }

    public String getPpturl() {
        return ppturl;
    }

    public void setPpturl(String ppturl) {
        this.ppturl = ppturl == null ? null : ppturl.trim();
    }
}