package com.ahstu.oets.dao.impl;

import com.ahstu.oets.dao.TeacherDao;
import com.ahstu.oets.entity.Teacher;
import com.ahstu.oets.util.DbUtil;

import java.util.ArrayList;
import java.util.Map;

public class TeacherDaoImpl implements TeacherDao {
    @Override
    public int insert(Teacher teacher) throws Exception {
        String sql = "insert into teacher(teano,name,password,sex,age,memo) values(?,?,?,?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(teacher.getTeano());
        list.add(teacher.getName());
        list.add(teacher.getPassword());
        list.add(teacher.getSex());
        list.add(teacher.getAge());
        list.add(teacher.getMemo());
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public int update(Teacher teacher) throws Exception {
        String sql = "update teacher set password = ?  where teano = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(teacher.getPassword());
        list.add(teacher.getTeano());
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "delete from teacher where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public Teacher getOne(String teano) throws Exception {
        String sql = "select * from teacher where teano = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(teano);
        Teacher teacher = null;
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            teacher = new Teacher();
            teacher.setId((int) m.get("id"));
            teacher.setTeano((String) m.get("teano"));
            teacher.setName((String) m.get("name"));
            teacher.setPassword((String) m.get("password"));
            teacher.setSex((int) m.get("sex"));
            teacher.setAge((int) m.get("age"));
            teacher.setMemo((String) m.get("memo"));
        }
        return teacher;
    }

    public Teacher getOne(int id) throws Exception {
        String sql = "select * from teacher where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        Teacher teacher = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            teacher = new Teacher();
            teacher.setId((int)m.get("id"));
            teacher.setTeano((String)m.get("teano"));
            teacher.setName((String)m.get("name"));
            teacher.setPassword((String)m.get("password"));
            teacher.setSex((int)m.get("sex"));
            teacher.setAge((int)m.get("age"));
            teacher.setMemo((String)m.get("memo"));
        }
        return teacher;
    }

    @Override
    public int alter(Teacher teacher) throws Exception {
        String sql = "update teacher set teano = ?, name = ?, sex = ?, age = ?, password = ?, memo = ? where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(teacher.getTeano());
        list.add(teacher.getName());
        list.add(teacher.getSex());
        list.add(teacher.getAge());
        list.add(teacher.getPassword());
        list.add(teacher.getMemo());
        list.add(teacher.getId());
        return DbUtil.executeUpdate(sql,list);
    }

    public ArrayList<Teacher> getSearch(String name) throws Exception {
        String sql = "select * from teacher where name like ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add("%" + name + "%");
        ArrayList<Teacher> teacherList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            Teacher teacher = new Teacher();
            teacher.setId((int) m.get("id"));
            teacher.setTeano((String) m.get("teano"));
            teacher.setName((String) m.get("name"));
            teacher.setPassword((String) m.get("password"));
            teacher.setSex((int) m.get("sex"));
            teacher.setAge((int) m.get("age"));
            teacher.setMemo((String) m.get("memo"));
            teacherList.add(teacher);
        }
        return teacherList;
    }

    @Override
    public ArrayList<Teacher> getList() throws Exception {
        String sql = "select * from teacher";
        ArrayList<Teacher> teacherList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Teacher teacher = new Teacher();
            teacher.setId((int) m.get("id"));
            teacher.setTeano((String) m.get("teano"));
            teacher.setName((String) m.get("name"));
            teacher.setPassword((String) m.get("password"));
            teacher.setSex((int) m.get("sex"));
            teacher.setAge((int) m.get("age"));
            teacher.setMemo((String) m.get("memo"));
            teacherList.add(teacher);
        }
        return teacherList;
    }

    public ArrayList<Teacher> getList(String search) throws Exception {
        String sql = "select * from teacher where teano like ? or name like ?";
        ArrayList<Teacher> teacherList = new ArrayList<>();
        ArrayList<Object> list = new ArrayList<>();
        list.add("%"+search+"%");
        list.add("%"+search+"%");
        for(Map<String,Object> m : DbUtil.executeQuery(sql,list)){
            Teacher teacher = new Teacher();
            teacher.setId((int)m.get("id"));
            teacher.setTeano((String)m.get("teano"));
            teacher.setName((String)m.get("name"));
            teacher.setSex((int)m.get("sex"));
            teacher.setAge((int)m.get("age"));
            teacher.setMemo((String)m.get("memo"));
            teacherList.add(teacher);
        }
        return teacherList;
    }
}
