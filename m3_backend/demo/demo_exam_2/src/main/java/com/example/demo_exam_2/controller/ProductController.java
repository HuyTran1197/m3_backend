package com.example.demo_exam_2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Controller",value = "/products")
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                showAdd(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
            default:
                showList(req,resp);
                break;
        }
    }


    private void showList(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                save(req,resp);
                break;
            case "delete":
                deleteById(req,resp);
                break;
            default:

        }
    }


    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String xxx = req.getParameter("xxx");
        String xErr = "";


        // valida price
//        if (price == null || price.trim().isEmpty()){
//            priceErr = "giá không được bỏ trống";
//        }else {
//            try {
//                setPrice = Double.parseDouble(price);
//                if (setPrice<0) priceErr = "giá không được bé hơn 0";
//                else if (setPrice<1000) priceErr = "giá phải là một số nguyên dương từ 1000VND trở lên";
//            }catch (NumberFormatException e){
//                priceErr = "giá phải là một số";
//            }
//        }

        // lưu ý: xuất thông báo bằng modal: add, delete, edit
        // boolean isSuccess = service.add();
        // String mess = isSuccess ? "thành công" : " không thành công";
        // setAttribute cho mess và messStyle
        // gọi showList(req,resp);
    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        // lấy param của id


        // set lại id là int hoặc string trước gọi service
//        String id = req.getParameter("id");
//        boolean isSuccess = productService.delete(id);
//        String mess = isSuccess ? "Xóa thành công" : "Xóa không thành công";
//        req.setAttribute("mess",mess);
//        req.setAttribute("messStyle",mess);
//        showList(req,resp);
    }

}
