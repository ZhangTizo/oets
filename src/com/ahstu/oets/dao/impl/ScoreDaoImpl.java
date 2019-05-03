package com.ahstu.oets.dao.impl;

import com.ahstu.oets.dao.ScoreDao;
import com.ahstu.oets.entity.Score;
import com.ahstu.oets.util.DateTransform;
import com.ahstu.oets.util.DbUtil;

import java.util.ArrayList;

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
    public Score getScore(int stuno) throws Exception {
        return null;
    }

    public Score getScore(String pid) throws Exception {
        return null;
    }
}
