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

@WebServlet(name = "InsertTeacherServlet", value = "/oets/teacher/InsertTeacherServlet")
public class InsertTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        TeacherDaoImpl sdi = new TeacherDaoImpl();
        String teano = request.getParameter("teano");
        String name = request.getParameter("name");
        String memo = request.getParameter("memo");
        if (!teano.equals("") && !name.equals("")) {
            try {
                if (sdi.getOne(teano) != null) {    //如果教师工号已经存在，则插入失败
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'该教师工号已注册！！！\');\n" +
                            "           window.document.location.href=\'insert.jsp\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    int sex = Integer.parseInt(request.getParameter("sex"));
                    int age = Integer.parseInt(request.getParameter("age"));
                    Teacher teacher = new Teacher();
                    teacher.setTeano(teano);
                    teacher.setName(name);
                    teacher.setPassword(DbUtil.md5(teano));
                    teacher.setSex(sex);
                    teacher.setAge(age);
                    teacher.setMemo(memo);
                    System.out.println(sdi.insert(teacher));
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'成功添加教师信息！！！\');\n" +
                            "           window.document.location.href=\'TeacherListServlet\';\n" +
                            "</script>" +
                            "</body>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
