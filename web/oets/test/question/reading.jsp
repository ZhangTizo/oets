<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增阅读理解</title>
    <style>
        h1 {
            background: deepskyblue;
        }

        body {
            background-image: url("../../../image/background.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<br><br>
<div align="center">
    <h1>新增阅读理解</h1>
</div>
<form action="InsertReadingServlet" method="post">
    <div align="center">
        阅读理解材料<br>
        <textarea name="reading" cols="30" rows="10" autofocus="autofocus"></textarea><br><br>
        <input type="button" onclick="location.href='QuestionListServlet?method=insert'" value="返回">
        <input type="submit" value="添加题目">
    </div>
</form>
</body>
</html>