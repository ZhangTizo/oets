package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Score;
import com.ahstu.oets.entity.ScoreQuery;

import java.util.ArrayList;

public interface ScoreDao {
    public int insert(Score score) throws Exception;
    public ArrayList<ScoreQuery> getScore() throws Exception;
}
