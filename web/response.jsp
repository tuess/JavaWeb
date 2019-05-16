<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <form action="post" name="form1">
            用response动态改变ContentType属性值<br>
            <input type="submit" name="word" value="word">
            <input type="submit" name="excel" value="excel">
        </form>
<%
    String str=request.getParameter("submit");
    if("word".equals(str))
    {
        //response调用setContentType方法设置MIME类型为word
        response.setContentType("application/vnd.ms-word");
    }
    else if("excel".equals(str))
    {
        //response调用setContentType方法设置MIME类型为excel
        response.setContentType("application/vnd.ms-excel");
    }
%>
        此页面每3秒刷新一次！<br>
        现在的秒钟时间是：
<%
    //设置响应头
    Date date=new Date();
    out.print(" "+ date.getSeconds());
    //设置为3秒刷新一次
    response.setHeader("refresh","3");
    //设置定时跳转就在时间后面加上url=...
    //response.setHeader("refresh","3;url=index.jsp");
%>
<%--通过sendRedirect设置重定向到response_value.jsp--%>
<form action="response_value.jsp" method="post" name="form2">
    输入密码：<input type="password" name="pwd">
    <input type="submit" value="提交">
</form>

<%
    String id=session.getId();
%>
sessionID为：<%=id%>

<!--forward和sendRedirect方法都可以实现页面的跳转，forward是服务器端跳转，地址栏不会变，sendRedirect方法相反,
forward标记是执行到标记处停止然后跳转，sendRedirect是全部执行完后再跳转;
使用forward，通过request请求信息能够保留在下一个页面，sendRedirect不能保留，信息会丢失；
forward用param标记传递参数，sendRedirect用?key=value的方式传递参数
response.sendRedirect(String location)
还可以用setStatus()和setHeader()方法
String site = "http://www.runoob.com" ;
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);-->
</body>
</html>
