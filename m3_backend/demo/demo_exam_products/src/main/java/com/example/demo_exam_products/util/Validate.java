package com.example.demo_exam_products.util;

public class Validate {
    public static boolean checkName(String regex){
        String nameRegex = "^[\\p{L}\\d]+[.,]?(\\s([\\p{L}\\d]+[%-]?[.,]?)+)*$";
        return regex.matches(nameRegex);
    }
    public static boolean checkId(String id){
        String regexId = "^MHH-[A-Z0-9]{4}$";
        return id.matches(regexId);
    }
}
