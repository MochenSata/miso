package com.chixing.pojo;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.lang.annotation.Documented;

@Document(indexName="house")  // ES 中索引的名称
public class SearchHouse {
    @Id
    private Integer houseId;
    @Field(type = FieldType.Text,analyzer = "ik_smart",searchAnalyzer = "ik_max_word")
    private String houseName;
    @Field(type = FieldType.Text,analyzer = "ik_smart",searchAnalyzer = "ik_max_word")
    private String houseKind;
    @Field(type = FieldType.Keyword)
    private String houseMainpicture;
    @Field(type = FieldType.Keyword)
    private Float houseScore;
    @Field(type = FieldType.Keyword)
    private Float housePrice;
    public SearchHouse(){}
    public SearchHouse(Integer houseId, String houseName, String houseKind, String houseMainpicture, Float houseScore, Float housePrice) {
        this.houseId = houseId;
        this.houseName = houseName;
        this.houseKind = houseKind;
        this.houseMainpicture = houseMainpicture;
        this.houseScore = houseScore;
        this.housePrice = housePrice;
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

    public String getHouseKind() {
        return houseKind;
    }

    public void setHouseKind(String houseKind) {
        this.houseKind = houseKind;
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

    @Override
    public String toString() {
        return "SearchHouse{" +
                "houseId=" + houseId +
                ", houseName='" + houseName + '\'' +
                ", houseKind='" + houseKind + '\'' +
                ", houseMainpicture='" + houseMainpicture + '\'' +
                ", houseScore=" + houseScore +
                ", housePrice=" + housePrice +
                '}';
    }
}
