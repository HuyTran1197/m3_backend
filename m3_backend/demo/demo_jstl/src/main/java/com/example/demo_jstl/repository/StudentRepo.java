package com.example.demo_jstl.repository;

import com.example.demo_jstl.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepo implements IStudentRepo{
    private static List<Student> studentList = new ArrayList<>();
    static{
        studentList.add(new Student("Dương Minh Thông","1990-09-15","Kon Tum",true));
        studentList.add(new Student("Nguyễn Thị Lệ","1995-03-20","Hà Nội",false));
        studentList.add(new Student("Nguyễn Hồng","2003-09-15","Huế",false));
        studentList.add(new Student("Trần Tiến","2000-01-23","Đà Nẵng",true));
        studentList.add(new Student("Trần Minh Hạo","1997-11-05","Đà Nẵng",true));
    }
    @Override
    public List<Student> findAll() {
        return studentList;
    }
}
