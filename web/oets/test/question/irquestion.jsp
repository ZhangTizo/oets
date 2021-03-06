<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1 {
            background: deepskyblue;
        }

        body {
            background-image: url("../../../image/background.jpg");
            background-size: 100% 100%;
        }

        .wrapper {
            margin: 50px 0 140px 760px;
            width: 1120px;
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
    </style>
</head>
<body>
<br><br>
<div align="center">
    <h1>添加阅读理解题目</h1>
</div>
<div class="wrapper">
    <form action="InsertReadingQuestionServlet" method="post" id="myForm">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <input type="text" name="rid" value="${rid}" hidden="hidden">
                <p>题目名称:</p>
                <p><input type="text" name="name" class="loginInput" required="required" autofocus="autofocus" placeholder="请输入题目"/></p>
                <p>选项A:</p>
                <p><input type="text" name="optionA" class="loginInput" placeholder="选项A"/></p>
                <p>选项B:</p>
                <p><input type="text" name="optionB" class="loginInput" placeholder="选项B"/></p>
                <p>选项C:</p>
                <p><input type="text" name="optionC" class="loginInput" placeholder="选项C"/></p>
                <p>选项D:</p>
                <p><input type="text" name="optionD" class="loginInput" placeholder="选项D"/></p>
                <p>正确答案:</p>
                <p><input type="text" name="answer" class="loginInput" required="required" placeholder="正确答案"></p>
            </div>
            <div class="loginBoxButtons">
                <a href="QuestionListServlet">结束</a>
                <input type="submit" value="继续" class="loginBtn">
            </div>
        </div>
    </form>
</div>
</body>
</html>
