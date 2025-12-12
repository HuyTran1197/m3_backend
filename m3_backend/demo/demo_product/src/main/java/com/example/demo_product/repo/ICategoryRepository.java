package com.example.demo_product.repo;

import com.example.demo_product.dto.CategoryDto;
import com.example.demo_product.entity.Category;

import java.util.List;

public interface ICategoryRepository {
    List<CategoryDto> getAllDto();
    List<Category> getAll();
}
