package com.ahstu.oets.dao.impl;

import java.util.ArrayList;
import java.util.Map;

import com.ahstu.oets.entity.Question;
import com.ahstu.oets.dao.QuestionDao;
import com.ahstu.oets.util.DbUtil;


public class QuestionDaoImpl implements QuestionDao {

    @Override
    public int insert(Question question) throws Exception {   //添加
        String sql = "insert into question(name,optionA,optionB,optionC,optionD,answer) values(?,?,?,?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(question.getName());
        list.add(question.getOptionA());
        list.add(question.getOptionB());
        list.add(question.getOptionC());
        list.add(question.getOptionD());
        list.add(question.getAnswer());
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public int update(Question question) throws Exception { //修改
        String sql = "update question set name = ?, optionA = ?, optionB = ?, optionC = ?, optionD = ?, answer = ? where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(question.getName());
        list.add(question.getOptionA());
        list.add(question.getOptionB());
        list.add(question.getOptionC());
        list.add(question.getOptionD());
        list.add(question.getAnswer());
        list.add(question.getId());
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public int delete(int id) throws Exception {   //删除
        String sql = "delete from question where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public Question getOne(String name) throws Exception {
        String sql = "select * from question where name = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(name);
        Question question = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            question = new Question();
            question.setId((int)m.get("id"));
            question.setName((String)m.get("name"));
            question.setOptionA((String)m.get("optionA"));
            question.setOptionB((String)m.get("optionB"));
            question.setOptionC((String)m.get("optionC"));
            question.setOptionD((String)m.get("optionD"));
            question.setAnswer((String)m.get("answer"));
        }
        return question;
    }

    public Question getOne(int id) throws Exception {
        String sql = "select * from question where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        Question question = null;
        for(Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            question = new Question();
            question.setId((int)m.get("id"));
            question.setName((String)m.get("name"));
            question.setOptionA((String)m.get("optionA"));
            question.setOptionB((String)m.get("optionB"));
            question.setOptionC((String)m.get("optionC"));
            question.setOptionD((String)m.get("optionD"));
            question.setAnswer((String)m.get("answer"));
        }
        return question;
    }

    @Override
    public ArrayList<Question> getList() throws Exception {
        String sql = "select * from question";
        ArrayList<Question> questionList = new ArrayList<>();
        for (Map<String,Object> m:DbUtil.executeQuery(sql,null)){
            Question question = new Question();
            question.setId((int)m.get("id"));
            question.setName((String)m.get("name"));
            question.setOptionA((String)m.get("optionA"));
            question.setOptionB((String)m.get("optionB"));
            question.setOptionC((String)m.get("optionC"));
            question.setOptionD((String)m.get("optionD"));
            question.setAnswer((String)m.get("answer"));
            questionList.add(question);
        }
        return questionList;
    }

    public ArrayList<Question> getList(String search) throws Exception {
        ArrayList<Question> questionList = new ArrayList<>();
        String sql = "select * from question where name like ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add("%"+search+"%");
        for (Map<String,Object> m:DbUtil.executeQuery(sql,list)){
            Question question = new Question();
            question.setId((int)m.get("id"));
            question.setName((String)m.get("name"));
            question.setOptionA((String)m.get("optionA"));
            question.setOptionB((String)m.get("optionB"));
            question.setOptionC((String)m.get("optionC"));
            question.setOptionD((String)m.get("optionD"));
            question.setAnswer((String)m.get("answer"));
            questionList.add(question);
        }
        return questionList;
    }
}
