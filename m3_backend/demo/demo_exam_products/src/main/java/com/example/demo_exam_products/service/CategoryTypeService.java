package com.example.demo_exam_products.service;

import com.example.demo_exam_products.entity.CategoryType;
import com.example.demo_exam_products.repo.CategoryTypeRepo;
import com.example.demo_exam_products.repo.ICategoryTypeRepo;

import java.util.List;

public class CategoryTypeService implements ICategoryTypeService{
    private ICategoryTypeRepo categoryTypeRepo = new CategoryTypeRepo();
    @Override
    public List<CategoryType> getAll() {
        return  categoryTypeRepo.getAll();
    }
}
