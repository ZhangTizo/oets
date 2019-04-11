package com.ahstu.oets.dao.impl;

import com.ahstu.oets.entity.Manager;
import com.ahstu.oets.util.DbUtil;
import com.ahstu.oets.dao.ManagerDao;

import java.util.ArrayList;
import java.util.Map;

public class ManagerDaoImpl implements ManagerDao {
    @Override
    public int insert(Manager manager) throws Exception {
        return 0;
    }

    @Override
    public int update(Manager manager) throws Exception {
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
        return 0;
    }

    @Override
    public ArrayList<Manager> getList() throws Exception {
        return null;
    }

    @Override
    public Manager getOne(String name) throws Exception {
        String sql = "select * from manager where name = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(name);
        Manager manager = null;
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            manager = new Manager();
            manager.setId((int) m.get("id"));
            manager.setName((String)m.get("name"));
            manager.setPassword((String) m.get("password"));
            manager.setMemo((String) m.get("memo"));
        }
        return manager;
    }
}
