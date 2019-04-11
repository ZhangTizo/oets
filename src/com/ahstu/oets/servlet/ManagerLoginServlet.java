package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.ManagerDaoImpl;
import com.ahstu.oets.util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ManagerLoginServlet",value = "/oets/manager/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

        String user = "";
        session.setAttribute("manager",user);

        ManagerDaoImpl mdi = new ManagerDaoImpl();
        if(session.getAttribute("name")==null) {
            PrintWriter out = response.getWriter();
            String name = request.getParameter("name");
            String password = DbUtil.md5(request.getParameter("password"));
            if (!name.equals("") && !password.equals("")) {
                try {
                    if(mdi.getOne(name)==null){ //用户名不存在，则登录失败
                        session.invalidate();
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'用户名不存在！！！\');\n" +
                                "           window.document.location.href=\'login.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                    else {
                        if (password.equals(mdi.getOne(name).getPassword())) {
                            System.out.println("login success!!!");
                            session.setAttribute("name", name);
                            response.sendRedirect("manage.jsp");
                        } else {    //输入密码与数据库中密码不相同，则登录失败
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
            }else { //用户名或密码为空，登录失败
                session.invalidate();
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'用户名或密码不能为空！！！\');\n" +
                        "           window.document.location.href=\'login.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        }
        else {
            request.getRequestDispatcher("manage.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
