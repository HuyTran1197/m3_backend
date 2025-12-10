package com.example.demo_product.service;

import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Product;
import com.example.demo_product.repo.IProductRepo;
import com.example.demo_product.repo.ProductRepo;
import com.example.demo_product.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService{
    private IProductRepo productRepo = new ProductRepo();
    @Override
    public List<ProductDto> getAll() {
        return productRepo.getAll();
    }

    @Override
    public boolean add(Product product) {
        for (ProductDto p : productRepo.getAll()){
            if (p.getName().equals(product.getName())){
                if (p.getDescription().equals(product.getDescription())){
                    return false;
                }
            }
        }
        return productRepo.add(product);
    }

    @Override
    public boolean delete(int id) {
        return productRepo.delete(id);
    }

    @Override
    public boolean edit(Product product) {
        return productRepo.edit(product);
    }

    @Override
    public ProductDto showDetail(int id) {
        return productRepo.showDetail(id);
    }

    public Product showEdit(int id){
        Product product = null;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from products where id = ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                int category = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                product = new Product(id,category,name,description,price);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public List<ProductDto> search(String keyword) {
        return productRepo.search(keyword);
    }
}
