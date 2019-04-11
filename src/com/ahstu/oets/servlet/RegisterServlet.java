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

@WebServlet(name = "RegisterServlet",value = "/oets/student/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        StudentDaoImpl sdi = new StudentDaoImpl();
        String stuno = request.getParameter("stuno");
        String name = request.getParameter("name");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if(!stuno.equals("") && !name.equals("") && !password1.equals("") && !password2.equals("")){
            try {
                if(!password1.equals(password2)){   //两次输入的密码不一致，注册失败
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'两次密码不一致！！！\');\n" +
                            "           window.document.location.href=\'register.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }
                else {
                    if(sdi.getOne(stuno)!=null){    //学号已经存在，注册失败
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'该学号已注册！！！\');\n" +
                                "           window.document.location.href=\'register.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                    else {
                        int sex = Integer.parseInt(request.getParameter("sex"));
                        System.out.println("**************************");
                        int age = Integer.parseInt(request.getParameter("age"));
                        Student student = new Student();
                        student.setStuno(stuno);
                        student.setName(name);
                        student.setPassword(DbUtil.md5(password1));
                        student.setSex(sex);
                        student.setAge(age);
                        System.out.println(sdi.insert(student));
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'注册成功！！！\');\n" +
                                "           window.document.location.href=\'login.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else {  //学号或密码为空，注册失败
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'学号或密码不能为空！！！\');\n" +
                    "           window.document.location.href=\'register.jsp\';\n" +
                    "</script>" +
                    "</body>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
