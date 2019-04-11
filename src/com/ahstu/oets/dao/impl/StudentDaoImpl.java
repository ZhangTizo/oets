package com.ahstu.oets.dao.impl;

import com.ahstu.oets.entity.Student;
import com.ahstu.oets.util.DbUtil;
import com.ahstu.oets.dao.StudentDao;

import java.util.ArrayList;
import java.util.Map;

public class StudentDaoImpl implements StudentDao {
    @Override
    public int insert(Student student) throws Exception {
        String sql = "insert into student(stuno,name,password,sex,age,memo) values(?,?,?,?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(student.getStuno());
        list.add(student.getName());
        list.add(student.getPassword());
        list.add(student.getSex());
        list.add(student.getAge());
        list.add(student.getMemo());
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public int update(Student student) throws Exception {
        String sql = "update student set password = ?  where stuno = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(student.getPassword());
        list.add(student.getStuno());
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "delete from student where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public Student getOne(String stuno) throws Exception {
        String sql = "select * from student where stuno = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(stuno);
        Student student = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            student = new Student();
            student.setId((int)m.get("id"));
            student.setStuno((String)m.get("stuno"));
            student.setName((String)m.get("name"));
            student.setPassword((String)m.get("password"));
            student.setSex((int)m.get("sex"));
            student.setAge((int)m.get("age"));
            student.setMemo((String)m.get("memo"));
            student.setRemember((String )m.get("remember"));
        }
        return student;
    }

    public Student getOne(int id) throws Exception {
        String sql = "select * from student where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        Student student = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            student = new Student();
            student.setId((int)m.get("id"));
            student.setStuno((String)m.get("stuno"));
            student.setName((String)m.get("name"));
            student.setPassword((String)m.get("password"));
            student.setSex((int)m.get("sex"));
            student.setAge((int)m.get("age"));
            student.setMemo((String)m.get("memo"));
        }
        return student;
    }

    @Override
    public int alter(Student student) throws Exception {
        String sql = "update student set stuno = ?, name = ?, password = ?, sex = ?, age = ?, memo = ?, remember = ? where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(student.getStuno());
        list.add(student.getName());
        list.add(student.getPassword());
        list.add(student.getSex());
        list.add(student.getAge());
        list.add(student.getMemo());
        list.add(student.getRemember());
        list.add(student.getId());
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public ArrayList<Student> getList() throws Exception {
        String sql = "select * from student";
        ArrayList<Student> studentList = new ArrayList<>();
        for(Map<String,Object> m:DbUtil.executeQuery(sql,null)){
            Student student = new Student();
            student.setId((int)m.get("id"));
            student.setStuno((String)m.get("stuno"));
            student.setName((String)m.get("name"));
            student.setPassword((String)m.get("password"));
            student.setSex((int)m.get("sex"));
            student.setAge((int)m.get("age"));
            student.setMemo((String)m.get("memo"));
            studentList.add(student);
        }
        return studentList;
    }

    public ArrayList<Student> getList(String search) throws Exception {
        ArrayList<Student> studentList = new ArrayList<>();
        String sql = "select * from student where stuno like ? or name like ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add("%"+search+"%");
        list.add("%"+search+"%");
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            Student student = new Student();
            student.setId((int)m.get("id"));
            student.setStuno((String)m.get("stuno"));
            student.setName((String)m.get("name"));
            student.setSex((int)m.get("sex"));
            student.setAge((int)m.get("age"));
            student.setMemo((String)m.get("memo"));
            studentList.add(student);
        }
        return studentList;
    }
}
