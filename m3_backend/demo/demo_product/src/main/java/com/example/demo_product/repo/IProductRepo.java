package com.example.demo_product.repo;

import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Product;

import java.util.List;

public interface IProductRepo {
    List<ProductDto> getAll();
    boolean add(Product product);
    boolean delete(int id);
    boolean edit (Product product);
    ProductDto showDetail(int id);
    List<ProductDto> search(String keyword);
}
