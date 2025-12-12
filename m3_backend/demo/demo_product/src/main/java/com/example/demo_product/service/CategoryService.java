package com.example.demo_product.service;

import com.example.demo_product.entity.Category;
import com.example.demo_product.repo.CategoryRepository;
import com.example.demo_product.repo.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    private ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> getAll() {
        return categoryRepository.getAll();
    }

//    public List<Category> showProduct(){
//
//    }
}
