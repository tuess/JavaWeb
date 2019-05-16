<%@ page import="com.test.Login" %><%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/13
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
传统方式<br>
<%
    Login login= (Login) request.getAttribute("login");
    out.print(login+"<br>");
    out.print(login.getName()+"<br>");
    out.print(login.getPwd()+"<br>");
    out.print(login.isLogin());
%>
<hr/>
El方式<br>
${requestScope.login}<br>
${requestScope.login.name}<br>
${requestScope.login.pwd}<br>
${requestScope.login.login}<br>
点（.）操作符等价于中括号（[""]）操作符，中括号操作符更强大，可以包含特殊字符，可以获取数组，可以获取变量值<br><br>
数组<hr/>
${requestScope.hobbit[0]}<br>
${requestScope.hobbit[1]}<br>
${requestScope.hobbit[2]}<br><br>
map<hr/>
${requestScope.map.篮球}<br>
${requestScope.map['棒球']}<br>
${requestScope.map['足球']}<br><br>
运算（可以用符号或字母,大于>gt,大于等于>ge,小于>lt,小于等于>le,等于>eq,不等于>ne）<hr/>
${3>2}，${3 gt 2}，${1>2 || 2>1}，${1>2 or 2>1}

<hr/>
作用域访问对象，如pageScope，requestScope，sessionScope，applicationScope,如果不指定对象，则会按对象域从小到大依次匹配<br>
参数访问对象，如$ {param}，$ {paramValues},等价于request.getParameter()和request.getParameterValues(),可以方便的拿到网页中表单，超链接传过来的数据<br>
在jsp中可以通过pageContext获取其他的jsp隐式对象<br>
如通过pageContext获取session对象再获取sessionID,sessionID为：${pageContext.session.getId()}<br>
可以使用此方法级联获取方法：如获取当前端口为：${pageContext.request.serverPort}
</body>
</html>
