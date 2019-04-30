package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.Question;
import com.ahstu.oets.entity.TestPaper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "TestServlet",value = "/oets/student/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        System.out.println(request.getParameter("pid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        ArrayList<Question> questionList = null;
        Date date = new Date();
        try {
            questionList = qdi.getList();
            TestPaper testPaper = tpdi.getOne(pid);
            long lastTime = testPaper.getEnd().getTime() - date.getTime();
            request.setAttribute("lastTime",lastTime);
            request.setAttribute("testPaper",testPaper);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("questionList",questionList);
        request.getRequestDispatcher("../test/testpaper/test.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
