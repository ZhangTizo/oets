<%@ page import="com.ahstu.oets.entity.Student" %>
<%@ page import="com.ahstu.oets.dao.impl.StudentDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        StudentDaoImpl sdi = new StudentDaoImpl();
        try {
            if(sdi.getOne((String) session.getAttribute("stuno")).getRemember().equals("1")){
                request.setAttribute("student",session.getAttribute("stuno"));
                Student student = sdi.getOne((String) session.getAttribute("stuno"));
                student.setRemember(null);
                sdi.alter(student);
                session.invalidate();
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.invalidate();
        response.sendRedirect("login.jsp");
    %>
</body>
</html>
