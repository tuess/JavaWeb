<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/20
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<%!
    String name=null;
    String pwd=null;
%>

<%
    Cookie[] cookies=request.getCookies();
    for (Cookie cookie:cookies) {
        if(cookie.getName().equals("name"))
            name=cookie.getValue();
        if(cookie.getName().equals("pwd"))
            pwd=cookie.getValue();
    }
%>
<body>
    <form action="example_2.jsp" method="post " name=""form1>
        用户名：<input type="text" name="name" value="<%=name==null?"":name%>"><br>
        密码：<input type="password" name="pwd" value="<%=pwd==null?"":pwd%>"><br>
        <input type="submit" value="登录">
        记住密码<input type="checkbox" name="checkbox">
    </form>
</body>
</html>
