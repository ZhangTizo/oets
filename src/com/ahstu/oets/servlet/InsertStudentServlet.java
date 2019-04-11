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

@WebServlet(name = "InsertStudentServlet", value = "/oets/student/InsertStudentServlet")
public class InsertStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        StudentDaoImpl sdi = new StudentDaoImpl();

        String stuno = request.getParameter("stuno");
        String name = request.getParameter("name");
        String memo = request.getParameter("memo");
        if (!stuno.equals("") && !name.equals("")) {
            try {
                    if (sdi.getOne(stuno) != null) {    //如果学号已经存在，则插入失败
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'该学号已注册！！！\');\n" +
                                "           window.document.location.href=\'insert.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    } else {
                        int sex = Integer.parseInt(request.getParameter("sex"));
                        int age = Integer.parseInt(request.getParameter("age"));
                        Student student = new Student();
                        student.setStuno(stuno);
                        student.setName(name);
                        student.setPassword(DbUtil.md5(stuno));
                        student.setSex(sex);
                        student.setAge(age);
                        student.setMemo(memo);
                        sdi.insert(student);
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'成功添加学生信息！！！\');\n" +
                                "           window.document.location.href=\'StudentListServlet\';\n" +
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
