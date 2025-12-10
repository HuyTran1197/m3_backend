package com.example.demo_product.repo;

import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Category;
import com.example.demo_product.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    @Override
    public List<Category> getAll() {
        List<Category> categoryList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from category;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id,name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Fail Select All Query !!");
        }
        return categoryList;
    }
}
