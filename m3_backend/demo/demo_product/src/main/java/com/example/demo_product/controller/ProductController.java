package com.example.demo_product.controller;

import com.example.demo_product.entity.Product;
import com.example.demo_product.service.IProductService;
import com.example.demo_product.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "productController",value = "/products")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "add":
                showFormAdd(req,resp);
                break;
            default:
                showList(req,resp);
                break;
        }

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = productService.getAll();
        req.setAttribute("productList",productList);
        try {
            req.getRequestDispatcher("/view/product/form.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/product/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "add":
                save(req,resp);
                break;
            case "delete":
                deleteByKeyword(req,resp);
                break;
            default:
        }
    }

    private void deleteByKeyword(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        boolean isSuccess = productService.delete(keyword);
        String mess = isSuccess ? "delete success" : "delete fail";
        try {
            resp.sendRedirect("/products?mess="+mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        Product product = new Product(name,description,price);
        boolean isSuccess = productService.add(product);
        String mess = isSuccess ? "Add new success" : "Add new fail";
        try {
            resp.sendRedirect("/products?mess="+mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
