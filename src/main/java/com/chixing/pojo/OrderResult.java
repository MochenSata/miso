package com.chixing.pojo;

public class OrderResult {
    private Myorder myorder;
    private MyorderOccupy myorderOccupy;
    public OrderResult(){}
    public OrderResult(Myorder myorder, MyorderOccupy myorderOccupy) {
        this.myorder = myorder;
        this.myorderOccupy = myorderOccupy;
    }

    public Myorder getMyorder() {
        return myorder;
    }

    public void setMyorder(Myorder myorder) {
        this.myorder = myorder;
    }

    public MyorderOccupy getMyorderOccupy() {
        return myorderOccupy;
    }

    public void setMyorderOccupy(MyorderOccupy myorderOccupy) {
        this.myorderOccupy = myorderOccupy;
    }

    @Override
    public String toString() {
        return "OrderResult{" +
                "myorder=" + myorder +
                ", myorderOccupy=" + myorderOccupy +
                '}';
    }
}
