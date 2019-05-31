package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.TestPaper;
import com.ahstu.oets.util.DateTransform;

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
        TestPaper testPaper = (TestPaper) session.getAttribute("testPaper");
        int pid = testPaper.getId();
        String[] check1 = request.getParameterValues("check1");
        String[] check2 = request.getParameterValues("check2");
        String[] check3 = request.getParameterValues("check3");
        try {
            testPaper.setName(request.getParameter("name"));
            testPaper.setStart(DateTransform.StringToDate(request.getParameter("start"), "yyyy-MM-dd HH:mm:ss"));
            testPaper.setEnd(DateTransform.StringToDate(request.getParameter("end"), "yyyy-MM-dd HH:mm:ss"));
            tpdi.deleteQuestion(pid);   //为了防止已经存在的题目重复添加，在此之前把表中该试卷所包含的所有试题删除
            for (String i : check1) {
                tpdi.setQuestion(pid, Integer.parseInt(i));
            }
            for (String i : check2) {
                tpdi.setQuestion(pid, Integer.parseInt(i));
            }
            for (String i : check3) {
                tpdi.setReading(pid, Integer.parseInt(i));
            }
            tpdi.update(testPaper);
            out.print("<html>" +
                    "<body>" +
                    "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                    "           alert(\'成功修改试卷信息！！！\');\n" +
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
