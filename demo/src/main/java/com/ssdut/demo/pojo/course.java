package com.ssdut.demo.pojo;

public class course {
    private Integer courseid;

    private Integer courseteacherid;

    private String coursename;

    private String description;

    private String picurl;

    private Integer coursetype;

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public Integer getCourseteacherid() {
        return courseteacherid;
    }

    public void setCourseteacherid(Integer courseteacherid) {
        this.courseteacherid = courseteacherid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl == null ? null : picurl.trim();
    }

    public Integer getCoursetype() {
        return coursetype;
    }

    public void setCoursetype(Integer coursetype) {
        this.coursetype = coursetype;
    }
}