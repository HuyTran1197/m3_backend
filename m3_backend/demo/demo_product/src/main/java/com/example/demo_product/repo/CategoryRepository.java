package com.example.demo_product.repo;

import com.example.demo_product.dto.CategoryDto;
import com.example.demo_product.entity.Category;
import com.example.demo_product.entity.Product;
import com.example.demo_product.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private final String LIST_CATEGORY = "select c.*, p.name as products_name " +
            "from category c " +
            "left join products p on c.id = p.category_id;";
    private final String SELECT_ALL = "select * from category";

    @Override
    public List<CategoryDto> getAllDto() {
        List<CategoryDto> categoryList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(LIST_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String productName = resultSet.getString("products_name");
                List<Product> products = new ArrayList<>();
                Product p = new Product();
                p.setName(productName);
                products.add(p);
                CategoryDto categoryDto = new CategoryDto(id,name,products);
                categoryList.add(categoryDto);
            }
        } catch (SQLException e) {
            System.out.println("Fail Select All Query !!");
        }
        return categoryList;
    }

    @Override
    public List<Category> getAll() {
        List<Category> categoryList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
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
