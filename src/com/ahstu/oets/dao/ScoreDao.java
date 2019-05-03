package com.ahstu.oets.dao;

import com.ahstu.oets.entity.Score;

public interface ScoreDao {
    public int insert(Score score) throws Exception;
    public Score getScore(int stuno) throws Exception;
}
