<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1
        {
            background: deepskyblue;
        }

        body {
            background-color: #B5DEF2;
        }

        .wrapper {
            margin: 50px 0 140px 760px;
            width: 1120px;
        }

        .loginBox {
            color: #444;
            font: 14px;
            margin: 0;
            width: 388px
        }

        .loginBox .loginBoxCenter {
            border-bottom: 1px solid #DDE0E8;
            padding: 24px;
        }

        .loginBox .loginBoxCenter p {

            margin-bottom: 10px
        }

        .loginBox .loginBoxButtons {
            border-top: 0px solid #FFF;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            line-height: 28px;
            overflow: hidden;
            padding: 20px 24px;
            vertical-align: center;
            filter: alpha(Opacity=80);
            -moz-opacity: 0.5;
            opacity: 0.5;
        }

        .loginBox .loginInput {
            border: 1px solid #D2D9dC;
            border-radius: 2px;
            color: #444;
            font: 12px;
            padding: 8px 14px;
            margin-bottom: 8px;
            width: 340px;
        }

        .loginBox .loginInput:FOCUS {
            border: 1px solid #B7D4EA;
            box-shadow: 0 0 8px #B7D4EA;
        }

        .loginBox .loginBtn {
            background: lightskyblue;
            border: 1px solid #98CCE7;
            border-radius: 20px;
            box-shadow: inset rgba(255, 255, 255, 0.6) 0 1px 1px, rgba(0, 0, 0, 0.1) 0 1px 1px;
            color: black;
            cursor: pointer;
            float: right;
            font: bold 13px Arial;
            padding: 10px 50px;
        }

        .loginBox .loginBtn:HOVER {
            background-image: -moz-linear-gradient(to top, blue, #85CFEE);
        }

        select{
            width: 340px;
            height: 35px;
            font-size: 15px;
            color: black;
            border-radius: 5px;
        }

        select:focus{
            border: 2px #ddd solid;
            box-shadow: 0 0 15px 1px #DDDDDD;
        }

        option{
            color: black;
            background: #A6E1EC;
            line-height: 20px;
        }

        option:hover{
            background: #EBCCD1;
        }
    </style>
</head>
<body>
<br><br>
<div align="center">
    <h1>请插入教师信息</h1>
</div>
<div class="wrapper">
    <form action="InsertTeacherServlet" method="post">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <p>教师工号:</p>
                <p><input type="text" name="teano" class="loginInput"  required="required" autofocus="autofocus" placeholder="请输入教师工号"/></p>
                <p>姓名:</p>
                <p><input type="text" name="name" class="loginInput" required="required" placeholder="请输入姓名"/></p>
                <p>性别:</p>
                <p>
                    <select name="sex">
                        <c:forEach var="i" begin="1" end="2" step="1">
                            <option value="${i}">${i eq 1 ? "男" : "女"}</option>
                        </c:forEach>
                    </select>
                </p>
                <p>年龄:</p>
                <p><input type="text" name="age" class="loginInput" required="required" placeholder="请输入年龄"/></p>
                <p>备注:</p>
                <p><input type="text" name="memo" class="loginInput" placeholder="请输入备注"/></p>
            </div>
            <div class="loginBoxButtons">
                <input type="submit" value="提&nbsp;&nbsp;交" class="loginBtn">
                <a href="TeacherListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
