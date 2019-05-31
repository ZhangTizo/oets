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
        <strong style="font-size: 20px">一.单项选择题（每题5分，共50分）</strong><br>
        <c:forEach var="question" items="${singleQuestionList}" varStatus="status">
            <strong>${status.index + 1}.${question.name}<br></strong>
            <label><input name="${question.id}" type="radio" value="A"/>A.${question.optionA}</label><br>
            <label><input name="${question.id}" type="radio" value="B"/>B.${question.optionB}</label><br>
            <label><input name="${question.id}" type="radio" value="C"/>C.${question.optionC}</label><br>
            <label><input name="${question.id}" type="radio" value="D"/>D.${question.optionD}</label><br><br><br>
        </c:forEach>
        <strong style="font-size: 20px">二.多项选择题（每题5分，共25分）</strong><br>
        <c:forEach var="question" items="${multipleQuestionList}" varStatus="status">
            <strong>${status.index + 11}.${question.name}<br></strong>
            <label><input type="checkbox" name="${question.id}" value="A" />A.${question.optionA}</label><br>
            <label><input type="checkbox" name="${question.id}" value="B" />B.${question.optionB}</label><br>
            <label><input type="checkbox" name="${question.id}" value="C" />C.${question.optionC}</label><br>
            <label><input type="checkbox" name="${question.id}" value="D" />D.${question.optionD}</label><br><br><br>
        </c:forEach>
        <strong style="font-size: 20px">三.阅读理解（每题5分，共25分）</strong><br>
        <p>${readingName}</p>
        <c:forEach var="question" items="${readingQuestionList}" varStatus="status">
            <strong>${status.index + 16}.${question.name}<br></strong>
            <label><input name="${question.id}" type="radio" value="A"/>A.${question.optionA}</label><br>
            <label><input name="${question.id}" type="radio" value="B"/>B.${question.optionB}</label><br>
            <label><input name="${question.id}" type="radio" value="C"/>C.${question.optionC}</label><br>
            <label><input name="${question.id}" type="radio" value="D"/>D.${question.optionD}</label><br><br><br>
        </c:forEach>
    </div>
</form>
</body>
</html>
