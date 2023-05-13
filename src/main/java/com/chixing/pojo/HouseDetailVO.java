package com.chixing.pojo;

import java.util.List;

public class HouseDetailVO {
    private House house;
    private List<Comment> commentList;

    public HouseDetailVO(){}

    public HouseDetailVO(House house, List<Comment> commentList) {
        this.house = house;
        this.commentList = commentList;
    }

    @Override
    public String toString() {
        return "HouseDetailVO{" +
                "house=" + house +
                ", commentList=" + commentList +
                '}';
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
}
