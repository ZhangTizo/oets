package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.entity.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "InsertReadingQuestionServlet", value = "/oets/test/question/InsertReadingQuestionServlet")
public class InsertReadingQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        int rid = Integer.parseInt(request.getParameter("rid"));    //在插入题目时将rid也插入对应的关系表中
        String name = request.getParameter("name");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String answer = request.getParameter("answer");
        int type = 3;
        Question question = new Question();
        question.setType(type);
        question.setName(name);
        question.setOptionA(optionA);
        question.setOptionB(optionB);
        question.setOptionC(optionC);
        question.setOptionD(optionD);
        question.setAnswer(answer);
        try {
            qdi.insert(question);
            qdi.setReadingQuestion(rid, qdi.getOne(name).getId());
            session.setAttribute("rid",rid);
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'成功添加阅读理解!\');\n" +
                    "           window.document.location.href=\'irquestion.jsp\';\n" +
                    "</script>" +
                    "</body>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
