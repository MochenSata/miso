package com.chixing.pojo;


import java.time.LocalDate;

public class OrderCountAndDataVO {
    private Integer custNum;
    private LocalDate custStartDate;
    private LocalDate custEndDate;
    public OrderCountAndDataVO(){}
    public OrderCountAndDataVO(Integer custNum, LocalDate custStartDate, LocalDate custEndDate) {
        this.custNum = custNum;
        this.custStartDate = custStartDate;
        this.custEndDate = custEndDate;
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

    @Override
    public String toString() {
        return "OrderDetail{" +
                "custNum=" + custNum +
                ", custStartDate=" + custStartDate +
                ", custEndDate=" + custEndDate +
                '}';
    }
}
