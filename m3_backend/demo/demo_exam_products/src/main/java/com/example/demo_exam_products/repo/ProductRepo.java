package com.example.demo_exam_products.repo;

import com.example.demo_exam_products.dto.ProductDto;
import com.example.demo_exam_products.entity.Product;
import com.example.demo_exam_products.util.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepository{
    private final String SELECT_ALL = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "order by p.id";
    private final String INSERT_INTO = "insert into products(id,products_unit,products_type,name,price,receive_date) " +
            "values(?,?,?,?,?,?)";
    private final String DELETE_BY_ID = "delete from products where id = ?";
    private final String UPDATE_BY_ID = "update products set products_unit=?, " +
            "products_type=?, " +
            "name=?, " +
            "price=?, " +
            "receive_date=? " +
            "where id = ?";
    private final String SEARCH_ALL = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.name like ? and p.price = ? and ct.id = ?;";
    private final String SEARCH_NAME = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.name like ?";
    private final String SEARCH_PRICE = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.price = ?";
    private final String SEARCH_TYPE = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where ct.id = ?";
    private final String SEARCH_NAME_PRICE = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.name like ? and p.price = ?";
    private final String SEARCH_NAME_TYPE = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.name like ? and ct.id = ?";
    private final String SEARCH_PRICE_TYPE = "select p.id,p.name,cu.name as unit,p.price,ct.name as type,p.receive_date as date from products p " +
            "join category_unit cu on p.products_unit = cu.id " +
            "join category_type ct on p.products_type = ct.id " +
            "where p.price = ? and ct.id = ?";
    @Override
    public List<ProductDto> getAll() {
        List<ProductDto> productDtoList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String nameCU = resultSet.getString("unit");
                double price = resultSet.getDouble("price");
                String nameCT = resultSet.getString("type");
                Date date = resultSet.getDate("date");
                ProductDto productDto = new ProductDto(id,name,nameCU,price,nameCT,date);
                productDtoList.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDtoList;
    }

    @Override
    public boolean add(Product product) {
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,product.getProductId());
            preparedStatement.setInt(2, product.getProductsUnit());
            preparedStatement.setInt(3,product.getProductsType());
            preparedStatement.setString(4, product.getName());
            preparedStatement.setDouble(5, product.getPrice());
            preparedStatement.setDate(6, product.getDate());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        boolean isSuccess;
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setString(1,id);
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
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setInt(1, product.getProductsUnit());
            preparedStatement.setInt(2, product.getProductsType());
            preparedStatement.setString(3, product.getName());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setDate(5, product.getDate());
            preparedStatement.setString(6, product.getProductId());
            isSuccess = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isSuccess;
    }

    @Override
    public List<ProductDto> search(String name, double price , String type) {
        List<ProductDto> searchProduct = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try(Connection connection = ConnectDB.getConnectDB()) {
            if (price<0 && type.equals("")){
                preparedStatement = connection.prepareStatement(SEARCH_NAME);
                preparedStatement.setString(1,"%"+name+"%");
            } else if (name.equals("") && type.equals("")) {
                preparedStatement = connection.prepareStatement(SEARCH_PRICE);
                preparedStatement.setDouble(1,price);
            } else if (name.equals("") && price<0) {
                preparedStatement = connection.prepareStatement(SEARCH_TYPE);
                preparedStatement.setString(1,type);
            } else if (name.equals("")) {
                preparedStatement = connection.prepareStatement(SEARCH_PRICE_TYPE);
                preparedStatement.setDouble(1,price);
                preparedStatement.setString(2,type);
            } else if (price<0) {
                preparedStatement = connection.prepareStatement(SEARCH_NAME_TYPE);
                preparedStatement.setString(1,"%"+name+"%");
                preparedStatement.setString(2,type);
            } else if (type.equals("")) {
                preparedStatement = connection.prepareStatement(SEARCH_NAME_PRICE);
                preparedStatement.setString(1,"%"+name+"%");
                preparedStatement.setDouble(2,price);
            }else {
                preparedStatement = connection.prepareStatement(SEARCH_ALL);
                preparedStatement.setString(1,"%"+name+"%");
                preparedStatement.setDouble(2,price);
                preparedStatement.setString(3,type);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String setName  = resultSet.getString("name");
                String setUnit  = resultSet.getString("unit");
                double setPrice = resultSet.getDouble("price");
                String setType = resultSet.getString("type");
                Date date = resultSet.getDate("date");
                ProductDto newProduct = new ProductDto(id,setName,setUnit,setPrice,setType,date);
                searchProduct.add(newProduct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return searchProduct;
    }
}
