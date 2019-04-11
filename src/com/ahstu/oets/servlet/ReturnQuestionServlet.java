package com.ahstu.oets.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReturnQuestionServlet",value = "/oets/test/question/ReturnQuestionServlet")
public class ReturnQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String user = request.getParameter("user");
        System.out.println(user);
        if ("manager".equals(user)) { //在学生管理界面返回上一页时，管理员登录跳转到管理员管理界面
            response.sendRedirect("../manager/manage.jsp");
        }else if ("teacher".equals(user)){ //教师登录跳转到教师管理界面
            response.sendRedirect("../teacher/manage.jsp");
        }else {
            response.sendRedirect("../student/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
