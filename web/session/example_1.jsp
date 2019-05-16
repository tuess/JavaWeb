<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="example_2.jsp" method="post" name="form1">
        考号：<input type="text" name="id">
        <p>一，单项选择题</p>
        <input type="radio" name="first" value="A"/>A.public void setAttribute(String key, Object obj)<br>
        <input type="radio" name="first" value="B"/>B.public void removeAttribute(String key)<br>
        <input type="radio" name="first" value="C"/>C.public Enumeration getAttributeNames()<br>
        <input type="radio" name="first" value="D"/>D.public Object getAttribute(String key)<br>

        <p>二，判断题</p>
        1，同一个客户在多个web服务目录中，所对应的session对象是不相同的。<br>&emsp;
        <input type="radio" name="second" value="True"/>True
        <input type="radio" name="second" value="False"/>False
        <br>
        2，JSP跨页面传值有四种方式。<br>&emsp;
        <input type="radio" name="third" value="True"/>True
        <input type="radio" name="third" value="False"/>False<br>

        <input type="submit" value="提交"/>
        <input type="reset" value="重置"/>
</body>
</html>