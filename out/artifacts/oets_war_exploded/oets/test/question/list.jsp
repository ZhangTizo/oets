<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>题库列表</title>
    <style>
        body {
            background-image: url("../../../image/background1.jpg");
            background-size: 100% 100%;
        }

        h1 {
            background-color: deepskyblue;
        }
    </style>
</head>
<body>
<form action="SearchQuestionServlet" method="post">
    <br>
    <input type="button" onclick="location.href='ReturnQuestionServlet'" value="返回上一页">
    <input type="button" onclick="location.href='QuestionListServlet?method=insert'" value="新增题目">
    <div align="center">
        <h1>题库管理</h1>
    </div><br>
    <div align="center"><br>
        查询:<input size="16" type="text" name="search" placeholder="请输入要查询题目名称">&nbsp;&nbsp;
        <input type="submit" value="查询"><br><br>
    </div>
    <table cellspacing="0" style="border:0;min-height: 400px;margin:0 auto;">
        <c:forEach var="question" items="${questionList}">
            <tr>
                <td style="width:1000px;min-height:100px;border:1px solid black;border-radius:5px;">
                    <div class="question_name" style="width:900px;min-height:20px;margin:0 auto;padding:10px;">
                        ${question.type eq 1 ? "单选题:" : (question.type eq 2 ? "多选题:" : "阅读理解题")}&nbsp;&nbsp;<span>${question.name}</span>
                    </div>
                    <div class="question_bottom" style="width:900px;min-height:80px;margin:0 auto;">
                        <div class="question_option" style="width:800px;min-height:80px;float:left;padding:10px;">
                            A:&nbsp;&nbsp;<span>${question.optionA}</span><br>
                            B:&nbsp;&nbsp;<span>${question.optionB}</span><br>
                            C:&nbsp;&nbsp;<span>${question.optionC}</span><br>
                            D:&nbsp;&nbsp;<span>${question.optionD}</span><br>
                        </div>
                        <div class="question_opreation" style="width:80px;min-height:80px;float:left;">
                            <a href="QuestionListServlet?method=update&post=${question.id}">修改</a>
                            <a href="javascript:if(confirm('确实要删除吗?'))location='QuestionListServlet?method=delete&post=${question.id}'">删除</a>
                        </div>
                    </div>
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
