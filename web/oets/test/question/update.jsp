<%@ page import="com.ahstu.oets.entity.Question" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改题目信息</title>
    <style>
        h1
        {
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
    <h1>请修改题目信息</h1>
</div>
<div class="wrapper">
    <form action="UpdateQuestionServlet" method="post">
        <div class="loginBox">
            <div class="loginBoxCenter">
                <%
                    if ((int)request.getAttribute("type") == 1) {
                %>
                <input type="text" name="id" class="loginInput"  value="${question.id}" hidden="hidden"/>
                <input type="text" name="type" class="loginInput"  value="${question.type}" hidden="hidden">
                <p>题目类型:单选题</p>
                <p>题目名称:</p>
                <p><input type="text" name="name" class="loginInput" value="${question.name}"/></p>
                <p>选项A:</p>
                <p><input type="text" name="optionA" class="loginInput" value="${question.optionA}"/></p>
                <p>选项B:</p>
                <p><input type="text" name="optionB" class="loginInput" value="${question.optionB}"/></p>
                <p>选项C:</p>
                <p><input type="text" name="optionC" class="loginInput" value="${question.optionC}"/></p>
                <p>选项D:</p>
                <p><input type="text" name="optionD" class="loginInput" value="${question.optionD}"/></p>
                <p>正确答案:</p>
                <p>
                    <select name="answer">
                        <option value="A" ${question.answer eq "A" ? "selected" : ""}>A</option>
                        <option value="B" ${question.answer eq "B" ? "selected" : ""}>B</option>
                        <option value="C" ${question.answer eq "C" ? "selected" : ""}>C</option>
                        <option value="D" ${question.answer eq "D" ? "selected" : ""}>D</option>
                    </select>
                </p>
                <%
                    }else if ((int)request.getAttribute("type") == 2) {
                %>
                <input type="text" name="id" class="loginInput"  value="${question.id}" hidden="hidden"/>
                <input type="text" name="type" class="loginInput"  value="${question.type}" hidden="hidden">
                <p>题目类型:多选题</p>
                <p>题目名称:</p>
                <p><input type="text" name="name" class="loginInput" value="${question.name}"/></p>
                <p>选项A:</p>
                <p><input type="text" name="optionA" class="loginInput" value="${question.optionA}"/></p>
                <p>选项B:</p>
                <p><input type="text" name="optionB" class="loginInput" value="${question.optionB}"/></p>
                <p>选项C:</p>
                <p><input type="text" name="optionC" class="loginInput" value="${question.optionC}"/></p>
                <p>选项D:</p>
                <p><input type="text" name="optionD" class="loginInput" value="${question.optionD}"/></p>
                <p>正确答案:</p>
                <p><input type="text" name="answer" class="loginInput" value="${question.answer}"></p>
                <%
                    }else {
                %>
                <input type="text" name="id" class="loginInput"  value="${question.id}" hidden="hidden"/>
                <input type="text" name="type" class="loginInput"  value="${question.type}" hidden="hidden">
                <p>题目类型:阅读理解</p>
                <p>${readingName}</p>
                <p>题目名称:</p>
                <p><input type="text" name="name" class="loginInput" value="${question.name}"/></p>
                <p>选项A:</p>
                <p><input type="text" name="optionA" class="loginInput" value="${question.optionA}"/></p>
                <p>选项B:</p>
                <p><input type="text" name="optionB" class="loginInput" value="${question.optionB}"/></p>
                <p>选项C:</p>
                <p><input type="text" name="optionC" class="loginInput" value="${question.optionC}"/></p>
                <p>选项D:</p>
                <p><input type="text" name="optionD" class="loginInput" value="${question.optionD}"/></p>
                <p>正确答案:</p>
                <p>
                    <select name="answer">
                        <option value="A" ${question.answer eq "A" ? "selected" : ""}>A</option>
                        <option value="B" ${question.answer eq "B" ? "selected" : ""}>B</option>
                        <option value="C" ${question.answer eq "C" ? "selected" : ""}>C</option>
                        <option value="D" ${question.answer eq "D" ? "selected" : ""}>D</option>
                    </select>
                </p>
                <%
                    }
                %>
            </div>
            <div class="loginBoxButtons">
                <input type="submit" value="提&nbsp;&nbsp;交" class="loginBtn">
                <a href="QuestionListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>