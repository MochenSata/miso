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
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 评论id
     */
    @TableId(value = "com_id", type = IdType.AUTO)
    private Integer comId;

    /**
     * 用户id	
     */
    private Integer custId;

    /**
     * 用户姓名
     */
    private String custName;

    /**
     * 评论内容
     */
    private String comContent;

    /**
     * 评论创建时间
     */
    private LocalDateTime comCreateTime;

    /**
     * 房间id
     */
    private Integer houseId;

    /**
     * 房客评分
     */
    private Float comScore;

    /**
     * 订单id
     */
    private Integer myorderId;

    /**
     * 版本
     */
    private Integer version;

    private String other1;

    private String other2;

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
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
    public String getComContent() {
        return comContent;
    }

    public void setComContent(String comContent) {
        this.comContent = comContent;
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
    public Float getComScore() {
        return comScore;
    }

    public void setComScore(Float comScore) {
        this.comScore = comScore;
    }
    public Integer getMyorderId() {
        return myorderId;
    }

    public void setMyorderId(Integer myorderId) {
        this.myorderId = myorderId;
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
        return "Comment{" +
            "comId=" + comId +
            ", custId=" + custId +
            ", custName=" + custName +
            ", comContent=" + comContent +
            ", comCreateTime=" + comCreateTime +
            ", houseId=" + houseId +
            ", comScore=" + comScore +
            ", myorderId=" + myorderId +
            ", version=" + version +
            ", other1=" + other1 +
            ", other2=" + other2 +
        "}";
    }
}
