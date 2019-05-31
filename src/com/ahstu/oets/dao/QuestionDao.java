package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Question;
import com.ahstu.oets.entity.TReading;
import com.ahstu.oets.entity.Reading;

import java.util.ArrayList;

public interface QuestionDao {
    public int insert(Question question) throws Exception;
    public int insertReading(String reading) throws Exception;
    public int update(Question question) throws Exception;
    public int delete(int id) throws Exception;
    public Question getOne(String name) throws Exception;
    public ArrayList<TReading> TestPaperReading() throws Exception;
    public ArrayList<Reading> getReading() throws Exception;
    public String getReadingName(int qid) throws Exception;
    public ArrayList<Question> getList() throws Exception;
    public ArrayList<Question> getSingleQuestion() throws Exception;
    public ArrayList<Question> getMultipleQuestion() throws Exception;
    public int setReadingQuestion(int rid, int qid) throws Exception;
    public ArrayList<Question> getReadingQuestion() throws Exception;
    public int getReadingId(String reading) throws Exception;
    public boolean isTrue(int id, String answer) throws Exception;
}