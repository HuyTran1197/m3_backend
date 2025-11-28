package com.example.demo_money_change;

public class Calculator {
    private float first;
    private float second;
    private String choice;

    public float getFirst() {
        return first;
    }

    public void setFirst(float first) {
        this.first = first;
    }

    public float getSecond() {
        return second;
    }

    public void setSecond(float second) {
        this.second = second;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public float calculate(){
        switch (choice){
            case "addition":
                return getFirst()+getSecond();
            case "substraction":
                return getFirst()-getSecond();
            case "multip":
                return getFirst()*getSecond();
            case "divide":
                if (getSecond()==0){
                    throw new ArithmeticException("second number cannot be 0");
                }
                return getFirst()/getSecond();
            default:
                return -1;
        }
    }
}
