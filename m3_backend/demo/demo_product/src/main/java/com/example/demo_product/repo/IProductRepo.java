package com.example.demo_product.repo;

import com.example.demo_product.entity.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> getAll();
    boolean add(Product product);
    boolean delete(String keyword);
}
