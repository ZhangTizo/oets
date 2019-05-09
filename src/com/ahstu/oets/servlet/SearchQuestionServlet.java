package com.ahstu.oets.servlet;

import com.ahstu.oets.dao.impl.QuestionDaoImpl;
import com.ahstu.oets.entity.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SearchQuestionServlet",value = "/oets/test/question/SearchQuestionServlet")
public class SearchQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String search = request.getParameter("search");
        QuestionDaoImpl qdi = new QuestionDaoImpl();
        PrintWriter out = response.getWriter();
        if(request.getParameter("page")!=null){
            if(request.getParameter("page").equals("")){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'页号不能为空！！！\');\n" +
                        "           window.document.location.href=\'QuestionListServlet\';\n" +
                        "</script>" +
                        "</body>");
            }
            else {
                ArrayList<Question> questionList = null;
                try {
                    questionList = qdi.getList();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                int pages = questionList.size()/10+1;
                int page = Integer.parseInt(request.getParameter("page"));
                if(page>=1 && page<=pages){
                    System.out.println("page = "+page+"--- pages = "+pages);
                }else {
                    page = -1;
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'该页面不存在！！！\');\n" +
                            "           window.document.location.href=\'QuestionListServlet\';\n" +
                            "</script>" +
                            "</body>"+ "</html>");
                }
                ArrayList<Question> list = new ArrayList<>();
                for(int i = page * 10 - 10;i<page*10 && i<questionList.size();i++){
                    list.add(questionList.get(i));
                }
                request.setAttribute("currentPages",page);
                request.setAttribute("pages",pages);
                request.setAttribute("questionList", list);
                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
        }
        try {
            request.setAttribute("questionList",qdi.getList(search));
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
