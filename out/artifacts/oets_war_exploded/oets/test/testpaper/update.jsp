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
            background-image: url("../../../image/background.jpg");
            background-size: 100% 100%;
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
                        onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'start\')}||%y-%M-%d %H:%m:%s'})">
            <br>
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
                        <td><input type="checkbox" name="check" value="${question.id}"
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
            <%--<%--%>
                <%--String[] select = request.getParameterValues("check");--%>
                <%--int length = select.length;--%>
            <%--%>--%>
            <%--<font color="red">注意：只能选择10道题，不能多也不能少！<font color="#1e90ff">当前已选<%=length%>道题</font></font>--%>
            <div class="loginBoxButtons">
                <input type="submit" value="提&nbsp;&nbsp;交" class="loginBtn">
                <a href="TestPaperListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>