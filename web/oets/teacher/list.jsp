<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教师列表</title>
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
<form action="SearchTeacherServlet" method="post">
    <br>
    <input type="button" onclick="location.href='../manager/manage.jsp'" value="返回上一页">
    <input type="button" onclick="location.href='TeacherListServlet?method=insert'" value="插入教师信息">
    <div align="center">
        <h1>教师管理</h1>
    </div><br>
    <div align="center"><br>
        学号:<input size="16" type="text" name="search" placeholder="请输入要查询的教师工号或姓名">&nbsp;&nbsp;
        <input type="submit" value="查询"><br><br>
    </div>
    <table align="center" border="1" cellpadding="15" class="gridtable">
        <tr>
            <th>教师工号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        <c:forEach var="teacher" items="${teacherList}">
            <tr>
                <td>${teacher.teano}</td>
                <td>${teacher.name}</td>
                <td>${teacher.sex eq 1 ? "男" : "女"}</td>
                <td>${teacher.age}</td>
                <td>${teacher.memo eq "" ? "无" : teacher.memo}</td>
                <td>
                    <a href="TeacherListServlet?method=alter&post=${teacher.id}">修改</a>
                    &nbsp;&nbsp;
                    <a href="javascript:if(confirm('确实要删除吗?'))location='TeacherListServlet?method=delete&post=${teacher.id}'">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><br>
        <input type="button" value="上一页" onclick="location.href='TeacherListServlet?method=up&post=${currentPages}'">&nbsp;&nbsp;
        当前第&nbsp;<u>${currentPages}</u>&nbsp;页&nbsp;
        &nbsp;<input type="button" value="下一页" onclick="location.href='TeacherListServlet?method=down&post=${currentPages}'">
        &nbsp;&nbsp;共&nbsp;<u>${pages}</u>&nbsp;页&nbsp;&nbsp;
        &nbsp;-&nbsp;向
        <input type="text" size="5px" name="page">&nbsp;页&nbsp;
        <input type="submit" value="跳转">
    </div>
</form>
</body>
</html>
