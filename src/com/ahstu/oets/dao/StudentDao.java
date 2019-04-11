package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Student;

import java.util.ArrayList;

public interface StudentDao {
    public int insert(Student student) throws Exception;
    public int update(Student student) throws Exception;
    public int delete(int id) throws Exception;
    public int alter(Student student) throws Exception;
    public Student getOne(String name) throws Exception;
    public ArrayList<Student> getList() throws Exception;
}
