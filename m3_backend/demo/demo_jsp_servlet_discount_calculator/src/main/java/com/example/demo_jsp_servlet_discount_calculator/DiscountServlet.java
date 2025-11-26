package com.example.demo_jsp_servlet_discount_calculator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DiscountServlet",value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double number1 = Double.parseDouble(req.getParameter("price"));
        double number2 = Double.parseDouble(req.getParameter("discount"));
        req.setAttribute("discount_amount",(number1*number2*0.01));
        req.setAttribute("last_price",number1*(number1*number2*0.01));
        req.getRequestDispatcher("/view/form.jsp").forward(req,resp);
    }
}
