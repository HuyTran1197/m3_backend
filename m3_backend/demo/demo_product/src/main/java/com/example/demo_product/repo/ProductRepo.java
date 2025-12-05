package com.example.demo_product.repo;

import com.example.demo_product.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo{
    private static List<Product> productList = new ArrayList<>();
    static {
       productList.add(new Product("Iphone 11 ProMax","128gb",7500));
       productList.add(new Product("Iphone 15 ProMax","256gb",9000));
       productList.add(new Product("SamSung Note 20","256gb",9000));
    }
    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public boolean add(Product product) {
        return productList.add(product);
    }

    @Override
    public boolean delete(String keyword) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().equals(keyword)){
                productList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean edit(Product product) {
        boolean isSuccess = false;
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().toLowerCase().contains(product.getName().toLowerCase())){
                productList.set(i,product);
                isSuccess = true;
                break;
            }
        }
        return isSuccess;
    }
}
