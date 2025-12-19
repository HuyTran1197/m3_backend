package com.example.demo_exam_products.entity;


import java.sql.Date;

public class Product {
    private String productId;
    private int productsUnit;
    private int productsType;
    private String name;
    private double price;
    private java.sql.Date date;

    public Product() {
    }

    public Product(int productsUnit, int productsType, String name, double price, Date date) {
        this.productsUnit = productsUnit;
        this.productsType = productsType;
        this.name = name;
        this.price = price;
        this.date = date;
    }

    public Product(String productId, int productsUnit, int productsType, String name, double price, java.sql.Date date) {
        this.productId = productId;
        this.productsUnit = productsUnit;
        this.productsType = productsType;
        this.name = name;
        this.price = price;
        this.date = date;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getProductsUnit() {
        return productsUnit;
    }

    public void setProductsUnit(int productsUnit) {
        this.productsUnit = productsUnit;
    }

    public int getProductsType() {
        return productsType;
    }

    public void setProductsType(int productsType) {
        this.productsType = productsType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
