package com.example.demo_product.repo;

import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Product;
import com.example.demo_product.util.ConnectDB;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo{
    private final String SELECT_ALL = "select p.*, c.name as category_name " +
            "from products p " +
            "join category c on c.id = p.category_id " +
            "order by p.name;";
    private final String SELECT_ID = "select p.*,c.name as category_name " +
            "from products p " +
            "join category c on c.id = p.category_id " +
            "where p.id = ?";
    private final String INSERT_INTO = "insert into products(category_id,name,description,price) values(?,?,?,?)";
    private final String DELETE_PRODUCT = "delete from products where id = ?";
    private final String UPDATE_PRODUCT = "update products set category_id=?, name=?,description=?,price=? where id = ?";
    private final String SEARCH_ALL = "select p.id,p.name,p.description,p.price,c.name as category_name " +
            "from products p " +
            "join category c on c.id = p.category_id " +
            "where p.name like ? and c.id = ?";
    private final String SEARCH_NAME = "select p.id,p.name,p.description,p.price,c.name as category_name " +
            "from products p " +
            "join category c on c.id = p.category_id " +
            "where p.name like ?";

    @Override
    public List<ProductDto> getAll() {
        List<ProductDto> productList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String categoryName = resultSet.getString("category_name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                ProductDto productDto = new ProductDto(id,name,categoryName,description,price);
                productList.add(productDto);
            }
        } catch (SQLException e) {
            System.out.println("Fail Select All Query !!");
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setInt(1,product.getCategoryId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4,product.getPrice());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        boolean isSuccess;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1,id);
            isSuccess = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    @Override
    public boolean edit(Product product) {
        boolean isSuccess;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setInt(1, product.getCategoryId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setInt(5, product.getId());
            isSuccess = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    @Override
    public ProductDto showDetail(int id) {
        ProductDto product = null;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                String name = resultSet.getString("name");
                String category = resultSet.getString("category_name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                product = new ProductDto(id,name,category,description,price);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public List<ProductDto> search(String searchName,String categoryName) {
        List<ProductDto> productDto = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = null;
            if (categoryName.equals("")){
                preparedStatement = connection.prepareStatement(SEARCH_NAME);
                preparedStatement.setString(1,"%"+searchName+"%");
            }else {
                preparedStatement = connection.prepareStatement(SEARCH_ALL);
                preparedStatement.setString(1,"%"+searchName+"%");
                preparedStatement.setString(2,categoryName);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String category = resultSet.getString("category_name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                ProductDto dto = new ProductDto(id,name,category,description,price);
                productDto.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDto;
    }
}
