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
import java.util.ArrayList;

@WebServlet(name = "QuestionListServlet", value = "/oets/test/question/QuestionListServlet")
public class QuestionListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String method = request.getParameter("method");
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        PrintWriter out = response.getWriter();
        ArrayList<Question> questionList = null;
        try {
            questionList = qdi.getList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int pages = questionList.size() / 10 + 1;
        if (method == null) {
            ArrayList<Question> list = new ArrayList<>();
            for (int i = 0; i < 10 && i < questionList.size(); i++) {
                list.add(questionList.get(i));
            }
            int currentPages = 1;
            request.setAttribute("currentPages", currentPages);
            request.setAttribute("pages", pages);
            request.setAttribute("questionList", list);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } else {
            if (method.equals("update")) {
                try {
                    request.setAttribute("question", qdi.getOne(Integer.valueOf(request.getParameter("post"))));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("update.jsp").forward(request, response);
            } else if (method.equals("insert")) {
                response.sendRedirect("insert.jsp");
            } else if (method.equals("delete")) {
                int id = Integer.valueOf(request.getParameter("post"));
                try {
                    System.out.println(qdi.delete(id));
                } catch (Exception e) {
                }
                response.sendRedirect("QuestionListServlet");
            } else if (method.equals("up")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages <= 1) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第一页了！！！\');\n" +
                            "           window.document.location.href=\'QuestionListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<Question> list = new ArrayList<>();
                    currentPages--;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < questionList.size(); i++) {
                        list.add(questionList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("questionList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            } else if (method.equals("down")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages >= pages) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第最后一页了！！！\');\n" +
                            "           window.document.location.href=\'QuestionListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<Question> list = new ArrayList<>();
                    currentPages++;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < questionList.size(); i++) {
                        list.add(questionList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("questionList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
