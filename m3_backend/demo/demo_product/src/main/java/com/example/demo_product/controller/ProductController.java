package com.example.demo_product.controller;

import com.example.demo_product.dto.CategoryDto;
import com.example.demo_product.dto.ProductDto;
import com.example.demo_product.entity.Category;
import com.example.demo_product.entity.Product;
import com.example.demo_product.service.CategoryService;
import com.example.demo_product.service.ICategoryService;
import com.example.demo_product.service.IProductService;
import com.example.demo_product.service.ProductService;
import com.example.demo_product.util.Validate;
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
    private ICategoryService categoryService = new CategoryService();
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
            case "detail":
                showDetail(req,resp);
                break;
            case "edit":
                showEdit(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
            case "category":
                showListCategory(req,resp);
                break;
            default:
                showList(req,resp);
                break;
        }

    }

    private void showListCategory(HttpServletRequest req, HttpServletResponse resp) {
        List<CategoryDto> showCategory = categoryService.getAllDto();
        try {
            req.setAttribute("showCategory",showCategory);
            req.getRequestDispatcher("/view/product/category.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String category = req.getParameter("category");
        List<ProductDto> productList = null;
        if ((name!=null && !name.trim().isEmpty()) ||
                (category!=null && !category.trim().isEmpty())) {
            productList = productService.search(name,category);
        }else {
            productList = productService.getAll();
        }
        req.setAttribute("productList",productList);
        req.setAttribute("categoryList",categoryService.getAll());
        req.setAttribute("name",name);
        try {
            req.getRequestDispatcher("/view/product/form.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.showEdit(id);
        req.setAttribute("product",product);
        try {
            req.setAttribute("categoryList",categoryService.getAll());
            req.getRequestDispatcher("/view/product/edit.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        ProductDto productDto = productService.showDetail(id);
        req.setAttribute("productDto",productDto);
        try {
            req.getRequestDispatcher("/view/product/detail.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<ProductDto> productList = productService.getAll();
        req.setAttribute("productList",productList);
        try {
            req.setAttribute("categoryList",categoryService.getAll());
            req.getRequestDispatcher("/view/product/form.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setAttribute("categoryList",categoryService.getAll());
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
                deleteById(req,resp);
                break;
            case "edit":
                updateProduct(req,resp);
                break;
            default:
        }
    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isSuccess = productService.delete(deleteId);
        String mess = isSuccess ? "delete success" : "delete fail";
        try {
            resp.sendRedirect("/products?mess="+mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String categoryIdStr = req.getParameter("categoryIdStr");
        int categoryId = 0;
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        double setPrice = 0;
        String categoryErr = "";
        String nameErr = "";
        String desErr = "";
        String priceErr = "";

        if (categoryIdStr==null || categoryIdStr.trim().isEmpty()){
            categoryErr = "category must not be null";
        }else {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
                if (categoryId<=0) categoryErr = "the number cannot less than 0";
            } catch (NumberFormatException e) {
                categoryErr = "categoryId must be a number";
            }
        }

        if (name==null || name.trim().isEmpty()){
            nameErr = "name must not be null!";
        } else if (!Validate.checkName(name)) {
            nameErr = "Invalid name, please fill again";
        }

        if (description==null || description.trim().isEmpty()){
            desErr = "string must not be null!";
        } else if (!Validate.checkDes(description)) {
            desErr = "Invalid string, please fill again";
        }

        if (price == null || price.trim().isEmpty()){
            priceErr = "price must not be null";
        }else {
            try {
                setPrice = Double.parseDouble(price);
                if (setPrice<0) priceErr = "price cannot less than 0 ";
            }catch (NumberFormatException e){
                priceErr = "price must be a number";
            }
        }

        if (!categoryErr.isEmpty() || !nameErr.isEmpty() || !desErr.isEmpty() || !priceErr.isEmpty()) {
            req.setAttribute("categoryList",categoryService.getAll());

            req.setAttribute("categoryIdStr",categoryIdStr);
            req.setAttribute("name",name);
            req.setAttribute("description",description);
            req.setAttribute("price",price);

            req.setAttribute("categoryErr",categoryErr);
            req.setAttribute("nameErr",nameErr);
            req.setAttribute("desErr",desErr);
            req.setAttribute("priceErr",priceErr);
            try {
                req.getRequestDispatcher("/view/product/add.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        Product product = new Product(categoryId,name,description,setPrice);
        boolean isSuccess = productService.add(product);
        String mess = isSuccess ? "Add new success" : "Add new fail";
        try {
            resp.sendRedirect("/products?mess="+mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String categoryIdStrUp = req.getParameter("categoryIdStrUp");
        int categoryId = 0;
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        double setPrice = 0;
        String categoryErr = "";
        String nameErr = "";
        String desErr = "";
        String priceErr = "";

        if (categoryIdStrUp==null || categoryIdStrUp.trim().isEmpty()){
            categoryErr = "category must not be null";
        }else {
            try {
                categoryId = Integer.parseInt(categoryIdStrUp);
                if (categoryId<=0) categoryErr = "the number cannot less than 0";
            } catch (NumberFormatException e) {
                categoryErr = "categoryId must be a number";
            }
        }

        if (name==null || name.trim().isEmpty()){
            nameErr = "name must not be null!";
        } else if (!Validate.checkName(name)) {
            nameErr = "Invalid name, please fill again";
        }

        if (description==null || description.trim().isEmpty()){
            desErr = "string must not be null!";
        } else if (!Validate.checkDes(description)) {
            desErr = "Invalid string, please fill again";
        }

        if (price == null || price.trim().isEmpty()){
            priceErr = "price must not be null";
        }else {
            try {
                setPrice = Double.parseDouble(price);
                if (setPrice<0) priceErr = "price cannot less than 0 ";
            }catch (NumberFormatException e){
                priceErr = "price must be a number";
            }
        }

        if (!categoryErr.isEmpty() || !nameErr.isEmpty() || !desErr.isEmpty() || !priceErr.isEmpty()) {
            req.setAttribute("categoryList",categoryService.getAll());

            req.setAttribute("categoryIdStrUp",categoryIdStrUp);
            req.setAttribute("name",name);
            req.setAttribute("description",description);
            req.setAttribute("price",price);

            req.setAttribute("categoryErr",categoryErr);
            req.setAttribute("nameErr",nameErr);
            req.setAttribute("desErr",desErr);
            req.setAttribute("priceErr",priceErr);
            try {
                req.getRequestDispatcher("/view/product/edit.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        Product product = new Product(id,categoryId,name,description,setPrice);
        boolean isSuccess = productService.edit(product);
        String mess = isSuccess ? "Edit success" : "Edit fail";
        try {
            resp.sendRedirect("/products?mess="+mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
