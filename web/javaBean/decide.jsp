<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="login" class="com.test.Login" scope="page"/>
    <%--通过HTTP表单的参数值设置bean的属性（表单参数与属性自动匹配），在getProperty之前要先setProperty，property设置为*--%>
    <jsp:setProperty name="login" property="*"/>
    姓名：<jsp:getProperty name="login" property="name"/>
    密码：<jsp:getProperty name="login" property="pwd"/>
    输入是否正确：<jsp:getProperty name="login" property="login"/>
<%
    if(login.isLogin()){
%>
        <script>location.href="../index.jsp"</script>
<%
    }
    StringBuffer a=new StringBuffer("aaa");

%>

</body>
</html>
