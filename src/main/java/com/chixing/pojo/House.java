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
public class House implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 房屋id
     */
    @TableId(value = "house_id", type = IdType.AUTO)
    private Integer houseId;

    /**
     * 房屋名称
     */
    private String houseName;

    /**
     * 房屋种类
     */
    private String houseKind;

    /**
     * 房间出租状态（0：未出租  1：已出租）
     */
    private Integer houseStatus;

    /**
     * 房屋主图片
     */
    private String houseMainpicture;

    /**
     * 房屋评分	房屋评分（0-5,一星号为一分，半星为半分）
     */
    private Float houseScore;

    /**
     * 房屋起步价
     */
    private Float housePrice;

    /**
     * 床数
     */
    private Integer bedCount;

    /**
     * 房屋可住人数
     */
    private Integer houseCustCount;

    /**
     * 房屋卫生间数
     */
    private String houseToiletcount;

    /**
     * 房间出租次数
     */
    private Integer houseRentnum;

    /**
     * 表创建时间
     */
    private LocalDateTime createTime;

    /**
     * 表更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 表版本
     */
    private Integer version;

    /**
     * 表状态
     */
    private Integer status;

    /**
     * 其他字段1
     */
    private String other1;

    /**
     * 其他字段2
     */
    private String other2;

    /**
     * 房屋详细介绍
     */
    private String houseIntro;

    /**
     * 房屋设施介绍
     */
    private String houseFacility;

    /**
     * 房屋卧室数量
     */
    private Integer houseRoomNum;

    private String housePicOne;

    private String housePicTwo;

    private String housePicThree;

    private String housePicFour;

    private String houseTheme;

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
    public String getHouseKind() {
        return houseKind;
    }

    public void setHouseKind(String houseKind) {
        this.houseKind = houseKind;
    }
    public Integer getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(Integer houseStatus) {
        this.houseStatus = houseStatus;
    }
    public String getHouseMainpicture() {
        return houseMainpicture;
    }

    public void setHouseMainpicture(String houseMainpicture) {
        this.houseMainpicture = houseMainpicture;
    }
    public Float getHouseScore() {
        return houseScore;
    }

    public void setHouseScore(Float houseScore) {
        this.houseScore = houseScore;
    }
    public Float getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Float housePrice) {
        this.housePrice = housePrice;
    }
    public Integer getBedCount() {
        return bedCount;
    }

    public void setBedCount(Integer bedCount) {
        this.bedCount = bedCount;
    }
    public Integer getHouseCustCount() {
        return houseCustCount;
    }

    public void setHouseCustCount(Integer houseCustCount) {
        this.houseCustCount = houseCustCount;
    }
    public String getHouseToiletcount() {
        return houseToiletcount;
    }

    public void setHouseToiletcount(String houseToiletcount) {
        this.houseToiletcount = houseToiletcount;
    }
    public Integer getHouseRentnum() {
        return houseRentnum;
    }

    public void setHouseRentnum(Integer houseRentnum) {
        this.houseRentnum = houseRentnum;
    }
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
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
    public String getHouseIntro() {
        return houseIntro;
    }

    public void setHouseIntro(String houseIntro) {
        this.houseIntro = houseIntro;
    }
    public String getHouseFacility() {
        return houseFacility;
    }

    public void setHouseFacility(String houseFacility) {
        this.houseFacility = houseFacility;
    }
    public Integer getHouseRoomNum() {
        return houseRoomNum;
    }

    public void setHouseRoomNum(Integer houseRoomNum) {
        this.houseRoomNum = houseRoomNum;
    }
    public String getHousePicOne() {
        return housePicOne;
    }

    public void setHousePicOne(String housePicOne) {
        this.housePicOne = housePicOne;
    }
    public String getHousePicTwo() {
        return housePicTwo;
    }

    public void setHousePicTwo(String housePicTwo) {
        this.housePicTwo = housePicTwo;
    }
    public String getHousePicThree() {
        return housePicThree;
    }

    public void setHousePicThree(String housePicThree) {
        this.housePicThree = housePicThree;
    }
    public String getHousePicFour() {
        return housePicFour;
    }

    public void setHousePicFour(String housePicFour) {
        this.housePicFour = housePicFour;
    }
    public String getHouseTheme() {
        return houseTheme;
    }

    public void setHouseTheme(String houseTheme) {
        this.houseTheme = houseTheme;
    }

    @Override
    public String toString() {
        return "House{" +
            "houseId=" + houseId +
            ", houseName=" + houseName +
            ", houseKind=" + houseKind +
            ", houseStatus=" + houseStatus +
            ", houseMainpicture=" + houseMainpicture +
            ", houseScore=" + houseScore +
            ", housePrice=" + housePrice +
            ", bedCount=" + bedCount +
            ", houseCustCount=" + houseCustCount +
            ", houseToiletcount=" + houseToiletcount +
            ", houseRentnum=" + houseRentnum +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            ", version=" + version +
            ", status=" + status +
            ", other1=" + other1 +
            ", other2=" + other2 +
            ", houseIntro=" + houseIntro +
            ", houseFacility=" + houseFacility +
            ", houseRoomNum=" + houseRoomNum +
            ", housePicOne=" + housePicOne +
            ", housePicTwo=" + housePicTwo +
            ", housePicThree=" + housePicThree +
            ", housePicFour=" + housePicFour +
            ", houseTheme=" + houseTheme +
        "}";
    }
}
