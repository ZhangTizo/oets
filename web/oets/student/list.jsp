<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生列表</title>
    <style>
        body {
            background-image: url("../../image/background.jpg");
            background-size: 100% 100%;
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
            background-color:deepskyblue;
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
<form action="SearchStudentServlet" method="post">
    <br>
    <input type="button" onclick="location.href='ReturnStudentServlet'" value="返回上一页">
    <input type="button" onclick="location.href='StudentListServlet?method=insert'" value="插入学生信息">
    <br><br><br>
    <div align="center">
        <h1>学生管理</h1>
    </div>
    <div align="center"><br>
        学号:<input size="16" type="text" name="search" placeholder="请输入要查询的学号或姓名" style="width: 200px">&nbsp;&nbsp;
        <input type="submit" value="查询"><br><br>
    </div>
    <table align="center" border="1" cellpadding="15" class="gridtable">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        <c:forEach var="student" items="${studentList}">
            <tr>
                <td>${student.stuno}</td>
                <td>${student.name}</td>
                <td>${student.sex eq 1 ? "男" : "女"}</td>
                <td>${student.age}</td>
                <td>${student.memo eq "" ? "无" : student.memo}</td>
                <td>
                    <a href="StudentListServlet?method=update&post=${student.id}">修改</a>
                    &nbsp;&nbsp;
                    <a href="javascript:if(confirm('确实要删除吗?'))location='StudentListServlet?method=delete&post=${student.id}'">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><br><br><br><br>
        <input type="button" value="上一页" onclick="location.href='StudentListServlet?method=up&post=${currentPages}'">&nbsp;&nbsp;
        当前第&nbsp;<u>${currentPages}</u>&nbsp;页&nbsp;
        &nbsp;<input type="button" value="下一页" onclick="location.href='StudentListServlet?method=down&post=${currentPages}'">
        &nbsp;&nbsp;共&nbsp;<u>${pages}</u>&nbsp;页&nbsp;&nbsp;
        &nbsp;-&nbsp;向
        <input type="text" size="5px" name="page">&nbsp;页&nbsp;
        <input type="submit" value="跳转">
    </div>
</form>

</body>
</html>
