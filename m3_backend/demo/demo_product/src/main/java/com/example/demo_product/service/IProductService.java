package com.example.demo_product.service;

import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Product;

import java.util.List;

public interface IProductService {
    List<ProductDto> getAll();
    boolean add(Product product);
    boolean delete(int id);
    boolean edit(Product product);
    ProductDto showDetail(int id);
    Product showEdit(int id);
    List<ProductDto> search(String searchName,String categoryName);
}
