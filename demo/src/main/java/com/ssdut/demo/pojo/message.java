package com.ssdut.demo.pojo;

import java.util.Date;

public class message {
    private Integer messageid;

    private Integer fromid;

    private Integer toid;

    private Integer time;

    private Date column5;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public Integer getFromid() {
        return fromid;
    }

    public void setFromid(Integer fromid) {
        this.fromid = fromid;
    }

    public Integer getToid() {
        return toid;
    }

    public void setToid(Integer toid) {
        this.toid = toid;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Date getColumn5() {
        return column5;
    }

    public void setColumn5(Date column5) {
        this.column5 = column5;
    }
}