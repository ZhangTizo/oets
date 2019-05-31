package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.dao.impl.ScoreDaoImpl;
import com.ahstu.oets.entity.Question;
import com.ahstu.oets.entity.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "TestEndServlet", value = "/oets/test/testpaper/TestEndServlet")
public class TestEndServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        ScoreDaoImpl sdi = new ScoreDaoImpl();
        PrintWriter out = response.getWriter();
        ArrayList<Question> questionList = null;
        HttpSession session = request.getSession();
        Score score = new Score();
        String stuno = (String) session.getAttribute("stuno");
        int pid = Integer.parseInt(request.getParameter("pid"));
        int score1 = 0;
        Date date = new Date();
        try {
            questionList = qdi.getList();
            for (Question question : questionList) {
                int qid = question.getId();
                String answer = request.getParameter("" + qid);
                if (qdi.isTrue(qid, answer)) {
                    //如果答案正确，则传给servlet记录，并在答题结束之后计算成绩传给score表(解决方案：只能选择10道题，每题10分，直接计算)
                    score1 += 5;
                }
            }
            score.setPid(pid);
            score.setScore(score1);
            score.setStuno(stuno);
            score.setTime(date);
            sdi.insert(score);
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'交卷成功!本次考试成绩为:" + score1 + "分\');\n" +
                    "           window.document.location.href=\'../../student/StudentScoreServlet\';\n" +
                    "</script>" +
                    "</body>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
