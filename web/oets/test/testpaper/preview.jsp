<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>预览试卷</title>
</head>
<body>
<form method="post">
    <h1>${testPaper.name}</h1>
    <c:forEach var="question" items="${questionList}">
        ${question.name}<br>
        <label><input name="select" type="radio"/>A.${question.optionA}</label><br>
        <label><input name="select" type="radio"/>B.${question.optionB}</label><br>
        <label><input name="select" type="radio"/>C.${question.optionC}</label><br>
        <label><input name="select" type="radio"/>D.${question.optionD}</label><br><br><br>
    </c:forEach>
</form>
</body>
</html>
