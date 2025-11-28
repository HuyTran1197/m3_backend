package com.example.demo_money_change;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CalculateServlet", value = "/calculate")
public class CalculateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float number1 = Float.parseFloat(req.getParameter("n1"));
        float number2 = Float.parseFloat(req.getParameter("n2"));
        String choice = req.getParameter("choice");
        Calculator c = new Calculator();
        c.setFirst(number1);
        c.setSecond(number2);
        c.setChoice(choice);
        try {
            float result = c.calculate();
            req.setAttribute("result",result);
        }catch (ArithmeticException e){
            req.setAttribute("invalid",e.getMessage());
        }
        req.getRequestDispatcher("/view/form/form2.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/form/form2.jsp").forward(req,resp);
    }
}
