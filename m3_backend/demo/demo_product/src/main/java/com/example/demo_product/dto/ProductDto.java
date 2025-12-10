package com.example.demo_product.dto;

public class ProductDto {
    private int id;
    private String name;
    private String categoryName;
    private String description;
    private double price;

    public ProductDto() {
    }

    public ProductDto(int id, String name, String categoryName, String description, double price) {
        this.id = id;
        this.name = name;
        this.categoryName = categoryName;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
