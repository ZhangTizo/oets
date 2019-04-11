package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.StudentDaoImpl;
import com.ahstu.oets.entity.Student;
import com.ahstu.oets.util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "StudentLoginServlet",value = "/oets/student/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        StudentDaoImpl sdi = new StudentDaoImpl();
        if(session.getAttribute("stuno")==null) {
            PrintWriter out = response.getWriter();
            String stuno = request.getParameter("stuno");
            String password = DbUtil.md5(request.getParameter("password"));
            if (!stuno.equals("") && !password.equals("")) {
                try {
                    if(sdi.getOne(stuno)==null){    //学号不存在，登录失败
                        session.invalidate();
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'该学号不存在！！！\');\n" +
                                "           window.document.location.href=\'login.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                    else {
                        if (password.equals(sdi.getOne(stuno).getPassword())) {
                            Student student = sdi.getOne(request.getParameter("stuno"));
                            if(request.getParameter("remember")!=null){ //如果记住登录状态一栏被勾选，则进行标记
                                student.setRemember("1");
                                sdi.alter(student);
                            }
                            System.out.println("login success!!!");
                            session.setAttribute("stuno", stuno);
                            response.sendRedirect("success.jsp");
                        } else {    //密码错误，则不能登录
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
            }else { //学号或密码为空，则不能登录
                session.invalidate();
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'学号或密码不能为空！！！\');\n" +
                        "           window.document.location.href=\'login.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        }
        else {
            request.getRequestDispatcher("success.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
