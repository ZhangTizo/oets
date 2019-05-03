<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center" border="1" cellpadding="15">
    <tr>
        <th>试卷名称</th>
        <th>成绩</th>
        <th>考试时间</th>

    </tr>
    <c:forEach var="question" items="${questionList}">
        <tr>
            <td>${question.optionC}</td>
            <td>${question.optionD}</td>
            <td>${question.answer}</td>
        </tr>
    </c:forEach>
</table>
<br><a href="success.jsp">返回</a>
</body>
</html>
