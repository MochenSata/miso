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
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 流水信息ID
     */
    @TableId(value = "pay_id", type = IdType.AUTO)
    private Integer payId;

    /**
     * 流水号
     */
    private String payNum;

    /**
     * 用户id
     */
    private Integer custId;

    /**
     * 订单id
     */
    private Integer myorderId;

    /**
     * 订单号
     */
    private String myorderNum;

    /**
     * 支付状态：0未支付，1已支付，2已取消
     */
    private Integer payStatus;

    /**
     * 支付金额
     */
    private Float payAmount;

    /**
     * 支付创建时间
     */
    private LocalDateTime payCreatetime;

    /**
     * 支付时间
     */
    private LocalDateTime payTime;

    private Integer version;

    private String other1;

    private String oterh2;

    /**
     * 支付表更新时间
     */
    private LocalDateTime payUpdatetime;

    public Integer getPayId() {
        return payId;
    }

    public void setPayId(Integer payId) {
        this.payId = payId;
    }
    public String getPayNum() {
        return payNum;
    }

    public void setPayNum(String payNum) {
        this.payNum = payNum;
    }
    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
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
    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }
    public Float getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(Float payAmount) {
        this.payAmount = payAmount;
    }
    public LocalDateTime getPayCreatetime() {
        return payCreatetime;
    }

    public void setPayCreatetime(LocalDateTime payCreatetime) {
        this.payCreatetime = payCreatetime;
    }
    public LocalDateTime getPayTime() {
        return payTime;
    }

    public void setPayTime(LocalDateTime payTime) {
        this.payTime = payTime;
    }
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
    public String getOther1() {
        return other1;
    }

    public void setOther1(String other1) {
        this.other1 = other1;
    }
    public String getOterh2() {
        return oterh2;
    }

    public void setOterh2(String oterh2) {
        this.oterh2 = oterh2;
    }
    public LocalDateTime getPayUpdatetime() {
        return payUpdatetime;
    }

    public void setPayUpdatetime(LocalDateTime payUpdatetime) {
        this.payUpdatetime = payUpdatetime;
    }

    @Override
    public String toString() {
        return "Payment{" +
            "payId=" + payId +
            ", payNum=" + payNum +
            ", custId=" + custId +
            ", myorderId=" + myorderId +
            ", myorderNum=" + myorderNum +
            ", payStatus=" + payStatus +
            ", payAmount=" + payAmount +
            ", payCreatetime=" + payCreatetime +
            ", payTime=" + payTime +
            ", version=" + version +
            ", other1=" + other1 +
            ", oterh2=" + oterh2 +
            ", payUpdatetime=" + payUpdatetime +
        "}";
    }
}
