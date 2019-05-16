<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/20
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //获取账号和密码
    request.setCharacterEncoding("UTF-8");
    String name=request.getParameter("name");
    String pwd=request.getParameter("pwd");
    String checkbox=request.getParameter("checkbox"); //记住密码
    //判断是否记住密码
    if (checkbox==null){
        //重定向
        response.sendRedirect("example_1.jsp");
    }
    else{
        //设置cookie
        Cookie cookie=new Cookie("name",name);
        Cookie cookie1=new Cookie("pwd",pwd);
        //添加cookie
        response.addCookie(cookie);
        response.addCookie(cookie1);
        //重定向
        response.sendRedirect("example_1.jsp");
    }
%>
</body>
</html>
