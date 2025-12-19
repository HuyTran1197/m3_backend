package com.example.demo_exam_products.entity;

public class CategoryUnit {
    private int id;
    private String name;

    public CategoryUnit() {
    }

    public CategoryUnit(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public CategoryUnit(String name) {
        this.name = name;
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
}
