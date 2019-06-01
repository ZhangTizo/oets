<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="javascript" type="text/javascript" src="../../../js/WdatePicker.js"></script>
    <style>
        h1 {
            background: deepskyblue;
        }

        body {
            background-image: url("../../../image/background.jpg");
            background-size: 100% 100%;
        }

        .wrapper {
            margin: 3% 0 0 43%;
            width: 1120px;
        }
    </style>
</head>
<body>
<br><br><br><br><br>
<div align="center">
    <h1>新增试卷</h1>
</div>
<div class="wrapper">
    <form action="InsertTestPaperServlet" method="post">
        试卷名称:<input type="text" name="name" class="loginInput" required="required" autofocus="autofocus"
                    placeholder="请输入试卷名称"/>
        <br>
        开始时间:<input name="start" id="start" class="Wdate" type="text" placeholder="请选择开始时间"
                    onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})">
        <br>
        结束时间:<input name="end" class="Wdate" type="text" placeholder="请选择结束时间"
                    onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'start\')}||%y-%M-%d %H:%m:%s'})">
        <br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保&nbsp;&nbsp;存" class="loginBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="TestPaperListServlet" style="color: blue;font-weight: bold;font-size: 15px;">返&nbsp;&nbsp;回</a>
    </form>
</div>
</body>
</html>
