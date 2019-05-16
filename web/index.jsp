<%--
Created by IntelliJ IDEA.
User: tuess
Date: 2019/4/18
Time: 13:09
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%="html"+"<hr/>"%>
<%
    out.print("第一个jsp网页");
%>
<%="当前页面的虚拟路径："+application.getContextPath()+"<br>"%>
<%="当前页面的绝对路径："+application.getRealPath("/JspProject_war_exploded")%>
<%
    System.out.print("sessionId为："+session.getId());
%>
<hr/>
servlet验证表单
<form action="Servlet" method="get" name="form1">
    输入账户：<input type="text" name="id"><br>
    输入密码：<input type="password" name="pwd"><br>
    <input type="submit" value="提交">
</form>
<a href="Servlet?id=111&pwd=123">servlet</a><br>
<a href="fileupload.jsp">文件上传</a><br>
<a href="fileDownloadServlet?filename=1.txt">下载</a><br>
<a href="ELServlet">EL</a><br>
</body>
</html>
