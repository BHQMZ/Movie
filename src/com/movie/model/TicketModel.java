package com.movie.model;

public class TicketModel {
    private String id = "";
    private String price = "";
    private int number = -1;
    private String plaId = "";
    private String code = "";
    private String cusId = "";

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getPlaId() {
        return plaId;
    }

    public void setPlaId(String plaId) {
        this.plaId = plaId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }
}