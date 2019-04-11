package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Manager;

import java.util.ArrayList;

public interface ManagerDao {
    public int insert(Manager manager) throws Exception;
    public int update(Manager manager) throws Exception;
    public int delete(int id) throws Exception;
    public Manager getOne(String name) throws Exception;
    public ArrayList<Manager> getList() throws Exception;
}
