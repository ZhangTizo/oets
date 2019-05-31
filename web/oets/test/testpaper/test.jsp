<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>正在考试</title>
    <style>
        body {
            background-image: url("../../../image/background1.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<%
    long lastTime = (long) request.getAttribute("lastTime");
%>
<script>
    var time = <%= lastTime / 1000%>;
    var toSecond = function () {
        var s = time % 60; // 秒
        var m = (time - s) / 60 % 60; // 分钟
        var h = ((time - s) / 60 - m) / 60 % 24; // 小时
        return "剩余时间：" + h + "小时" + m + "分钟" + s + "秒";
    }
    //然后写一个定时器
    window.setInterval(function () {
        time--;
        document.getElementById("showTime").innerHTML = toSecond();
        if (time<=0) {
            document.testform.submit();
        }
    }, 1000);
</script>
<form name="testform" method="post" action="../test/testpaper/TestEndServlet">
    当前学生:<c:out value="${stuno}"></c:out>
    <div id="showTime"></div>
    <%
        int pid = (int) request.getAttribute("pid");
    %>
    <div align="center">
        <h1><strong>${testPaper.name}</strong></h1>
    </div>
    <div>
        <input type="text" hidden="hidden" name="pid" value="<%=pid%>">
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
            <label><input type="checkbox" name="${question.id}" value="B" />A.${question.optionB}</label><br>
            <label><input type="checkbox" name="${question.id}" value="C" />A.${question.optionC}</label><br>
            <label><input type="checkbox" name="${question.id}" value="D" />A.${question.optionD}</label><br><br><br>
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
        <input type="submit" value="交卷">&nbsp;
    </div>
</form>
</body>
</html>
