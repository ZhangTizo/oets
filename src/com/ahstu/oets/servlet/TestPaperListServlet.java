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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "TestPaperListServlet", value = "/oets/test/testpaper/TestPaperListServlet")
public class TestPaperListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        String method = request.getParameter("method");
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        PrintWriter out = response.getWriter();
        ArrayList<Question> questionList = null;
        ArrayList<TestPaper> testPaperList = null;
        try {
            testPaperList = tpdi.getList();
            questionList = qdi.getList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int pages = testPaperList.size() / 10 + 1;
        if (method == null) {
            ArrayList<TestPaper> list = new ArrayList<>();
            for (int i = 0; i < 10 && i < testPaperList.size(); i++) {
                list.add(testPaperList.get(i));
            }
            int currentPages = 1;
            request.setAttribute("currentPages", currentPages);
            request.setAttribute("pages", pages);
            request.setAttribute("testPaperList", list);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } else {
            if (method.equals("update")) {
                try {
                    request.setAttribute("testPaper", tpdi.getOne(Integer.valueOf(request.getParameter("post"))));
                    session.setAttribute("testPaper",tpdi.getOne(Integer.valueOf(request.getParameter("post"))));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("questionList",questionList);
                request.getRequestDispatcher("update.jsp").forward(request, response);
            } else if (method.equals("insert")) {
                response.sendRedirect("insert.jsp");
            } else if (method.equals("delete")) {
                int id = Integer.valueOf(request.getParameter("post"));
                try {
                    System.out.println(tpdi.delete(id));
                } catch (Exception e) {
                }
                response.sendRedirect("TestPaperListServlet");
            } else if (method.equals("up")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages <= 1) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第一页了！！！\');\n" +
                            "           window.document.location.href=\'TestPaperListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<TestPaper> list = new ArrayList<>();
                    currentPages--;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < testPaperList.size(); i++) {
                        list.add(testPaperList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("testPaperList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            } else if (method.equals("down")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages >= pages) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第最后一页了！！！\');\n" +
                            "           window.document.location.href=\'TestPaperListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<TestPaper> list = new ArrayList<>();
                    currentPages++;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < testPaperList.size(); i++) {
                        list.add(testPaperList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("testPaperList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
