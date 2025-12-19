package com.example.demo_exam_products.dto;


import java.sql.Date;

public class ProductDto {
    private String productId;
    private String name;
    private String productsUnit;
    private double price;
    private String productsType;
    private java.sql.Date date;

    public ProductDto() {
    }

    public ProductDto(String name, String productsUnit, double price, String productsType, Date date) {
        this.name = name;
        this.productsUnit = productsUnit;
        this.price = price;
        this.productsType = productsType;
        this.date = date;
    }

    public ProductDto(String productId, String name, String productsUnit, double price, String productsType, Date date) {
        this.productId = productId;
        this.name = name;
        this.productsUnit = productsUnit;
        this.price = price;
        this.productsType = productsType;
        this.date = date;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProductsUnit() {
        return productsUnit;
    }

    public void setProductsUnit(String productsUnit) {
        this.productsUnit = productsUnit;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductsType() {
        return productsType;
    }

    public void setProductsType(String productsType) {
        this.productsType = productsType;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
