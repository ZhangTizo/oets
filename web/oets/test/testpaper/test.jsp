<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>正在考试</title>
</head>
<body>
<div id="showTimes"></div>
<%
    long lastTime = (long) request.getAttribute("lastTime");
%>
<script>
    var second = <%= lastTime / 1000%>; // 剩余秒数
    // 写一个方法，将秒数专为天数
    var toDays = function(){
        var s = second % 60; // 秒
        var mi = (second - s) / 60 % 60; // 分钟
        var h = ((second - s) / 60 - mi ) / 60 % 24; // 小时
        var d = (((second - s) / 60 - mi ) / 60 - h ) / 24 // 天
        return "剩余：" + d + "天" + h + "小时" + mi + "分钟" + s + "秒";
    }
    //然后写一个定时器
    window.setInterval(function(){
        second --;
        document.getElementById("showTimes").innerHTML = toDays ();
    }, 1000);
</script>
<form method="post">
    <div align="center">
        <h1><strong>${testPaper.name}</strong></h1>
        <c:forEach var="question" items="${questionList}">
            ${question.name}<br>
            <label><input name="select" type="radio"/>A.${question.optionA}</label><br>
            <label><input name="select" type="radio"/>B.${question.optionB}</label><br>
            <label><input name="select" type="radio"/>C.${question.optionC}</label><br>
            <label><input name="select" type="radio"/>D.${question.optionD}</label><br><br><br>
        </c:forEach>
    </div>
</form>
</body>
</html>
