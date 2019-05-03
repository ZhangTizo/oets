<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>正在考试</title>
</head>
<body>
<%
    long lastTime = (long) request.getAttribute("lastTime");
%>
<script>
    var lastTime = <%= lastTime / 1000%>;
    var toSecond = function () {
        var s = lastTime % 60; // 秒
        var m = (lastTime - s) / 60 % 60; // 分钟
        var h = ((lastTime - s) / 60 - m) / 60 % 24; // 小时
        return "剩余时间：" + h + "小时" + m + "分钟" + s + "秒";
    }
    //然后写一个定时器
    window.setInterval(function () {
        lastTime--;
        document.getElementById("showTime").innerHTML = toSecond();
    }, 1000);
</script>
<form method="post" action="../test/testpaper/TestEndServlet">
    当前学生:<c:out value="${stuno}"></c:out><div id="showTime"></div>
    <%
        int pid = (int)request.getAttribute("pid");
    %>
    <div align="center">
        <h1><strong>${testPaper.name}</strong></h1>
        <input type="text" hidden="hidden" name="pid" value="<%=pid%>">
        <c:forEach var="question" items="${questionList}" varStatus="status">
            ${status.index + 1}.${question.name}<br>
            <label><input name="${question.id}" type="radio" value="A"/>A.${question.optionA}</label><br>
            <label><input name="${question.id}" type="radio" value="B"/>B.${question.optionB}</label><br>
            <label><input name="${question.id}" type="radio" value="C"/>C.${question.optionC}</label><br>
            <label><input name="${question.id}" type="radio" value="D"/>D.${question.optionD}</label><br><br><br>
        </c:forEach>
        <input type="submit" value="交卷">&nbsp;
        <a href="../student/test.jsp">返回</a>
    </div>
</form>
</body>
</html>
