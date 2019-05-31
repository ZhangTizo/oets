package com.ahstu.oets.dao.impl;

import java.util.ArrayList;
import java.util.Map;

import com.ahstu.oets.entity.Question;
import com.ahstu.oets.dao.QuestionDao;
import com.ahstu.oets.entity.Reading;
import com.ahstu.oets.entity.TReading;
import com.ahstu.oets.util.DbUtil;


public class QuestionDaoImpl implements QuestionDao {

    @Override
    public int insert(Question question) throws Exception {   //添加
        String sql = "insert into question(name,optionA,optionB,optionC,optionD,answer,type) values(?,?,?,?,?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(question.getName());
        list.add(question.getOptionA());
        list.add(question.getOptionB());
        list.add(question.getOptionC());
        list.add(question.getOptionD());
        list.add(question.getAnswer());
        list.add(question.getType());
        return DbUtil.executeUpdate(sql, list);
    }

    @Override
    public int insertReading(String reading) throws Exception {
        String sql = "insert into reading(name) values(?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(reading);
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public int update(Question question) throws Exception { //修改
        String sql = "update question set name = ?, optionA = ?, optionB = ?, optionC = ?, optionD = ?, answer = ?, type = ? where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(question.getName());
        list.add(question.getOptionA());
        list.add(question.getOptionB());
        list.add(question.getOptionC());
        list.add(question.getOptionD());
        list.add(question.getAnswer());
        list.add(question.getType());
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
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
        }
        return question;
    }

    public Question getOne(int id) throws Exception {
        String sql = "select * from question where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        Question question = null;
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
        }
        return question;
    }

    @Override
    public ArrayList<TReading> TestPaperReading() throws Exception {
        String sql = "select rid,pid from testpaper inner join treading on testpaper.id = treading.pid;";
        ArrayList<TReading> tReadingList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            TReading tReading = new TReading();
            tReading.setRid((int) m.get("rid"));
            tReading.setPid((int) m.get("pid"));
            tReadingList.add(tReading);
        }
        return tReadingList;
    }

    @Override
    public ArrayList<Reading> getReading() throws Exception {
        String sql = "select * from reading";
        ArrayList<Reading> readingList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Reading reading = new Reading();
            reading.setId((int) m.get("id"));
            reading.setName((String) m.get("name"));
            readingList.add(reading);
        }
        return readingList;
    }

    @Override
    public String getReadingName(int qid) throws Exception {
        String sql = "select reading.name as readingName from question inner join rquestion on question.id = rquestion.qid inner join reading on rquestion.rid = reading.id where question.id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(qid);
        String readingName = "";
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            readingName = (String) m.get("readingName");
        }
        return readingName;
    }

    @Override
    public ArrayList<Question> getList() throws Exception {
        String sql = "select * from question";
        ArrayList<Question> questionList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Question question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
            questionList.add(question);
        }
        return questionList;
    }

    @Override
    public ArrayList<Question> getSingleQuestion() throws Exception {
        String sql = "select * from question where type = 1";
        ArrayList<Question> questionList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Question question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
            questionList.add(question);
        }
        return questionList;
    }

    @Override
    public ArrayList<Question> getMultipleQuestion() throws Exception {
        String sql = "select * from question where type = 2";
        ArrayList<Question> questionList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Question question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
            questionList.add(question);
        }
        return questionList;
    }

    public ArrayList<Question> getList(String search) throws Exception {
        ArrayList<Question> questionList = new ArrayList<>();
        String sql = "select * from question where name like ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add("%" + search + "%");
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            Question question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
            questionList.add(question);
        }
        return questionList;
    }

    @Override
    public int setReadingQuestion(int rid, int qid) throws Exception {
        String sql = "insert into rquestion(rid,qid) values(?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(rid);
        list.add(qid);
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public ArrayList<Question> getReadingQuestion() throws Exception {
        String sql = "select * from question where type = 3";
        ArrayList<Question> questionList = new ArrayList<>();
        for(Map<String,Object> m:DbUtil.executeQuery(sql,null)){
            Question question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
            question.setType((int)m.get("type"));
            questionList.add(question);
        }
        return questionList;
    }

    @Override
    public boolean isTrue(int id, String answer) throws Exception {
        String sql = "select * from question where id = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(id);
        Question question = null;
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            question = new Question();
            question.setId((int) m.get("id"));
            question.setName((String) m.get("name"));
            question.setOptionA((String) m.get("optionA"));
            question.setOptionB((String) m.get("optionB"));
            question.setOptionC((String) m.get("optionC"));
            question.setOptionD((String) m.get("optionD"));
            question.setAnswer((String) m.get("answer"));
        }
        if (question != null && question.getAnswer().equals(answer)) {
            return true;
        }
        return false;
    }

    @Override
    public int getReadingId(String reading) throws Exception {
        String sql = "select id from reading where name = ?";
        ArrayList<Object> list = new ArrayList<>();
        list.add(reading);
        int id = 0;
        for (Map<String,Object> m : DbUtil.executeQuery(sql,list)) {
            id = (int)m.get("id");
        }
        return id;
    }
}
