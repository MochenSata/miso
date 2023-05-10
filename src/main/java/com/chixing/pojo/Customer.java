package com.chixing.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    @TableId(value = "cust_id", type = IdType.AUTO)
    private Integer custId;

    /**
     * 用户名
     */
    private String custName;

    /**
     * 用户密码
     */
    private String custPwd;

    /**
     * 用户性别
     */
    private String custGender;

    /**
     * 用户手机号
     */
    private Long custTelno;

    /**
     * 用户邮箱
     */
    private String custEmail;

    private String custDesc;

    /**
     * 用户创建时间
     */
    private LocalDateTime custCreateTime;

    /**
     * 用户更新时间
     */
    private LocalDateTime custUpdateTime;

    /**
     * 用户头像
     */
    private String custHeadshort;

    /**
     * 版本
     */
    private Integer version;

    /**
     * 状态
     */
    private Integer status;

    private String other1;

    private String other2;

    /**
     * 邀请码
     */
    private String custInviteNum;

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
    public String getCustPwd() {
        return custPwd;
    }

    public void setCustPwd(String custPwd) {
        this.custPwd = custPwd;
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
    public LocalDateTime getCustCreateTime() {
        return custCreateTime;
    }

    public void setCustCreateTime(LocalDateTime custCreateTime) {
        this.custCreateTime = custCreateTime;
    }
    public LocalDateTime getCustUpdateTime() {
        return custUpdateTime;
    }

    public void setCustUpdateTime(LocalDateTime custUpdateTime) {
        this.custUpdateTime = custUpdateTime;
    }
    public String getCustHeadshort() {
        return custHeadshort;
    }

    public void setCustHeadshort(String custHeadshort) {
        this.custHeadshort = custHeadshort;
    }
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
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
    public String getCustInviteNum() {
        return custInviteNum;
    }

    public void setCustInviteNum(String custInviteNum) {
        this.custInviteNum = custInviteNum;
    }

    @Override
    public String toString() {
        return "Customer{" +
            "custId=" + custId +
            ", custName=" + custName +
            ", custPwd=" + custPwd +
            ", custGender=" + custGender +
            ", custTelno=" + custTelno +
            ", custEmail=" + custEmail +
            ", custDesc=" + custDesc +
            ", custCreateTime=" + custCreateTime +
            ", custUpdateTime=" + custUpdateTime +
            ", custHeadshort=" + custHeadshort +
            ", version=" + version +
            ", status=" + status +
            ", other1=" + other1 +
            ", other2=" + other2 +
            ", custInviteNum=" + custInviteNum +
        "}";
    }
}
