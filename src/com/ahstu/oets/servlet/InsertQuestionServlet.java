package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.entity.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "InsertQuestionServlet", value = "/oets/test/question/InsertQuestionServlet")
public class InsertQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        String name = request.getParameter("name");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String answer = request.getParameter("answer");
        if (!name.equals("") && !answer.equals("")) {
            try {
                if (qdi.getOne(name) != null) {    //如果题目已经存在，则新增失败
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'该题目已存在！！！\');\n" +
                            "           window.document.location.href=\'insert.jsp\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    Question question = new Question();
                    question.setName(name);
                    question.setOptionA(optionA);
                    question.setOptionB(optionB);
                    question.setOptionC(optionC);
                    question.setOptionD(optionD);
                    question.setAnswer(answer);
                    qdi.insert(question);
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'成功添加题目！！！\');\n" +
                            "           window.document.location.href=\'QuestionListServlet\';\n" +
                            "</script>" +
                            "</body>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}



