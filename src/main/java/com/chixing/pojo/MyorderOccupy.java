package com.chixing.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
@TableName("myorder_occupy")
public class MyorderOccupy implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单入住人信息Id
     */
    @TableId(value = "occ_id", type = IdType.AUTO)
    private Integer occId;

    /**
     * 订单Id
     */
    private Integer myorderId;

    /**
     * 下单人
     */
    private Integer custId;

    /**
     * 入住人姓名
     */
    private String occName;

    /**
     * 入住人手机号
     */
    private Long occTelno;

    private Integer version;

    private String other1;

    private String other2;

    /**
     * 身份证号
     */
    private Long occIdentity;

    public Integer getOccId() {
        return occId;
    }

    public void setOccId(Integer occId) {
        this.occId = occId;
    }
    public Integer getMyorderId() {
        return myorderId;
    }

    public void setMyorderId(Integer myorderId) {
        this.myorderId = myorderId;
    }
    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }
    public String getOccName() {
        return occName;
    }

    public void setOccName(String occName) {
        this.occName = occName;
    }
    public Long getOccTelno() {
        return occTelno;
    }

    public void setOccTelno(Long occTelno) {
        this.occTelno = occTelno;
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
    public String getOther2() {
        return other2;
    }

    public void setOther2(String other2) {
        this.other2 = other2;
    }
    public Long getOccIdentity() {
        return occIdentity;
    }

    public void setOccIdentity(Long occIdentity) {
        this.occIdentity = occIdentity;
    }

    @Override
    public String toString() {
        return "MyorderOccupy{" +
            "occId=" + occId +
            ", myorderId=" + myorderId +
            ", custId=" + custId +
            ", occName=" + occName +
            ", occTelno=" + occTelno +
            ", version=" + version +
            ", other1=" + other1 +
            ", other2=" + other2 +
            ", occIdentity=" + occIdentity +
        "}";
    }
}
