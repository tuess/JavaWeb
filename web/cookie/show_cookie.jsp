<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/20
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    Cookie[] cookies=request.getCookies();
    for (Cookie cookie:cookies) {
        out.print(cookie.getName()+"-->"+cookie.getValue()+"<br>");
    }
%>
</body>
</html>
