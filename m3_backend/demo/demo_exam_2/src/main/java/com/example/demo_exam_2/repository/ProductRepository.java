package com.example.demo_exam_2.repository;

import com.example.demo_exam_2.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository{
    private final String GET_ALL = "";
    private final String INSERT_INTO = "";
    private final String DELETE_BY_ID = "";
    @Override
    public List getAll() {
//        List<> list = new ArrayList<>();
//        Connection connection = ConnectDB.getConnectDB();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return List.of();
    }

    @Override
    public boolean add(Object o) {
//        // tham số luôn luôn là entity thuờng, không được dto
//        try(Connection connection = ConnectDB.getConnectDB()) {
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
//            // prepare.set lấy tất cả tham số trong đối tượng thật của db
              // các tham số đều lấy getXX() chứ k phải ""
//            // sau đó tạo resultSet update để lưu tất cả
//            int effectRow = preparedStatement.executeUpdate();
//            return effectRow == 1;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return false;
    }

    @Override
    public boolean delete() {
        Connection connection = ConnectDB.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public List search(String keyword) {
        return List.of();
    }
}
