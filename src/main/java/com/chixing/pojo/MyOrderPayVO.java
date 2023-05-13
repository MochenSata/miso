package com.chixing.pojo;

public class MyOrderPayVO {
    private Myorder myorder;
    private Payment payment;

    public MyOrderPayVO(){}
    public MyOrderPayVO(Myorder myorder, Payment payment) {
        this.myorder = myorder;
        this.payment = payment;
    }

    public Myorder getMyorder() {
        return myorder;
    }

    public void setMyorder(Myorder myorder) {
        this.myorder = myorder;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "MyOrderPayVO{" +
                "myorder=" + myorder +
                ", payment=" + payment +
                '}';
    }
}
