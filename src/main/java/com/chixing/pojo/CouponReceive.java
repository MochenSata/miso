package com.chixing.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("coupon_receive")
public class CouponReceive implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 优惠券详情id
     */
    @TableId(value = "cou_detail_id", type = IdType.AUTO)
    private Integer couDetailId;

    /**
     * 优惠券编号
     */
    private String couNum;

    /**
     * 优惠券id
     */
    private Integer couId;

    /**
     * 用户id
     */
    private Integer custId;

    /**
     * 优惠券金额
     */
    private Float couPrice;

    /**
     * 优惠券领取时间
     */
    private LocalDateTime couReceiveTime;

    /**
     * 优惠券使用时间
     */
    private LocalDateTime couUseTime;

    /**
     * 优惠券截止时间
     */
    private LocalDateTime couEndTime;

    /**
     * 优惠券使用状态（0：未使用，1：已使用，2：已失效）
     */
    private Integer couUsageStatus;

    /**
     * 版本
     */
    private Integer version;

    private Integer status;

    private String other1;

    private String other2;

    /**
     * 优惠券介绍
     */
    private String couIntroduction;

    public Integer getCouDetailId() {
        return couDetailId;
    }

    public void setCouDetailId(Integer couDetailId) {
        this.couDetailId = couDetailId;
    }
    public String getCouNum() {
        return couNum;
    }

    public void setCouNum(String couNum) {
        this.couNum = couNum;
    }
    public Integer getCouId() {
        return couId;
    }

    public void setCouId(Integer couId) {
        this.couId = couId;
    }
    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }
    public Float getCouPrice() {
        return couPrice;
    }

    public void setCouPrice(Float couPrice) {
        this.couPrice = couPrice;
    }
    public LocalDateTime getCouReceiveTime() {
        return couReceiveTime;
    }

    public void setCouReceiveTime(LocalDateTime couReceiveTime) {
        this.couReceiveTime = couReceiveTime;
    }
    public LocalDateTime getCouUseTime() {
        return couUseTime;
    }

    public void setCouUseTime(LocalDateTime couUseTime) {
        this.couUseTime = couUseTime;
    }
    public LocalDateTime getCouEndTime() {
        return couEndTime;
    }

    public void setCouEndTime(LocalDateTime couEndTime) {
        this.couEndTime = couEndTime;
    }
    public Integer getCouUsageStatus() {
        return couUsageStatus;
    }

    public void setCouUsageStatus(Integer couUsageStatus) {
        this.couUsageStatus = couUsageStatus;
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
    public String getCouIntroduction() {
        return couIntroduction;
    }

    public void setCouIntroduction(String couIntroduction) {
        this.couIntroduction = couIntroduction;
    }

    @Override
    public String toString() {
        return "CouponReceive{" +
            "couDetailId=" + couDetailId +
            ", couNum=" + couNum +
            ", couId=" + couId +
            ", custId=" + custId +
            ", couPrice=" + couPrice +
            ", couReceiveTime=" + couReceiveTime +
            ", couUseTime=" + couUseTime +
            ", couEndTime=" + couEndTime +
            ", couUsageStatus=" + couUsageStatus +
            ", version=" + version +
            ", status=" + status +
            ", other1=" + other1 +
            ", other2=" + other2 +
            ", couIntroduction=" + couIntroduction +
        "}";
    }
}
