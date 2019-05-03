<%@ page import="com.ahstu.oets.dao.impl.TestPaperDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ahstu.oets.entity.TestPaper" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请选择考试</title>
</head>
<body>
<form method="post" action="TestServlet">
    <h1>可以参加的考试</h1>
    <%
        TestPaperDaoImpl tpdi = new TestPaperDaoImpl();
        Date date = new Date();
        List<Integer> now = new ArrayList<>();
        List<Integer> will = new ArrayList<>();
        try {
            ArrayList<TestPaper> testPaper = tpdi.getList();
            for (TestPaper m : testPaper) {
                if ((date.getTime() - m.getStart().getTime() >= 0) && (m.getEnd().getTime() - date.getTime() >= 0)) {   //正在进行的考试,当前时间在考试开始时间和结束时间内
                    now.add(m.getId());
                } else if (m.getEnd().getTime() - date.getTime() > 0) {  //即将开始的考试,考试开始时间在当前时间之后
                    will.add(m.getId());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <strong>当前正在进行的考试</strong><br>
    <select name="pid">
        <%
            TestPaperDaoImpl tpdi1 = new TestPaperDaoImpl();
            for (int i : now) {
                try {
                    String name1 = tpdi1.getOne(i).getName();
        %>
        <option value="<%=i%>"><%=name1%></option>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </select>
    <br>
    <input type="submit" value="开始考试"><br>
    <strong>即将开始的考试</strong><br>
    <%
        TestPaperDaoImpl tpdi2 = new TestPaperDaoImpl();
        for (int j : will) {
            try {
                String name2 = tpdi2.getOne(j).getName();
    %>
    <%=name2%>
    <br>
    <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
    <br><a href="success.jsp">返回</a>
</form>
</body>
</html>
