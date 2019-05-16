<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/15
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    从硬盘中读取session域中的对象（活化不需要操作，系统会自己寻找）<br>
    id:${sessionScope.beanPassivation.id}<br>
    name:${sessionScope.beanPassivation.name}<br>
</body>
</html>
