<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/18
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="request_value.jsp">
        姓名：<input type="text" name="name">
        <br>
        选择你去过的城市
        <input type="checkbox" name="cities" value="北京" />北京
        <input type="checkbox" name="cities" value="杭州" />杭州
        <input type="checkbox" name="cities" value="武汉" />武汉
        <input type="checkbox" name="cities" value="上海" />上海
        <br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
