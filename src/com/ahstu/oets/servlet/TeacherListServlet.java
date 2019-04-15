package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TeacherDaoImpl;
import com.ahstu.oets.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "TeacherListServlet", value = "/oets/teacher/TeacherListServlet")
public class TeacherListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String method = request.getParameter("method");
        TeacherDaoImpl tdi = new TeacherDaoImpl();
        PrintWriter out = response.getWriter();
        ArrayList<Teacher> teacherList = null;
        try {
            teacherList = tdi.getList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int pages = teacherList.size() / 10 + 1;
        if (method == null) {
            ArrayList<Teacher> list = new ArrayList<>();
            for (int i = 0; i < 10 && i < teacherList.size(); i++) {
                list.add(teacherList.get(i));
            }
            int currentPages = 1;
            request.setAttribute("currentPages", currentPages);
            request.setAttribute("pages", pages);
            request.setAttribute("teacherList", list);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } else {
            if (method.equals("update")) {
                try {
                    request.setAttribute("teacher",tdi.getOne(Integer.valueOf(request.getParameter("post"))));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("alter.jsp").forward(request, response);
            } else if (method.equals("insert")) {
                response.sendRedirect("insert.jsp");
            } else if (method.equals("delete")) {
                int id = Integer.valueOf(request.getParameter("post"));
                try {
                    System.out.println(tdi.delete(id));
                } catch (Exception e) {
                }
                response.sendRedirect("TeacherListServlet");
            } else if (method.equals("up")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages <= 1) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第一页了！！！\');\n" +
                            "           window.document.location.href=\'TeacherListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<Teacher> list = new ArrayList<>();
                    currentPages--;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < teacherList.size(); i++) {
                        list.add(teacherList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("teacherList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            } else if (method.equals("down")) {
                int currentPages = Integer.parseInt(request.getParameter("post"));
                if (currentPages >= pages) {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'已经在第最后一页了！！！\');\n" +
                            "           window.document.location.href=\'TeacherListServlet\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    ArrayList<Teacher> list = new ArrayList<>();
                    currentPages++;
                    for (int i = currentPages * 10 - 10; i < currentPages * 10 && i < teacherList.size(); i++) {
                        list.add(teacherList.get(i));
                    }
                    request.setAttribute("currentPages", currentPages);
                    request.setAttribute("pages", pages);
                    request.setAttribute("teacherList", list);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
