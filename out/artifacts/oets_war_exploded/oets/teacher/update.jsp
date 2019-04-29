<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改教师信息</title>
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
    </style>
</head>
<body>
<br><br>
<div align="center">
    <h1>请修改教师信息</h1>
</div>
<div class="wrapper">
    <form action="UpdateTeacherServlet" method="post">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <p><input type="text" name="id" class="loginInput"  value="${teacher.id}" hidden="hidden"/></p>
                <p>教师工号:</p>
                <p><input type="text" name="teano" class="loginInput" value="${teacher.teano}"/></p>
                <p>姓名:</p>
                <p><input type="text" name="name" class="loginInput" value="${teacher.name}"/></p>
                <p>性别:</p>
                <p>
                    <select name="sex">
                        <option value="1">&nbsp;&nbsp;男</option>
                        <option value="2" ${teacher.sex eq 2 ? "selected" : ""}>&nbsp;&nbsp;女</option>
                    </select>
                </p>
                <p>年龄:</p>
                <p><input type="text" name="age" class="loginInput" value="${teacher.age}" required="required"/></p>
                <p>密码:</p>
                <p><input type="text" name="password" class="loginInput" autofocus="autofocus"></p>
                <p>备注:</p>
                <p><input type="text" name="memo" class="loginInput" value="${teacher.memo}"/></p>
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
