package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.TestPaper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateTestPaperServlet", value = "/oets/test/testpaper/UpdateTestPaperServlet")
public class UpdateTestPaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        HttpSession session = request.getSession();
        TestPaper testPaper = (TestPaper)session.getAttribute("testPaper");
        int pid = testPaper.getId();
        String[] check = request.getParameterValues("check");
        try {
            for (String i:check)
            {
                tpdi.setQuestion(pid,Integer.parseInt(i));
            }
            System.out.println(tpdi.update(testPaper));
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'成功修改题目信息！！！\');\n" +
                    "           window.document.location.href=\'TestPaperListServlet\';\n" +
                    "</script>" +
                    "</body>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
