package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.TestPaperDaoImpl;
import com.ahstu.oets.entity.TestPaper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SearchTestPaperServlet",value = "/oets/test/testpaper/SearchTestPaperServlet")
public class SearchTestPaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String search = request.getParameter("search");
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        PrintWriter out = response.getWriter();
        if (request.getParameter("page")!=null){
            if (request.getParameter("page").equals("")){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'页号不能为空！！！\');\n" +
                        "           window.document.location.href=\'TestPaperListServlet\';\n" +
                        "</script>" +
                        "</body>");
            }
            else {
                ArrayList<TestPaper> testPaperList = null;
                try {
                    testPaperList = tpdi.getList();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                int pages = testPaperList.size()/10+1;
                int page = Integer.parseInt(request.getParameter("page"));
                if(page>=1 && page<=pages){
                    System.out.println("page = "+page+"--- pages = "+pages);
                }else {
                    page = -1;
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'该页面不存在！！！\');\n" +
                            "           window.document.location.href=\'TestPaperListServlet\';\n" +
                            "</script>" +
                            "</body>"+ "</html>");
                }
                ArrayList<TestPaper> list = new ArrayList<>();
                for(int i = page * 10 - 10;i<page*10 && i<testPaperList.size();i++){
                    list.add(testPaperList.get(i));
                }
                request.setAttribute("currentPages",page);
                request.setAttribute("pages",pages);
                request.setAttribute("testPaperList", list);
                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
        }
        try {
            request.setAttribute("testPaperList",tpdi.getList(search));
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
