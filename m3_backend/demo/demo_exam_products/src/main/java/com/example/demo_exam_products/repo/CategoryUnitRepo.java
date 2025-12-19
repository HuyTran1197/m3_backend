package com.example.demo_exam_products.repo;

import com.example.demo_exam_products.entity.CategoryUnit;
import com.example.demo_exam_products.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryUnitRepo implements ICategoryUnitRepo{
    private final String SELECT_ALL = "select * from category_unit";
    @Override
    public List<CategoryUnit> getAll() {
        List<CategoryUnit> categoryUnitList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                CategoryUnit categoryUnit = new CategoryUnit(id,name);
                categoryUnitList.add(categoryUnit);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryUnitList;
    }
}
