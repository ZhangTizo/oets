<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <style>
        h1
        {
            background: deepskyblue;
        }

        body {
            background-color: #B5DEF2;
        }

        .wrapper {
            margin: 160px 0 140px 762px;
            width: 884px;
        }

        .loginBox {
            background-color: #F0F4F6;
            border: 1px solid #BfD6E1;
            border-radius: 5px;
            color: #444;
            font: 14px 'Microsoft YaHei', '微软雅黑';
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
            border-top: 0 solid #FFF;
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
            font: 12px 'Microsoft YaHei', '微软雅黑';
            padding: 8px 14px;
            margin-bottom: 8px;
            width: 340px;
        }

        .loginBox .loginInput:FOCUS {
            border: 1px solid #B7D4EA;
            box-shadow: 0 0 8px #B7D4EA;
        }

        .loginBox .loginBtn {
            background-image: -moz-linear-gradient(to bottom, blue, #85CFEE);
            border: 1px solid #98CCE7;
            border-radius: 20px;
            box-shadow: inset rgba(255, 255, 255, 0.6) 0 1px 1px, rgba(0, 0, 0, 0.1) 0 1px 1px;
            color: #444;
            cursor: pointer;
            float: right;
            font: bold 13px Arial;
            padding: 10px 50px;
        }

        .loginBox .loginBtn:HOVER {
            background-image: -moz-linear-gradient(to top, blue, #85CFEE);
        }

        .loginBox input {
            vertical-align: middle;
        }

        .loginBox label[for="remember"] {
            font: 11px Arial;
        }

    </style>
</head>
<body>
<div class="wrapper" >
    <form action="UpdateStudentServlet" method="post">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <p style="font-weight: bold">当前学生：<c:out value="${stuno}"></c:out></p>
                <p>原密码:</p>
                <p><input type="password" name="password" class="loginInput" autofocus="autofocus" required="required" placeholder="请输入原密码"/></p>
                <p>新密码:</p>
                <p><input type="password" name="password1" class="loginInput" required="required" placeholder="请输入新密码"/></p>
                <p>确认密码:</p>
                <p><input type="password" name="password2" class="loginInput" required="required" placeholder="请再次输入新密码"/></p>
            </div>
            <div class="loginBoxButtons">
                <button class="loginBtn" type="submit">修&nbsp;&nbsp;改</button>
                <button class="loginBtn" type="reset">重&nbsp;&nbsp;置</button>
                <br>
                <a href="success.jsp" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
