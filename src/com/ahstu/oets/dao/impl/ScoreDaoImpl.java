package com.ahstu.oets.dao.impl;

import com.ahstu.oets.dao.ScoreDao;
import com.ahstu.oets.entity.Score;
import com.ahstu.oets.entity.ScoreQuery;
import com.ahstu.oets.entity.ScoreQueryStudent;
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
    public ArrayList<ScoreQuery> getScore() throws Exception {  //sql语句查询时用到别名需要在连接语句中添加useOldAliasMetadataBehavior=true,否则默认查询原名
        String sql = "select testpaper.name as testPaperName,student.name as stuName,score,time from score inner join testpaper on score.pid=testpaper.id inner join student on score.stuno=student.stuno";
        ArrayList<ScoreQuery> scoreList = new ArrayList<>();
        for (Map<String, Object> m : DbUtil.executeQuery(sql, null)) {
            ScoreQuery scoreQuery = new ScoreQuery();
            scoreQuery.setTestPaperName((String) m.get("testPaperName"));
            scoreQuery.setStuName((String)m.get("stuName"));
            scoreQuery.setScore((int)m.get("score"));
            scoreQuery.setTime(DateTransform.StringToDate((String)m.get("time"),"yyyy-MM-dd HH:mm:ss"));
            scoreList.add(scoreQuery);
        }
        return scoreList;
    }


    public ArrayList<ScoreQueryStudent> getScore(String stuno) throws Exception {
        String sql = "select testpaper.name as testPaperName,score,time from score inner join testpaper on testpaper.id=score.pid where stuno = ?";
        ArrayList<ScoreQueryStudent> scoreList = new ArrayList<>();
        ArrayList<Object> list = new ArrayList<>();
        list.add(stuno);
        for (Map<String, Object> m : DbUtil.executeQuery(sql, list)) {
            ScoreQueryStudent scoreQueryStudent = new ScoreQueryStudent();
            scoreQueryStudent.setTestPaperName((String) m.get("testPaperName"));
            scoreQueryStudent.setScore((int)m.get("score"));
            scoreQueryStudent.setTime(DateTransform.StringToDate((String)m.get("time"),"yyyy-MM-dd HH:mm:ss"));
            scoreList.add(scoreQueryStudent);
        }
        return scoreList;
    }
}
