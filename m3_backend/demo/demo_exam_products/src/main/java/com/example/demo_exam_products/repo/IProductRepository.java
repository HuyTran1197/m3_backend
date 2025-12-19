package com.example.demo_exam_products.repo;

import com.example.demo_exam_products.dto.ProductDto;
import com.example.demo_exam_products.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDto> getAll();
    boolean add(Product product);
    boolean delete(String id);
    boolean edit (Product product);
    List<ProductDto> search(String name, double price, String type);
}
