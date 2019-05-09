<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>预览试卷</title>
    <style>
        body {
            background-image: url("../../../image/background.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<form method="post">
    <div align="center">
        <h1><strong>${testPaper.name}</strong></h1>
    </div>
    <div>
        <strong style="font-size: 20px">一.单项选择题（每题5分，共30分）</strong><br>
        <c:forEach var="question" items="${questionList}" varStatus="status">
            ${status.index + 1}.${question.name}<br>
            <label><input name="select" type="radio"/>A.${question.optionA}</label><br>
            <label><input name="select" type="radio"/>B.${question.optionB}</label><br>
            <label><input name="select" type="radio"/>C.${question.optionC}</label><br>
            <label><input name="select" type="radio"/>D.${question.optionD}</label><br><br><br>
        </c:forEach>
    </div>
</form>
</body>
</html>
