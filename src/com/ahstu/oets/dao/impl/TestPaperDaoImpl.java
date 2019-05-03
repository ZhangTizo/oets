package com.ahstu.oets.dao.impl;

import com.ahstu.oets.dao.TestPaperDao;
import com.ahstu.oets.entity.Question;
import com.ahstu.oets.entity.TestPaper;
import com.ahstu.oets.util.DateTransform;
import com.ahstu.oets.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class TestPaperDaoImpl implements TestPaperDao {
    @Override
    public int insert(TestPaper testPaper) throws Exception {
        String sql = "insert into testpaper(name,start,end) values(?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(testPaper.getName());
        list.add(testPaper.getStart());
        list.add(testPaper.getEnd());
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public int update(TestPaper testPaper) throws Exception {
        String sql = "update testpaper set name = ?, start = ?, end = ? where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(testPaper.getName());
        list.add(testPaper.getStart());
        list.add(testPaper.getEnd());
        list.add(testPaper.getId());
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public int delete(int id) throws Exception {
        String sql = "delete from testpaper where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public TestPaper getOne(String name) throws Exception {
        String sql = "select * from testpaper where name = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(name);
        TestPaper testPaper = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            testPaper = new TestPaper();
            testPaper.setId((int)m.get("id"));
            testPaper.setName((String)m.get("name"));
            testPaper.setStart(DateTransform.StringToDate((String)m.get("start"),"yyyy-MM-dd HH:mm"));
            testPaper.setEnd(DateTransform.StringToDate((String)m.get("end"),"yyyy-MM-dd HH:mm"));
        }
        return testPaper;
    }

    public TestPaper getOne(int id) throws Exception {
        String sql = "select * from testpaper where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        TestPaper testPaper = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            testPaper = new TestPaper();
            testPaper.setId((int)m.get("id"));
            testPaper.setName((String)m.get("name"));
            testPaper.setStart(DateTransform.StringToDate((String)m.get("start"),"yyyy-MM-dd HH:mm"));
            testPaper.setEnd(DateTransform.StringToDate((String)m.get("end"),"yyyy-MM-dd HH:mm"));
        }
        return testPaper;
    }

    @Override
    public ArrayList<TestPaper> getList() throws Exception {
        String sql = "select * from testpaper";
        ArrayList<TestPaper> testPaperList = new ArrayList<>();
        for (Map<String,Object> m:DbUtil.executeQuery(sql,null)){
            TestPaper testPaper = new TestPaper();
            testPaper.setId((int)m.get("id"));
            testPaper.setName((String)m.get("name"));
            testPaper.setStart(DateTransform.StringToDate((String)m.get("start"),"yyyy-MM-dd HH:mm"));
            testPaper.setEnd(DateTransform.StringToDate((String)m.get("end"),"yyyy-MM-dd HH:mm"));
            testPaperList.add(testPaper);
        }
        return testPaperList;
    }

    public ArrayList<TestPaper> getList(String search) throws Exception {
        ArrayList<TestPaper> testPaperList = new ArrayList<>();
        String sql = "select * from testpaper where name like ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add("%"+search+"%");
        for (Map<String,Object> m:DbUtil.executeQuery(sql,null)){
            TestPaper testPaper = new TestPaper();
            testPaper.setId((int)m.get("id"));
            testPaper.setName((String)m.get("name"));
            testPaper.setStart(DateTransform.StringToDate((String)m.get("start"),"yyyy-MM-dd HH:mm"));
            testPaper.setEnd(DateTransform.StringToDate((String)m.get("end"),"yyyy-MM-dd HH:mm"));
            testPaperList.add(testPaper);
        }
        return testPaperList;
    }

    @Override
    public int setQuestion(int pid, int qid) throws Exception {
        String sql = "insert into connection(pid,qid) value(?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(pid);
        list.add(qid);
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public ArrayList<Question> getQuestion(int pid) throws Exception {
        String sql = "select qid from connection where pid = ?";
        ArrayList<Question> questionList = new ArrayList<>();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        ArrayList<Object> list = new ArrayList<>();
        list.add(pid);
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            questionList.add(qdi.getOne((int) m.get("qid")));
        }
        return questionList;
    }
}
