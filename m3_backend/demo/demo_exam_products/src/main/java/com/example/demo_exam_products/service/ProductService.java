package com.example.demo_exam_products.service;

import com.example.demo_exam_products.dto.ProductDto;
import com.example.demo_exam_products.entity.Product;
import com.example.demo_exam_products.repo.IProductRepository;
import com.example.demo_exam_products.repo.ProductRepo;
import com.example.demo_exam_products.util.ConnectDB;

import java.sql.*;
import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepo();
    @Override
    public List<ProductDto> getAll() {
        return productRepository.getAll();
    }

    @Override
    public boolean add(Product product) {
        for (ProductDto p : productRepository.getAll()){
            if (p.getName().equals(product.getName())){
                return false;
            }
        }
        return productRepository.add(product);
    }

    @Override
    public boolean delete(String id) {
        return productRepository.delete(id);
    }

    @Override
    public boolean edit(Product product) {
        return productRepository.edit(product);
    }

    public Product showEdit(String id){
        Product product = null;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from products where id = ?");
            preparedStatement.setString(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                int products_unit = resultSet.getInt("products_unit");
                int products_type = resultSet.getInt("products_type");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                Date date = resultSet.getDate("receive_date");
                product = new Product(id,products_unit,products_type,name,price,date);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public List<ProductDto> search(String name, double price, String type) {
        return productRepository.search(name,price,type);
    }
}
