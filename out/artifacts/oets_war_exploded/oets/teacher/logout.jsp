<%@ page import="com.ahstu.oets.dao.impl.TeacherDaoImpl" %>
<%@ page import="com.ahstu.oets.entity.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("../student/login.jsp");
%>
</body>
</html>
