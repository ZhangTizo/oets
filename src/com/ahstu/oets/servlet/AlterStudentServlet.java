package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.StudentDaoImpl;
import com.ahstu.oets.entity.Student;
import com.ahstu.oets.util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AlterStudentServlet", value = "/oets/student/AlterStudentServlet")
public class AlterStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        StudentDaoImpl sdi = new StudentDaoImpl();
        PrintWriter out = response.getWriter();
        int id = Integer.valueOf(request.getParameter("id"));
        String stuno = request.getParameter("stuno");
        String name = request.getParameter("name");
        String memo = request.getParameter("memo");
        String password = request.getParameter("password");
        int sex = Integer.valueOf(request.getParameter("sex"));
        int age = Integer.valueOf(request.getParameter("age"));
        if (password.equals("")) {  //如果密码栏没有输入，则不修改密码，取数据库中密码提交
            Student student = new Student();
            student.setId(id);
            student.setName(name);
            student.setStuno(stuno);
            student.setSex(sex);
            student.setAge(age);
            student.setMemo(memo);
            try {
                String password1 = sdi.getOne(id).getPassword();
                student.setPassword(password1);
                System.out.println(sdi.alter(student));
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'成功修改学生信息！！！\');\n" +
                        "           window.document.location.href=\'StudentListServlet\';\n" +
                        "</script>" +
                        "</body>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {    //密码栏输入密码，将输入密码作为新密码一并提交
            Student student = new Student();
            student.setId(id);
            student.setName(name);
            student.setStuno(stuno);
            student.setSex(sex);
            student.setAge(age);
            student.setMemo(memo);
            student.setPassword(DbUtil.md5(password));
            try {
                System.out.println(sdi.alter(student));
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'成功修改学生信息！！！\');\n" +
                        "           window.document.location.href=\'StudentListServlet\';\n" +
                        "</script>" +
                        "</body>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
