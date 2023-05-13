package com.chixing.pojo;

import java.time.LocalDateTime;

public class LoginCustomer {
    private Integer custId;
    private String custName;
    private String custGender;
    private Long custTelno;
    private String custEmail;
    private String custDesc;
    private String custHeadshort;
    private String custInviteNum;
    private Integer status;
    private String other1;
    private String other2;


    public LoginCustomer(){}

    public LoginCustomer(Integer custId, String custName, String custGender, Long custTelno, String custEmail, String custDesc, String custHeadshort, String custInviteNum, Integer status, String other1, String other2) {
        this.custId = custId;
        this.custName = custName;
        this.custGender = custGender;
        this.custTelno = custTelno;
        this.custEmail = custEmail;
        this.custDesc = custDesc;
        this.custHeadshort = custHeadshort;
        this.custInviteNum = custInviteNum;
        this.status = status;
        this.other1 = other1;
        this.other2 = other2;
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

    public String getCustGender() {
        return custGender;
    }

    public void setCustGender(String custGender) {
        this.custGender = custGender;
    }

    public Long getCustTelno() {
        return custTelno;
    }

    public void setCustTelno(Long custTelno) {
        this.custTelno = custTelno;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustDesc() {
        return custDesc;
    }

    public void setCustDesc(String custDesc) {
        this.custDesc = custDesc;
    }

    public String getCustHeadshort() {
        return custHeadshort;
    }

    public void setCustHeadshort(String custHeadshort) {
        this.custHeadshort = custHeadshort;
    }

    public String getCustInviteNum() {
        return custInviteNum;
    }

    public void setCustInviteNum(String custInviteNum) {
        this.custInviteNum = custInviteNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOther1() {
        return other1;
    }

    public void setOther1(String other1) {
        this.other1 = other1;
    }

    public String getOther2() {
        return other2;
    }

    public void setOther2(String other2) {
        this.other2 = other2;
    }

    @Override
    public String toString() {
        return "LoginCustomer{" +
                "custId=" + custId +
                ", custName='" + custName + '\'' +
                ", custGender='" + custGender + '\'' +
                ", custTelno=" + custTelno +
                ", custEmail='" + custEmail + '\'' +
                ", custDesc='" + custDesc + '\'' +
                ", custHeadshort='" + custHeadshort + '\'' +
                ", custInviteNum='" + custInviteNum + '\'' +
                ", status=" + status +
                ", other1='" + other1 + '\'' +
                ", other2='" + other2 + '\'' +
                '}';
    }
}
