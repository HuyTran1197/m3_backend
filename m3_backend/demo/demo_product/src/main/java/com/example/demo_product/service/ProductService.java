package com.example.demo_product.service;

import com.example.demo_product.entity.Product;
import com.example.demo_product.repo.IProductRepo;
import com.example.demo_product.repo.ProductRepo;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepo productRepo = new ProductRepo();
    @Override
    public List<Product> getAll() {
        return productRepo.getAll();
    }

    @Override
    public boolean add(Product product) {
        for (Product p : productRepo.getAll()){
            if (p.getName().equals(product.getName())){
                if (p.getDescription().equals(product.getDescription())){
                    return false;
                }
            }
        }
        return productRepo.add(product);
    }

    @Override
    public boolean delete(String keyword) {
        return productRepo.delete(keyword);
    }
}
