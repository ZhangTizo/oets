package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TeacherDaoImpl;
import com.ahstu.oets.entity.Teacher;
import com.ahstu.oets.util.DbUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TeacherUpdateServlet", value = "/oets/teacher/TeacherUpdateServlet")
public class TeacherUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        TeacherDaoImpl tdi = new TeacherDaoImpl();
        PrintWriter out = response.getWriter();
        int id = Integer.valueOf(request.getParameter("id"));
        String teano = request.getParameter("teano");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int sex = Integer.valueOf(request.getParameter("sex"));
        int age = Integer.valueOf(request.getParameter("age"));
        String memo = request.getParameter("memo");
        if (password.equals("")) {  //传入密码栏为空，则默认不修改密码
            Teacher teacher = new Teacher();
            teacher.setId(id);
            teacher.setTeano(teano);
            teacher.setName(name);
            teacher.setSex(sex);
            teacher.setAge(age);
            teacher.setMemo(memo);
            try {
                String password1 = tdi.getOne(id).getPassword();
                teacher.setPassword(password1);
                System.out.println(tdi.alter(teacher));
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'成功修改教师信息！！！\');\n" +
                        "           window.document.location.href=\'TeacherListServlet\';\n" +
                        "</script>" +
                        "</body>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {    //密码栏不为空，则修改密码
            Teacher teacher = new Teacher();
            teacher.setId(id);
            teacher.setTeano(teano);
            teacher.setName(name);
            teacher.setSex(sex);
            teacher.setAge(age);
            teacher.setMemo(memo);
            teacher.setPassword(DbUtil.md5(password));
            try {
                System.out.println(tdi.alter(teacher));
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'成功修改教师信息！！！\');\n" +
                        "           window.document.location.href=\'TeacherListServlet\';\n" +
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
