package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Question;
import com.ahstu.oets.entity.TestPaper;

import java.util.ArrayList;

public interface TestPaperDao {
    public int insert(TestPaper testPaper) throws Exception;
    public int update(TestPaper testPaper) throws Exception;
    public int delete(int id) throws Exception;
    public TestPaper getOne(String name) throws Exception;
    public ArrayList<TestPaper> getList() throws Exception;
    public int setQuestion(int pid, int qid) throws Exception;
    public int setReading(int pid, int rid) throws Exception;
    public String getReadingName(int pid) throws Exception;
    public ArrayList<Question> getSingleQuestion(int pid) throws Exception;
    public ArrayList<Question> getMultipleQuestion(int pid) throws Exception;
    public ArrayList<Question> getReadingQuestion(int pid) throws Exception;
    public ArrayList<Question> getQuestion(int pid) throws Exception;
    public int deleteQuestion(int pid) throws Exception;
}
