package com.example.demo_exam_products.service;

import com.example.demo_exam_products.dto.ProductDto;
import com.example.demo_exam_products.entity.Product;

import java.util.List;

public interface IProductService {
    List<ProductDto> getAll();
    boolean add(Product product);
    boolean delete(String id);
    boolean edit (Product product);
    Product showEdit(String id);
    List<ProductDto> search(String name, double price, String type);
}
