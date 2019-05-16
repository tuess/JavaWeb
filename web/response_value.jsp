<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String str1=request.getParameter("pwd");
    if("123".equals(str1))
    {
        out.print("输入正确！");
    }
    else
    {
        out.print("输入错误！");
    }
%>
</body>
</html>
