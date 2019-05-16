<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/20
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //设置cookie（键值对）
    Cookie cookie=new Cookie("name","张三");
    Cookie cookie1=new Cookie("pwd","123");
    //添加cookie
    response.addCookie(cookie);
    response.addCookie(cookie1);
    //请求转发
    //request.getRequestDispatcher("show_cookie.jsp").forward(request,response);
    //重定向
    response.sendRedirect("show_cookie.jsp");
%>
</body>
</html>
