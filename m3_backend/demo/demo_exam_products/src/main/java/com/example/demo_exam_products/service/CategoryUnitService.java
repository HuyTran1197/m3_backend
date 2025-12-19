package com.example.demo_exam_products.service;

import com.example.demo_exam_products.entity.CategoryUnit;
import com.example.demo_exam_products.repo.CategoryUnitRepo;
import com.example.demo_exam_products.repo.ICategoryUnitRepo;

import java.util.List;

public class CategoryUnitService implements ICategoryUnitService{
    private ICategoryUnitRepo categoryUnitRepo = new CategoryUnitRepo();
    @Override
    public List<CategoryUnit> getAll() {
        return categoryUnitRepo.getAll();
    }
}
