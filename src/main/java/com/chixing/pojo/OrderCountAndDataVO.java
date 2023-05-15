package com.chixing.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;

public class OrderCountAndDataVO {
    private Integer custNum;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate custStartDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate custEndDate;
    private String houseMainpicture;
    private String houseTheme;
    private Float houseScore;
    private Float housePrice;
    public OrderCountAndDataVO(){}

    public OrderCountAndDataVO(Integer custNum, LocalDate custStartDate, LocalDate custEndDate, String houseMainpicture, String houseTheme, Float houseScore, Float housePrice) {
        this.custNum = custNum;
        this.custStartDate = custStartDate;
        this.custEndDate = custEndDate;
        this.houseMainpicture = houseMainpicture;
        this.houseTheme = houseTheme;
        this.houseScore = houseScore;
        this.housePrice = housePrice;
    }

    public Integer getCustNum() {
        return custNum;
    }

    public void setCustNum(Integer custNum) {
        this.custNum = custNum;
    }

    public LocalDate getCustStartDate() {
        return custStartDate;
    }

    public void setCustStartDate(LocalDate custStartDate) {
        this.custStartDate = custStartDate;
    }

    public LocalDate getCustEndDate() {
        return custEndDate;
    }

    public void setCustEndDate(LocalDate custEndDate) {
        this.custEndDate = custEndDate;
    }



    public String getHouseMainpicture() {
        return houseMainpicture;
    }

    public void setHouseMainpicture(String houseMainpicture) {
        this.houseMainpicture = houseMainpicture;
    }

    public String getHouseTheme() {
        return houseTheme;
    }

    public void setHouseTheme(String houseTheme) {
        this.houseTheme = houseTheme;
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
        return "OrderCountAndDataVO{" +
                "custNum=" + custNum +
                ", custStartDate=" + custStartDate +
                ", custEndDate=" + custEndDate +
                ", houseMainpicture='" + houseMainpicture + '\'' +
                ", houseTheme='" + houseTheme + '\'' +
                ", houseScore=" + houseScore +
                ", housePrice=" + housePrice +
                '}';
    }
}
