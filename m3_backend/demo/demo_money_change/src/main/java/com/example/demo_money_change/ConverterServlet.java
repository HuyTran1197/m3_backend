package com.example.demo_money_change;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConverterServlet",value = "/converter")
public class ConverterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double rate = Double.parseDouble(req.getParameter("rate"));
        double usd = Double.parseDouble(req.getParameter("usd"));
        double vnd = rate * usd;
        req.setAttribute("rate",rate);
        req.setAttribute("usd",usd);
        req.setAttribute("vnd",vnd);
        req.getRequestDispatcher("/view/form/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        double rate = Double.parseDouble(req.getParameter("rate"));
//        double usd = Double.parseDouble(req.getParameter("usd"));
//        double vnd = rate * usd;
//        req.setAttribute("rate",rate);
//        req.setAttribute("usd",usd);
//        req.setAttribute("vnd",vnd);
//        req.getRequestDispatcher("/view/form.jsp").forward(req,resp);
        req.getRequestDispatcher("/view/form/form.jsp").forward(req,resp);
    }
}
