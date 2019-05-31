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
    </style>
</head>
<body>
<br><br>
<div align="center">
    <h1>请修改试卷信息</h1>
</div>
<div class="wrapper" align="center">
    <form action="UpdateTestPaperServlet" method="post">
        <div class="loginBox">
            试卷名称:<input type="text" name="name" class="loginInput" value="${testPaper.name}"/>
            <br>
            开始时间:<input name="start" class="Wdate" type="text" value="<fmt:formatDate value="${testPaper.start}" pattern="yyyy-MM-dd HH:mm:ss"/>"
            onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})">
            <br>
            结束时间:<input name="end" class="Wdate" type="text" value="<fmt:formatDate value="${testPaper.end}" pattern="yyyy-MM-dd HH:mm:ss"/>"
            onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'start\')}||%y-%M-%d %H:%m:%s'})"><br><br><br>
            <font color="red">注意：请选择10道题单选题，5道多选题和1道阅读理解题！</font><br>
            <h2>单选题</h2>
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
                <c:forEach var="question" items="${singleQuestion}">
                    <tr>
                        <td><input type="checkbox" name="check1" value="${question.id}"
                        <c:forEach var="q" items="${questions}">
                            ${q.id eq question.id ? "checked='checked'" : ""}
                        </c:forEach>
                        ></td>
                        <td>${question.name}</td>
                        <td>${question.optionA}</td>
                        <td>${question.optionB}</td>
                        <td>${question.optionC}</td>
                        <td>${question.optionD}</td>
                        <td>${question.answer}</td>
                    </tr>
                </c:forEach>
            </table>
            <h2>多选题</h2>
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
                <c:forEach var="question" items="${multipleQuestion}">
                    <tr>
                        <td><input type="checkbox" name="check2" value="${question.id}"
                        <c:forEach var="q" items="${questions}">
                            ${q.id eq question.id ? "checked='checked'" : ""}
                        </c:forEach>
                        ></td>
                        <td>${question.name}</td>
                        <td>${question.optionA}</td>
                        <td>${question.optionB}</td>
                        <td>${question.optionC}</td>
                        <td>${question.optionD}</td>
                        <td>${question.answer}</td>
                    </tr>
                </c:forEach>
            </table>
            <h2>阅读理解题</h2>
            <table align="center" border="1" cellpadding="15">
                <tr>
                    <th>选择</th>
                    <th>阅读理解</th>
                </tr>
                <c:forEach var="reading" items="${reading}">
                    <tr>
                        <td><input type="checkbox" name="check3" value="${reading.id}"
                        <c:forEach var="q" items="${testPaperReading}">
                            ${q.rid eq reading.id ? "checked='checked'" : ""}
                        </c:forEach>
                        ></td>
                        <td>${reading.name}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="loginBoxButtons">
                <input type="submit" value="提&nbsp;&nbsp;交" class="loginBtn">
                <a href="TestPaperListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>