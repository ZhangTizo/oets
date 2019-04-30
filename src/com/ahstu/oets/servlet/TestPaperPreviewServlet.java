package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TestPaperPreviewServlet", value = "/oets/test/testpaper/TestPaperPreviewServlet")
public class TestPaperPreviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        ArrayList<Question> questionList = null;
        try {
            questionList = qdi.getList();
            request.setAttribute("questionList",questionList);
            request.setAttribute("testPaper", tpdi.getOne(Integer.valueOf(request.getParameter("post"))));
            request.getRequestDispatcher("preview.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
