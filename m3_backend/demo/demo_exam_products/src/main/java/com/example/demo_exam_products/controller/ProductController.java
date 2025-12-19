package com.example.demo_exam_products.controller;

import com.example.demo_exam_products.dto.ProductDto;
import com.example.demo_exam_products.entity.Product;
import com.example.demo_exam_products.service.*;
import com.example.demo_exam_products.util.Validate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "ProductController",value = "/products")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    private static ICategoryUnitService categoryUnitService = new CategoryUnitService();
    private ICategoryTypeService categoryTypeService = new CategoryTypeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "add":
                showAdd(req,resp);
                break;
            case "edit":
                showEdit(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
            default:
                showList(req,resp);
                break;

        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String type = req.getParameter("type");
        double setPrice = -1;
        String priceErr = "";
        List<ProductDto> productDtoList = null;

        if (price == null || price.trim().isEmpty()){
            priceErr = "giá không được bỏ trống";
        }else {
            try {
                setPrice = Double.parseDouble(price);
                if (setPrice<0) priceErr = "giá không được bé hơn 0";
                else if (setPrice<1000) priceErr = "giá phải là một số nguyên dương từ 1000VND trở lên";
            }catch (NumberFormatException e){
                priceErr = "giá phải là một số";
            }
        }

        if ((name!=null && !name.trim().isEmpty()) ||
                (type!=null && !type.trim().isEmpty()) ||
                (price!=null&&!price.trim().isEmpty()) ){
            productDtoList = productService.search(name,setPrice,type);
        }else {
            productDtoList = productService.getAll();
        }
        req.setAttribute("productDtoList",productDtoList);
        req.setAttribute("categoryTypeList",categoryTypeService.getAll());
        req.setAttribute("name",name);
        req.setAttribute("price",price);
        req.setAttribute("priceErr",priceErr);
        try {
            req.getRequestDispatcher("/view/product/form.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<ProductDto> productDtoList = productService.getAll();
        req.setAttribute("productDtoList",productDtoList);
        try {
            req.setAttribute("categoryUnitList",categoryUnitService.getAll());
            req.setAttribute("categoryTypeList",categoryTypeService.getAll());
            req.getRequestDispatcher("/view/product/form.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        Product product = productService.showEdit(id);
        req.setAttribute("product",product);
        try {
            req.setAttribute("categoryUnitList",categoryUnitService.getAll());
            req.setAttribute("categoryTypeList",categoryTypeService.getAll());
            req.getRequestDispatcher("/view/product/edit.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setAttribute("categoryUnitList",categoryUnitService.getAll());
            req.setAttribute("categoryTypeList",categoryTypeService.getAll());
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
                saveAdd(req,resp);
                break;
            case "delete":
                deleteById(req,resp);
                break;
            case "edit":
                saveEdit(req,resp);
                break;
            default:
        }
    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        boolean isSuccess = productService.delete(id);
        String mess = isSuccess ? "Xóa thành công" : "Xóa không thành công";
        req.setAttribute("mess",mess);
        req.setAttribute("messStyle",mess);
        showList(req,resp);
    }

    private void saveEdit(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String unitId = req.getParameter("unitId");
        String typeId = req.getParameter("typeId");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String date = req.getParameter("date");
        String unitErr = "";
        String typeErr = "";
        String nameErr = "";
        String priceErr = "";
        double setPrice = 0;
        int unit = 0;
        int type = 0;
        String dateErr = "";
        Date setDate = null;

        if (unitId==null || unitId.trim().isEmpty()){
            unitErr = "unit không được để trống";
        }else {
            unit = Integer.parseInt(unitId);
        }

        if (typeId==null || typeId.trim().isEmpty()){
            typeErr = "type không được để trống";
        }else {
            type = Integer.parseInt(typeId);
        }

        if (name==null || name.trim().isEmpty()){
            nameErr = "tên không được để trống";
        } else if (!Validate.checkName(name)) {
            nameErr = "tên sai format, vui lòng nhập lại";
        }

        if (price == null || price.trim().isEmpty()){
            priceErr = "giá không được bỏ trống";
        }else {
            try {
                setPrice = Double.parseDouble(price);
                if (setPrice<0) priceErr = "giá không được bé hơn 0";
                else if (setPrice<1000) priceErr = "giá phải là một số nguyên dương từ 1000VND trở lên";
            }catch (NumberFormatException e){
                priceErr = "giá phải là một số";
            }
        }

        if (date == null || date.trim().isEmpty()) {
            dateErr = "date không được để trống";
        } else {
            try {
                setDate = Date.valueOf(date);
            } catch (IllegalArgumentException e) {
                dateErr = "date không đúng định dạng";
            }
        }

        if (!nameErr.isEmpty() || !unitErr.isEmpty() || !priceErr.isEmpty() ||
                !typeErr.isEmpty() || !dateErr.isEmpty()) {
            req.setAttribute("categoryUnitList",categoryUnitService.getAll());
            req.setAttribute("unitId",unitId);
            req.setAttribute("name",name);
            req.setAttribute("price",price);
            req.setAttribute("categoryTypeList",categoryTypeService.getAll());
            req.setAttribute("typeId",typeId);
            req.setAttribute("date",date);
            req.setAttribute("nameErr",nameErr);
            req.setAttribute("priceErr",priceErr);
            req.setAttribute("unitErr",unitErr);
            req.setAttribute("typeErr",typeErr);
            req.setAttribute("dateErr",dateErr);
            try {
                req.getRequestDispatcher("/view/product/edit.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        Product product = new Product(id,unit,type,name,setPrice,setDate);
        boolean isSuccess = productService.edit(product);
        String mess = isSuccess ? "Chỉnh sửa thành công" : "Chỉnh sửa không thành công";
        req.setAttribute("mess",mess);
        req.setAttribute("messStyle",mess);
        showList(req,resp);
    }

    private void saveAdd(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String unitId = req.getParameter("unitId");
        String typeId = req.getParameter("typeId");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String date = req.getParameter("date");
        String idErr = "";
        String unitErr = "";
        String typeErr = "";
        String nameErr = "";
        String priceErr = "";
        double setPrice = 0;
        int unit = 0;
        int type = 0;
        String dateErr = "";
        Date setDate = null;

        if (id==null || id.trim().isEmpty()){
            idErr = "id không được để trống";
        } else if (!Validate.checkId(id)) {
            idErr = "id sai format";
        }

        if (unitId==null || unitId.trim().isEmpty()){
            unitErr = "unit không được để trống";
        }else {
            unit = Integer.parseInt(unitId);
        }

        if (typeId==null || typeId.trim().isEmpty()){
            typeErr = "type không được để trống";
        }else {
            type = Integer.parseInt(typeId);
        }

        if (name==null || name.trim().isEmpty()){
            nameErr = "tên không được để trống";
        } else if (!Validate.checkName(name)) {
            nameErr = "tên sai format, vui lòng nhập lại";
        }

        if (price == null || price.trim().isEmpty()){
            priceErr = "giá không được bỏ trống";
        }else {
            try {
                setPrice = Double.parseDouble(price);
                if (setPrice<0) priceErr = "giá không được bé hơn 0";
                else if (setPrice<1000) priceErr = "giá phải là một số nguyên dương từ 1000VND trở lên";
            }catch (NumberFormatException e){
                priceErr = "giá phải là một số";
            }
        }

        if (date == null || date.trim().isEmpty()) {
            dateErr = "date không được để trống";
        } else {
            try {
                setDate = Date.valueOf(date);
            } catch (IllegalArgumentException e) {
                dateErr = "date không đúng định dạng";
            }
        }


        if (!idErr.isEmpty() || !nameErr.isEmpty() || !unitErr.isEmpty() || !priceErr.isEmpty() ||
        !typeErr.isEmpty() || !dateErr.isEmpty()) {

            req.setAttribute("id",id);
            req.setAttribute("categoryUnitList",categoryUnitService.getAll());
            req.setAttribute("unitId",unitId);
            req.setAttribute("name",name);
            req.setAttribute("price",price);
            req.setAttribute("categoryTypeList",categoryTypeService.getAll());
            req.setAttribute("date",date);
            req.setAttribute("idErr",idErr);
            req.setAttribute("typeId",typeId);
            req.setAttribute("nameErr",nameErr);
            req.setAttribute("priceErr",priceErr);
            req.setAttribute("unitErr",unitErr);
            req.setAttribute("typeErr",typeErr);
            req.setAttribute("dateErr",dateErr);
            try {
                req.getRequestDispatcher("/view/product/add.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        Product product = new Product(id,unit,type,name,setPrice,setDate);
        boolean isSuccess = productService.add(product);
        String mess = isSuccess ? "Thêm mới thành công" : "Thêm mới không thành công";
        req.setAttribute("mess",mess);
        req.setAttribute("messStyle",mess);
        showList(req,resp);
    }
}
