package com.ahstu.oets.dao.impl;

import com.ahstu.oets.dao.ScoreDao;
import com.ahstu.oets.entity.Score;
import com.ahstu.oets.util.DateTransform;
import com.ahstu.oets.util.DbUtil;

import java.util.ArrayList;
import java.util.Map;

public class ScoreDaoImpl implements ScoreDao {
    @Override
    public int insert(Score score) throws Exception {
        String sql = "insert into score(pid,stuno,score,time) values(?,?,?,?)";
        ArrayList<Object> list = new ArrayList<>();
        list.add(score.getPid());
        list.add(score.getStuno());
        list.add(score.getScore());
        list.add(DateTransform.DateToString(score.getTime(),"yyyy-MM-dd HH:mm:ss"));
        return DbUtil.executeUpdate(sql,list);
    }

    @Override
    public ArrayList<Score> getScore() throws Exception {
        String sql = "select * from score";
        ArrayList<Score> scoreList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            Score score = new Score();
            score.setId((int)m.get("id"));
            score.setPid((int)m.get("pid"));
            score.setStuno((String)m.get("stuno"));
            score.setScore((int)m.get("score"));
            score.setTime(DateTransform.StringToDate((String)m.get("time"),"yyyy-MM-dd HH:mm:ss"));
            scoreList.add(score);
        }
        return scoreList;
    }


    public ArrayList<Score> getScore(String stuno) throws Exception {
        String sql = "select * from score where stuno = ?";
        ArrayList<Score> scoreList = new ArrayList<>();
        ArrayList<Object> list = new ArrayList<>();
        list.add(stuno);
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            Score score = new Score();
            score.setId((int)m.get("id"));
            score.setPid((int)m.get("pid"));
            score.setScore((int)m.get("score"));
            score.setTime(DateTransform.StringToDate((String)m.get("time"),"yyyy-MM-dd HH:mm:ss"));
            scoreList.add(score);
        }
        return scoreList;
    }
}
