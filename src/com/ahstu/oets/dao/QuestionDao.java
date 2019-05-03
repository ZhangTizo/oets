package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Question;

import java.util.ArrayList;

public interface QuestionDao {
    public int insert(Question question) throws Exception;
    public int update(Question question) throws Exception;
    public int delete(int id) throws Exception;
    public Question getOne(String name) throws Exception;
    public ArrayList<Question> getList() throws Exception;
    public boolean isTrue(int id, String answer) throws Exception;
}