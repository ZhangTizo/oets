<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
    <title>试卷列表</title>
    <style>
        body {
            background-image: url("../../../image/background.jpg");
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
<form action="SearchTestPaperServlet" method="post">
    <br>
    <input type="button" onclick="location.href='ReturnTestPaperServlet'" value="返回上一页">
    <input type="button" onclick="location.href='TestPaperListServlet?method=insert'" value="新增试卷">
    <div align="center">
        <h1>试卷管理</h1>
    </div><br>
    <div align="center"><br>
        查询:<input size="16" type="text" name="search" placeholder="请输入要查询题目名称">&nbsp;&nbsp;
        <input type="submit" value="查询"><br><br>
    </div>
    <table align="center" border="1" cellpadding="15" class="gridtable">
        <tr>
            <th>试卷名称</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>预览</th>
            <th>操作</th>
        </tr>
        <c:forEach var="testPaper" items="${testPaperList}">
            <tr>
                <td><a href="TestPaperListServlet?method=update&post=${testPaper.id}">${testPaper.name}</a></td>
                <td><fmt:formatDate value="${testPaper.start}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${testPaper.end}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><a href="TestPaperPreviewServlet?post=${testPaper.id}" target="_blank">预览</a></td>
                <td><a href="javascript:if(confirm('确实要删除吗?'))location='TestPaperListServlet?method=delete&post=${testPaper.id}'">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><br>
        <input type="button" value="上一页" onclick="location.href='TestPaperListServlet?method=up&post=${currentPages}'">&nbsp;&nbsp;
        当前第&nbsp;<u>${currentPages}</u>&nbsp;页&nbsp;
        &nbsp;<input type="button" value="下一页" onclick="location.href='TestPaperListServlet?method=down&post=${currentPages}'">
        &nbsp;&nbsp;共&nbsp;<u>${pages}</u>&nbsp;页&nbsp;&nbsp;
        &nbsp;-&nbsp;向
        <input type="text" size="5px" name="page">&nbsp;页&nbsp;
        <input type="submit" value="跳转">
    </div>
</form>
</body>
</html>
