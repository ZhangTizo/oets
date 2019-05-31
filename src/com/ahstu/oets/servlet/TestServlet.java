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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "TestServlet", value = "/oets/student/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (request.getParameter("pid") == null) {
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'没有正在进行的考试！！！\');\n" +
                    "           window.document.location.href=\'test.jsp\';\n" +
                    "</script>" +
                    "</body>");
        } else {
            int pid = Integer.parseInt(request.getParameter("pid"));
            TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
            ArrayList<Question> questionList = null;
            Date date = new Date();
            try {
                questionList = tpdi.getQuestion(pid);
                TestPaper testPaper = tpdi.getOne(pid);
                long lastTime = testPaper.getEnd().getTime() - date.getTime();
                request.setAttribute("lastTime", lastTime);
                request.setAttribute("testPaper", testPaper);
                int size = questionList.size();
                request.setAttribute("size", size);
                request.setAttribute("pid", pid);
                request.setAttribute("singleQuestionList", tpdi.getSingleQuestion(pid));
                request.setAttribute("multipleQuestionList", tpdi.getMultipleQuestion(pid));
                request.setAttribute("readingQuestionList", tpdi.getReadingQuestion(pid));
                request.setAttribute("readingName", tpdi.getReadingName(pid));
                request.getRequestDispatcher("../test/testpaper/test.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
