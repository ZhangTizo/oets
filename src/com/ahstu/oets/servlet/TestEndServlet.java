package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.dao.impl.ScoreDaoImpl;
import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
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
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        ScoreDaoImpl sdi = new ScoreDaoImpl();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int score1 = 0;
        Score score = new Score();
        Date date = new Date();
        StringBuffer stringBuffer = new StringBuffer();
        String stuno = (String) session.getAttribute("stuno");
        int pid = Integer.parseInt(request.getParameter("pid"));
        try {
            ArrayList<Question> singleQuestionList = tpdi.getSingleQuestion(pid);
            ArrayList<Question> multipleQuestionList = tpdi.getMultipleQuestion(pid);
            ArrayList<Question> readingQuestionList = tpdi.getReadingQuestion(pid);
            //获取选中选项的内容答案，和数据库进行对比，如果答案正确则按照对于的题目类型进行计算成绩
            for (Question question : singleQuestionList) {    //单选题计算得分
                int qid = question.getId();
                String answer = request.getParameter("" + qid);
                if (qdi.isTrue(qid, answer)) {  //如果答案正确，则把题目对应的分数添加到score1中
                    score1 += 5;
                }
            }
            for (Question question : multipleQuestionList) {    //多选题计算得分
                int qid = question.getId();
                String[] answer = request.getParameterValues("" + qid);
                for (String i: answer) {
                    stringBuffer.append(i);
                }
                System.out.println(stringBuffer.toString());
                if (qdi.isTrue(qid,stringBuffer.toString())) {
                    score1 += 5;
                }
                stringBuffer.setLength(0);
            }
            for (Question question : readingQuestionList) {    //阅读理解题计算得分
                int qid = question.getId();
                String answer = request.getParameter("" + qid);
                if (qdi.isTrue(qid, answer)) {
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
