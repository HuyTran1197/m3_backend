package com.example.demo_product.service;

import com.example.demo_product.dto.CategoryDto;
import com.example.demo_product.entity.Category;

import java.util.List;

public interface ICategoryService {
    List<CategoryDto> getAllDto();
    List<Category> getAll();
}
