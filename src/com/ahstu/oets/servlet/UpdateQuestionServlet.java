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

@WebServlet(name = "UpdateQuestionServlet", value = "/oets/test/question/UpdateQuestionServlet")
public class UpdateQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        PrintWriter out = response.getWriter();
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String answer = request.getParameter("answer");
        Question question = new Question();
        question.setId(id);
        question.setName(name);
        question.setOptionA(optionA);
        question.setOptionB(optionB);
        question.setOptionC(optionC);
        question.setOptionD(optionD);
        question.setAnswer(answer);
        try {
            System.out.println(qdi.update(question));
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'成功修改题目信息！！！\');\n" +
                    "           window.document.location.href=\'QuestionListServlet\';\n" +
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
