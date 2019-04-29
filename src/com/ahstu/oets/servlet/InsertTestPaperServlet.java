package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.TestPaper;
import com.ahstu.oets.util.DateTransform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "InsertTestPaperServlet", value = "/oets/test/testpaper/InsertTestPaperServlet")
public class InsertTestPaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        String name = request.getParameter("name");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        if (!name.equals("")) {
            try {
                if (tpdi.getOne(name) != null) {    //如果试卷已经存在，则新增失败
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'该试卷已存在！！！\');\n" +
                            "           window.document.location.href=\'insert.jsp\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    TestPaper testPaper = new TestPaper();
                    testPaper.setName(name);
                    testPaper.setStart(DateTransform.StringToDate(start,"yyyy-MM-dd HH:mm"));
                    testPaper.setEnd(DateTransform.StringToDate(end,"yyyy-MM-dd HH:mm"));
                    tpdi.insert(testPaper);
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'成功添加试卷！！！\');\n" +
                            "           window.document.location.href=\'TestPaperListServlet\';\n" +
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



