<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改试卷信息</title>
    <script language="javascript" type="text/javascript" src="../../../js/WdatePicker.js"></script>
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
    <h1>请修改试卷信息</h1>
</div>
<div class="wrapper">
    <form action="UpdateTestPaperServlet" method="post">
        <div class="loginBox">
            试卷名称:<input type="text" name="name" class="loginInput" placeholder="${testPaper.name}"/>
            <br>
            开始时间:<input name="start" id="start" class="Wdate" type="text" placeholder="<fmt:formatDate value="${testPaper.start}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                        onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})">
            <br>
            结束时间:<input name="end" class="Wdate" type="text" placeholder="<fmt:formatDate value="${testPaper.end}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                        onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'start\')}||%y-%M-%d %H:%m:%s'})">
            <br>
            <%--该jsp存在的问题是在TestPaperListServlet中传入的questionList是全部question而不是该试卷中含有的question--%>
            <%--同时可以设置计数器，计算当前已选择的题目数量，最后对已经加入到试卷当中的题目默认勾选--%>
            <table align="center" border="1" cellpadding="15">
                <tr>
                    <th>选择</th>
                    <th>题目名称</th>
                    <th>选项A</th>
                    <th>选项B</th>
                    <th>选项C</th>
                    <th>选项D</th>
                    <th>答案</th>
                </tr>
                <c:forEach var="question" items="${questionList}">
                    <tr>
                        <td><input type="checkbox" name="check" value="${question.id}"></td>
                        <td>${question.name}</td>
                        <td>${question.optionA}</td>
                        <td>${question.optionB}</td>
                        <td>${question.optionC}</td>
                        <td>${question.optionD}</td>
                        <td>${question.answer}</td>
                    </tr>
                </c:forEach>
            </table>
            <font color="red">注意：只能选择10道题，不能多也不能少！</font>
            <div class="loginBoxButtons">
                <input type="submit" value="提&nbsp;&nbsp;交" class="loginBtn">
                <a href="TestPaperListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>