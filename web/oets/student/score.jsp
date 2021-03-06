<%@ page import="com.ahstu.oets.dao.impl.TestPaperDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-image: url("../../image/background1.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<a href="success.jsp">返回</a><br><br><br>
<table align="center" border="1" cellpadding="15">
    <tr>
        <th>试卷名称</th>
        <th>成绩</th>
        <th>考试时间</th>

    </tr>
    <c:forEach var="score" items="${scoreList}">
        <tr>
            <td>${score.testPaperName}</td>
            <td>${score.score}</td>
            <td><fmt:formatDate value="${score.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
