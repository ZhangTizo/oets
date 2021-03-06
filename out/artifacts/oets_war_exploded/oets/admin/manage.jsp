<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎使用</title>
    <link rel="stylesheet" href="../css/Cooldog.css">
    <link rel="stylesheet" href="../css/iconfont.css">
    <style>
        .menuDiv {
            overflow: hidden;
            display:inline-block;
        }

        .menuDiv a {
            text-decoration: none;
        }

        .menuDiv ul , .menuDiv li {
            list-style: none;
            margin: 0;
            padding: 0;
            float: left;
        }

        .menuDiv > ul > li > ul {
            position: absolute;
            display: none;
        }

        .menuDiv > ul > li > ul > li {
            float: none;
        }

        .menuDiv > ul > li:hover ul {
            display: block;
        }

        .menuDiv > ul > li > a {
            width: 120px;
            line-height: 40px;
            color: black;
            text-align: center;
            display: block;
        }

        .menuDiv > ul > li > a:hover {
            color: #f0f;
            background-color: lightyellow;
        }

        .menuDiv > ul > li > ul > li > a {
            line-height: 18px;
            color: black;
            background-color: white;
            text-align: left;
            display: block;
        }

        .menuDiv > ul > li > ul > li > a:hover {
            background-color: #3388ff;
        }

        body{
            background-size: 100%;
            background-color: #B5DEF2;
        }

        img{
            background-repeat : repeat;
        }

        .but {
            background-color:lightblue;
            width:110px;
            height:35px;
            font-size:16px;
            color:black;
            font-weight:bold;
            border-radius:15px;
            border-color: lightblue;
        }

        input:hover {
            background-color: deepskyblue;
            transition-duration: 0.4s;
        }

        .Box {
            border: 1px solid black;
            font: 14px;
            width: 80px;
        }
    </style>
</head>
<body>
<div class="menuDiv" style="float: top">
    管理员:&nbsp;
</div>
<div class="menuDiv">
    <ul>
        <li>
            <u style="color: darkblue;"><c:out value="${name}"></c:out></u>
            <ul class="Box">
                <li><a href="logout.jsp">注销</a></li>
            </ul>
        </li>
    </ul>
</div>
<br><br>
<div align="center">
    <input type="button" onclick="location.href='../student/StudentListServlet?user=admin'" value="学生管理" class="but">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="location.href='../teacher/TeacherListServlet'" value="教师管理" class="but">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="location.href='login.jsp'" value="考试管理" class="but">&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</body>
</html>
