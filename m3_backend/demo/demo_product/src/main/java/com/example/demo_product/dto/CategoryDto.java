package com.example.demo_product.dto;

import com.example.demo_product.entity.Product;

import java.util.List;

public class CategoryDto {
    private int id;
    private String name;
    private List<Product> productList;

    public CategoryDto() {
    }

    public CategoryDto(int id, String name, List<Product> productList) {
        this.id = id;
        this.name = name;
        this.productList = productList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
