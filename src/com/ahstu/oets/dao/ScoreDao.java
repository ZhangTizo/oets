package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Score;

import java.util.ArrayList;

public interface ScoreDao {
    public int insert(Score score) throws Exception;
    public ArrayList<Score> getScore() throws Exception;
}
