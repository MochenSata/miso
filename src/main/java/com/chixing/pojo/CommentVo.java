package com.chixing.pojo;

import java.time.LocalDateTime;

public class CommentVo {
    private Integer custId;
    private String custName;
    private LocalDateTime comCreateTime;
    private Integer houseId;
    private Integer myorderId;
    private Float comScore;
    private String comContent;

    public CommentVo(){}

    public CommentVo(Integer custId, String custName, LocalDateTime comCreateTime, Integer houseId, Integer myorderId, Float comScore, String comContent) {
        this.custId = custId;
        this.custName = custName;
        this.comCreateTime = comCreateTime;
        this.houseId = houseId;
        this.myorderId = myorderId;
        this.comScore = comScore;
        this.comContent = comContent;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public LocalDateTime getComCreateTime() {
        return comCreateTime;
    }

    public void setComCreateTime(LocalDateTime comCreateTime) {
        this.comCreateTime = comCreateTime;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public Integer getMyorderId() {
        return myorderId;
    }

    public void setMyorderId(Integer myorderId) {
        this.myorderId = myorderId;
    }

    public Float getComScore() {
        return comScore;
    }

    public void setComScore(Float comScore) {
        this.comScore = comScore;
    }

    public String getComContent() {
        return comContent;
    }

    public void setComContent(String comContent) {
        this.comContent = comContent;
    }

    @Override
    public String toString() {
        return "CommentVo{" +
                "custId=" + custId +
                ", custName='" + custName + '\'' +
                ", comCreateTime=" + comCreateTime +
                ", houseId=" + houseId +
                ", myorderId=" + myorderId +
                ", comScore=" + comScore +
                ", comContent='" + comContent + '\'' +
                '}';
    }
}
