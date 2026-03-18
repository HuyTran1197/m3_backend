package com.example.demo_exam_2.repository;

import java.util.List;

public interface IRepository<T> {
    List<T> getAll();
    boolean add(T t);
    boolean delete();
    List<T> search (String keyword);
}
