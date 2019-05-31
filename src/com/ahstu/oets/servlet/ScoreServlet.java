package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.ScoreDaoImpl;
import com.ahstu.oets.entity.ScoreQuery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ScoreServlet", value = "/oets/test/testpaper/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        ScoreDaoImpl sdi = new ScoreDaoImpl();
        try {
            ArrayList<ScoreQuery> scoreList = sdi.getScore();
            request.setAttribute("scoreList",scoreList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("score.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
