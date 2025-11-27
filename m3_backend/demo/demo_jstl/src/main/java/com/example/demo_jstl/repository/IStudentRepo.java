package com.example.demo_jstl.repository;

import com.example.demo_jstl.entity.Student;

import java.util.List;

public interface IStudentRepo {
    List<Student> findAll();
}
