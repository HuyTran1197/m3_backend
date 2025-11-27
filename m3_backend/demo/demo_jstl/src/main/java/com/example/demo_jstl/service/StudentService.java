package com.example.demo_jstl.service;

import com.example.demo_jstl.entity.Student;
import com.example.demo_jstl.repository.IStudentRepo;
import com.example.demo_jstl.repository.StudentRepo;

import java.util.List;

public class StudentService implements IStudentService{
    private static IStudentRepo studentRepo = new StudentRepo();
    @Override
    public List<Student> findAll() {
        return studentRepo.findAll();
    }
}
