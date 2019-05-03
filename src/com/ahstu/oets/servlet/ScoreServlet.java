package com.ahstu.oets.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ScoreServlet", value = "/oets/student/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //该servlet作为学生查询成绩使用，在学生查询成绩时通过stuno查询其参加过的所有考试的试卷名称，成绩和考试时间传给jsp界面即可
        //新建另一个ScoreServlet作为老师和管理员使用，在查询成绩时显示在成绩表中所有的成绩信息，包括试卷名称，学号（考生姓名），成绩和考试时间传给相应的jsp界面
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
