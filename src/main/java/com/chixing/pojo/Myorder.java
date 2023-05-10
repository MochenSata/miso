package com.chixing.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public class Myorder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单id
     */
    @TableId(value = "myorder_id", type = IdType.AUTO)
    private Integer myorderId;

    /**
     * 订单编号
     */
    private String myorderNum;

    /**
     * 用户id
     */
    private Integer custId;

    /**
     * 房屋id
     */
    private Integer houseId;

    /**
     * 房屋名称
     */
    private String houseName;

    /**
     * 房屋主图片
     */
    private String houseMainpicture;

    /**
     * 房屋起步价
     */
    private Float housePrice;

    /**
     * 订单创建时间
     */
    private LocalDateTime myorderCreateTime;

    /**
     * 修改订单时间
     */
    private LocalDateTime myorderUpdateTime;

    /**
     * 订单状态：0未支付，1已支付，2已完成，3已取消
     */
    private Integer myorderStatus;

    /**
     * 优惠券编号
     */
    private String couNum;

    /**
     * 优惠券金额
     */
    private Float couPrice;

    /**
     * 订单价格
     */
    private Float myorderPrice;

    /**
     * 预定天数
     */
    private Integer myorderDay;

    /**
     * 入住日期
     */
    private LocalDate myorderIntime;

    /**
     * 离房日期
     */
    private LocalDate myorderOutime;

    /**
     * 订单备注
     */
    private String myorderNotes;

    private Integer version;

    private String other1;

    private String other2;

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
    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }
    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }
    public String getHouseMainpicture() {
        return houseMainpicture;
    }

    public void setHouseMainpicture(String houseMainpicture) {
        this.houseMainpicture = houseMainpicture;
    }
    public Float getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Float housePrice) {
        this.housePrice = housePrice;
    }
    public LocalDateTime getMyorderCreateTime() {
        return myorderCreateTime;
    }

    public void setMyorderCreateTime(LocalDateTime myorderCreateTime) {
        this.myorderCreateTime = myorderCreateTime;
    }
    public LocalDateTime getMyorderUpdateTime() {
        return myorderUpdateTime;
    }

    public void setMyorderUpdateTime(LocalDateTime myorderUpdateTime) {
        this.myorderUpdateTime = myorderUpdateTime;
    }
    public Integer getMyorderStatus() {
        return myorderStatus;
    }

    public void setMyorderStatus(Integer myorderStatus) {
        this.myorderStatus = myorderStatus;
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
    public Integer getMyorderDay() {
        return myorderDay;
    }

    public void setMyorderDay(Integer myorderDay) {
        this.myorderDay = myorderDay;
    }
    public LocalDate getMyorderIntime() {
        return myorderIntime;
    }

    public void setMyorderIntime(LocalDate myorderIntime) {
        this.myorderIntime = myorderIntime;
    }
    public LocalDate getMyorderOutime() {
        return myorderOutime;
    }

    public void setMyorderOutime(LocalDate myorderOutime) {
        this.myorderOutime = myorderOutime;
    }
    public String getMyorderNotes() {
        return myorderNotes;
    }

    public void setMyorderNotes(String myorderNotes) {
        this.myorderNotes = myorderNotes;
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

    @Override
    public String toString() {
        return "Myorder{" +
            "myorderId=" + myorderId +
            ", myorderNum=" + myorderNum +
            ", custId=" + custId +
            ", houseId=" + houseId +
            ", houseName=" + houseName +
            ", houseMainpicture=" + houseMainpicture +
            ", housePrice=" + housePrice +
            ", myorderCreateTime=" + myorderCreateTime +
            ", myorderUpdateTime=" + myorderUpdateTime +
            ", myorderStatus=" + myorderStatus +
            ", couNum=" + couNum +
            ", couPrice=" + couPrice +
            ", myorderPrice=" + myorderPrice +
            ", myorderDay=" + myorderDay +
            ", myorderIntime=" + myorderIntime +
            ", myorderOutime=" + myorderOutime +
            ", myorderNotes=" + myorderNotes +
            ", version=" + version +
            ", other1=" + other1 +
            ", other2=" + other2 +
        "}";
    }
}
