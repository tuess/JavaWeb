<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //调用setMaxInactiveInterval方法设置session的过期时间,tomcat默认为30分钟
    session.setMaxInactiveInterval(10);
    //isNew方法判定是否新创建
    boolean flag=session.isNew();
    if(flag)
    {
        out.print("欢迎第一次访问此web服务目录"+"<hr/>");
    }
    out.print("session的过期时间为："+session.getMaxInactiveInterval()+"秒<br>");
    //获取session对象被创建的时间
    long num=session.getCreationTime();
    //将num转为Date对象
    Date date=new Date(num);
    //构造一个SimpleDateFormat对象
   SimpleDateFormat df=new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒E");
   //将date格式化
    String strTime=df.format(date);
    out.print("session被创建的时间为："+strTime+"<br>");
    out.print("sessionID为："+session.getId());
%>
</body>
</html>
