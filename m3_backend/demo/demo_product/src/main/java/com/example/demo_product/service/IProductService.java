package com.example.demo_product.service;

import com.example.demo_product.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    boolean add(Product product);
    boolean delete(String keyword);
}
