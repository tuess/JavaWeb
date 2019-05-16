<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/12
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
        姓名：<input type="text" name="name"><br>
        年龄：<input type="text" name="age"><br>
        文件必须为jpg，png格式，大小不能超过40KB<br>
        <input type="file" name="picture"><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
