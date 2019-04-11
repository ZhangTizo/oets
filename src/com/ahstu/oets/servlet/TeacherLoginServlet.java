
package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TeacherDaoImpl;
import com.ahstu.oets.util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TeacherLoginServlet", value = "/oets/teacher/TeacherLoginServlet")
public class TeacherLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        TeacherDaoImpl tdi = new TeacherDaoImpl();
        if (session.getAttribute("teano") == null) {
            PrintWriter out = response.getWriter();
            String teano = request.getParameter("teano");
            String password = DbUtil.md5(request.getParameter("password"));
            if (!teano.equals("") && !password.equals("")) {
                try {
                    if (tdi.getOne(teano) == null) {    //教师工号不存在，则登录失败
                        session.invalidate();
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'该教师工号不存在！！！\');\n" +
                                "           window.document.location.href=\'login.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    } else {
                        if (password.equals(tdi.getOne(teano).getPassword())) {
                            System.out.println("login success!!!");
                            session.setAttribute("teano", teano);
                            response.sendRedirect("manage.jsp");
                        } else {    //密码错误，则登录失败
                            session.invalidate();
                            out.print("<html>" +
                                    "<body>" +
                                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                    "           alert(\'密码错误！！！\');\n" +
                                    "           window.document.location.href=\'login.jsp\';\n" +
                                    "</script>" +
                                    "</body>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {    //教师工号或密码错误，则登录失败
                session.invalidate();
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'教师工号或密码不能为空！！！\');\n" +
                        "           window.document.location.href=\'login.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        } else {
            request.getRequestDispatcher("manage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
