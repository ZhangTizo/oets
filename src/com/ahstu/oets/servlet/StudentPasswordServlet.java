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

@WebServlet(name = "StudentPasswordServlet",value = "/oets/student/StudentPasswordServlet")
public class StudentPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        StudentDaoImpl sdi = new StudentDaoImpl();
        String stuno = (String)session.getAttribute("stuno");
        try {
            Student student = sdi.getOne(stuno);
            String password = request.getParameter("password");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            if(!sdi.getOne(stuno).getPassword().equals(DbUtil.md5(password))){  //原密码输入错误，则无法修改当前密码
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'原密码错误！！！\');\n" +
                        "           window.document.location.href=\'update.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
            else {
                if(!password1.equals(password2)){   //修改新密码时，新密码与确认密码不一致，则修改失败
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'两次密码不一致！！！\');\n" +
                            "           window.document.location.href=\'update.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }
                else {
                    if (!password.equals(password1)) {
                        //System.out.println(password+" "+ DbUtil.md5(password1));
                        student.setPassword(DbUtil.md5(password1));
                        //System.out.println(sdi.update(student));
                        sdi.update(student);
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'密码修改成功！！！\');\n" +
                                "           window.document.location.href=\'logout.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                    else {  //如果新密码与原密码相同，则修改失败
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'新密码不能与原密码相同！！！\');\n" +
                                "           window.document.location.href=\'update.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
