<%@ page import="com.listener.beanBinding" %>
<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/15
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        beanBinding beanListener = new beanBinding();
        session.setAttribute("beanListener",beanListener); //绑定
    %>
</body>
</html>
