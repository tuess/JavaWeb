<%@ page import="com.listener.beanPassivation" %><%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/15
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
钝化，活化，通过配置tomcat目录下的/conf/context.xml
<!--配置钝化，活化-->
<!--maxIdleSwap，最大空闲时间，超过该时间会被自动钝化-->
<!--directory，session文件保存的位置，如果填相对路径，是相对于在tomcat中项目文件夹下-->
<!--<Manager className="org.apache.catalina.session.PersistentManager" maxIdleSwap="5" >
    <Store className="org.apache.catalina.session.FileStore" directory="E:\桌面" />
</Manager>-->
    <%
        beanPassivation beanPassivation = new beanPassivation();
        beanPassivation.setId(10001);
        beanPassivation.setName("zhangsan");
        session.setAttribute("beanPassivation",beanPassivation);
    %>
</body>
</html>
