package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.ScoreDaoImpl;
import com.ahstu.oets.entity.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentScoreServlet", value = "/oets/student/StudentScoreServlet")
public class StudentScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        ScoreDaoImpl sdi = new ScoreDaoImpl();
        String stuno = (String)session.getAttribute("stuno");
        try {
            ArrayList<Score> scoreList = sdi.getScore(stuno);
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
