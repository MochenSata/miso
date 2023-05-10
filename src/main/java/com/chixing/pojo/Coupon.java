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
public class Coupon implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 优惠券id
     */
    @TableId(value = "cou_id", type = IdType.AUTO)
    private Integer couId;

    /**
     * 优惠券名称
     */
    private String couName;

    /**
     * 优惠券类别
     */
    private String couCategory;

    /**
     * 优惠券金额
     */
    private Float couPrice;

    /**
     * 生效时间
     */
    private LocalDateTime couValidTime;

    /**
     * 失效时间
     */
    private LocalDateTime couInvalidTime;

    /**
     * 优惠券状态（0：生效中，1：已失效）
     */
    private Integer couStatus;

    /**
     * 优惠券介绍
     */
    private String couIntroduction;

    /**
     * 版本
     */
    private String version;

    /**
     * 状态
     */
    private Integer status;

    private String other1;

    private String other2;

    /**
     * 优惠券库存
     */
    private Integer couCount;

    public Integer getCouId() {
        return couId;
    }

    public void setCouId(Integer couId) {
        this.couId = couId;
    }
    public String getCouName() {
        return couName;
    }

    public void setCouName(String couName) {
        this.couName = couName;
    }
    public String getCouCategory() {
        return couCategory;
    }

    public void setCouCategory(String couCategory) {
        this.couCategory = couCategory;
    }
    public Float getCouPrice() {
        return couPrice;
    }

    public void setCouPrice(Float couPrice) {
        this.couPrice = couPrice;
    }
    public LocalDateTime getCouValidTime() {
        return couValidTime;
    }

    public void setCouValidTime(LocalDateTime couValidTime) {
        this.couValidTime = couValidTime;
    }
    public LocalDateTime getCouInvalidTime() {
        return couInvalidTime;
    }

    public void setCouInvalidTime(LocalDateTime couInvalidTime) {
        this.couInvalidTime = couInvalidTime;
    }
    public Integer getCouStatus() {
        return couStatus;
    }

    public void setCouStatus(Integer couStatus) {
        this.couStatus = couStatus;
    }
    public String getCouIntroduction() {
        return couIntroduction;
    }

    public void setCouIntroduction(String couIntroduction) {
        this.couIntroduction = couIntroduction;
    }
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
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
    public Integer getCouCount() {
        return couCount;
    }

    public void setCouCount(Integer couCount) {
        this.couCount = couCount;
    }

    @Override
    public String toString() {
        return "Coupon{" +
            "couId=" + couId +
            ", couName=" + couName +
            ", couCategory=" + couCategory +
            ", couPrice=" + couPrice +
            ", couValidTime=" + couValidTime +
            ", couInvalidTime=" + couInvalidTime +
            ", couStatus=" + couStatus +
            ", couIntroduction=" + couIntroduction +
            ", version=" + version +
            ", status=" + status +
            ", other1=" + other1 +
            ", other2=" + other2 +
            ", couCount=" + couCount +
        "}";
    }
}
