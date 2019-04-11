<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>题库列表</title>
    <style>
        body{
            background-size: 100%;
            background-color: #B5DEF2;
        }
        h1 {
            background-color: deepskyblue;
        }

        table.gridtable{
            font-family:verdana,arial,sans-serif;
            font-size:18px;
            color:#333333;
            border-width:1px;
            border-color:#666666;
            border-collapse:collapse;
        }
        table.gridtable th{
            text-align:center;
            width: 150px;
            border-width:1px;
            padding:8px;
            border-style:solid;
            border-color:#666666;
            background-color:#dedede;
        }
        table.gridtable td{
            text-align:center;
            width: 150px;
            border-width:1px;
            padding:8px;
            border-style:solid;
            border-color:#666666;
            background-color:#ffffff;
        }

    </style>
</head>
<body>
<form action="SearchQuestionServlet" method="post">
    <br>
    <input type="button" onclick="location.href='../../manager/manage.jsp'" value="返回上一页">
    <input type="button" onclick="location.href='QuestionListServlet?method=insert'" value="新增题目">
    <div align="center">
        <h1>题库管理</h1>
    </div><br>
    <div align="center"><br>
        查询:<input size="16" type="text" name="search" placeholder="请输入要查询题目名称">&nbsp;&nbsp;
        <input type="submit" value="查询"><br><br>
    </div>
    <table align="center" border="1" cellpadding="15" class="gridtable">
        <tr>
            <th>题目名称</th>
            <th>选项A</th>
            <th>选项B</th>
            <th>选项C</th>
            <th>选项D</th>
            <th>答案</th>
            <th>操作</th>
        </tr>
        <c:forEach var="question" items="${questionList}">
            <tr>
                <td>${question.name}</td>
                <td>${question.optionA}</td>
                <td>${question.optionB}</td>
                <td>${question.optionC}</td>
                <td>${question.optionD}</td>
                <td>${question.answer}</td>
                <td>
                    <a href="QuestionListServlet?method=update&post=${question.id}">修改</a>
                    &nbsp;&nbsp;
                    <a href="javascript:if(confirm('确实要删除吗?'))location='QuestionListServlet?method=delete&post=${question.id}'">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><br>
        <input type="button" value="上一页" onclick="location.href='QuestionListServlet?method=up&post=${currentPages}'">&nbsp;&nbsp;
        当前第&nbsp;<u>${currentPages}</u>&nbsp;页&nbsp;
        &nbsp;<input type="button" value="下一页" onclick="location.href='QuestionListServlet?method=down&post=${currentPages}'">
        &nbsp;&nbsp;共&nbsp;<u>${pages}</u>&nbsp;页&nbsp;&nbsp;
        &nbsp;-&nbsp;向
        <input type="text" size="5px" name="page">&nbsp;页&nbsp;
        <input type="submit" value="跳转">
    </div>
</form>
</body>
</html>
