package com.example.demo_product.util;

public class Validate {
    public static boolean checkName(String regex){
        String nameRegex = "^[A-Z]\\w+(\\s\\w+)*$";
        return regex.matches(nameRegex);
    }
    public static boolean checkDes(String regex){
        String nameRegex = "^[\\p{L}\\d]+[.,]?(\\s([\\p{L}\\d]+[%-]?[.,]?)+)*$";
        return regex.matches(nameRegex);
    }
}
