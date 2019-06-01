<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生注册</title>
    <style>
        h1 {
            background: deepskyblue;
        }

        body {
            background-image: url("../../image/background.jpg");
            background-size: 100% 100%;
        }

        .wrapper {
            margin: 8% 0 0 40%;
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

        select {
            width: 340px;
            height: 35px;
            font-size: 15px;
            color: black;
            border-radius: 5px;
        }

        option {
            color: black;
            background: #A6E1EC;
            line-height: 20px;
        }

        select:focus {
            border: 2px #ddd solid;
            box-shadow: 0 0 15px 1px #DDDDDD;
        }

        option:hover {
            background: #EBCCD1;
        }

        .foot {
            left: 37.5%;
            bottom: 0;
            position: absolute;
        }
    </style>
</head>
<body>
<div class="wrapper" >
    <form action="RegisterServlet" method="post">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <p>学号:</p>
                <p><input type="text" name="stuno" class="loginInput" autofocus="autofocus" required="required" autocomplete="off" placeholder="请输入学号"/></p>
                <p>姓名:</p>
                <p><input type="text" name="name" class="loginInput" required="required" placeholder="请输入姓名"/></p>
                <p>密码:</p>
                <p><input type="password" name="password1" class="loginInput" required="required" placeholder="请输入密码"/></p>
                <p>重复密码:</p>
                <p><input type="password" name="password2" class="loginInput" required="required" placeholder="请再次输入密码"/></p>
                <p>性别:</p>
                <p>
                    <select name="sex">
                        <c:forEach var="i" begin="1" end="2" step="1">
                            <option value="${i}">${i eq 1 ? "&nbsp;&nbsp;男" : "&nbsp;&nbsp;女"}</option>
                        </c:forEach>
                    </select>
                </p>
                <p>年龄:</p>
                <p><input type="text" name="age" class="loginInput" required="required" placeholder="请输入你的年龄"/></p>
            </div>
            <div class="loginBoxButtons">
                <button class="loginBtn">注&nbsp;&nbsp;册</button>
                <input type="reset" class="loginBtn" value="重&nbsp;&nbsp;置">
                <br>
                <a href="login.jsp" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
<div class="foot" align="center">Copyright © 2018-2019 <font color="#8a2be2">OETS英语在线考试系统</font> All Rights Reserved<br><br></div>
</body>
</html>
