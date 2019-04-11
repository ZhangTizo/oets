package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Teacher;
import java.util.ArrayList;

public interface TeacherDao {
    public int insert(Teacher teacher) throws Exception;
    public int update(Teacher teacher) throws Exception;
    public int delete(int id) throws Exception;
    public int alter(Teacher teacher) throws Exception;
    public Teacher getOne(String name) throws Exception;
    public ArrayList<Teacher> getList() throws Exception;
}
