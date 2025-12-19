package com.example.demo_exam_products.repo;

import com.example.demo_exam_products.entity.CategoryType;
import com.example.demo_exam_products.entity.CategoryUnit;
import com.example.demo_exam_products.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryTypeRepo implements ICategoryTypeRepo{
    private final String SELECT_ALL = "select * from category_type";
    @Override
    public List<CategoryType> getAll() {
        List<CategoryType> categoryTypeList= new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                CategoryType categoryType = new CategoryType(id,name);
                categoryTypeList.add(categoryType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryTypeList;
    }
}
