package com.chixing.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class MyorderDetailVO {
    private Integer custId;
    private String couNum;
    private Float couPrice;
    private Float myorderPrice;
    private String myorderNum;
    private Integer myorderId;
    private OrderCountAndDataVO orderCountAndDataVO;
    public MyorderDetailVO(){}
    public MyorderDetailVO(Integer custId, String couNum, Float couPrice, Float myorderPrice, OrderCountAndDataVO orderCountAndDataVO) {
        this.custId = custId;
        this.couNum = couNum;
        this.couPrice = couPrice;
        this.myorderPrice = myorderPrice;
        this.orderCountAndDataVO = orderCountAndDataVO;
    }

    public Integer getMyorderId() {
        return myorderId;
    }

    public void setMyorderId(Integer myorderId) {
        this.myorderId = myorderId;
    }

    public String getMyorderNum() {
        return myorderNum;
    }

    public void setMyorderNum(String myorderNum) {
        this.myorderNum = myorderNum;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCouNum() {
        return couNum;
    }

    public void setCouNum(String couNum) {
        this.couNum = couNum;
    }

    public Float getCouPrice() {
        return couPrice;
    }

    public void setCouPrice(Float couPrice) {
        this.couPrice = couPrice;
    }

    public Float getMyorderPrice() {
        return myorderPrice;
    }

    public void setMyorderPrice(Float myorderPrice) {
        this.myorderPrice = myorderPrice;
    }

    public OrderCountAndDataVO getOrderCountAndDataVO() {
        return orderCountAndDataVO;
    }

    public void setOrderCountAndDataVO(OrderCountAndDataVO orderCountAndDataVO) {
        this.orderCountAndDataVO = orderCountAndDataVO;
    }

    @Override
    public String toString() {
        return "MyorderDetailVO{" +
                "custId=" + custId +
                ", couNum='" + couNum + '\'' +
                ", couPrice=" + couPrice +
                ", myorderPrice=" + myorderPrice +
                ", orderCountAndDataVO=" + orderCountAndDataVO +
                '}';
    }
}
