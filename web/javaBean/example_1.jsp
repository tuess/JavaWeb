<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="rectangle" class="com.test.Rectange" scope="page"/>
    <p>矩形的长为：<%=rectangle.getLength()%></p>
    <p>矩形的宽为：<%=rectangle.getWidth()%></p>
    <p>矩形的周长为：<%=rectangle.computerLength()+"厘米"%></p>
    <p>矩形的面积为:<%=rectangle.computerArea()+"平方厘米"%></p>
    <p>设置矩形的长为20厘米<%rectangle.setLength(20.0);%></p>
    <p>设置矩形的宽为10厘米<%rectangle.setWidth(10.0);%></p>
    <p>矩形的长为：<%=rectangle.getLength()%></p>
    <p>矩形的宽为：<%=rectangle.getWidth()%></p>
    <p>矩形的周长为：<%=rectangle.computerLength()+"厘米"%></p>
    <p>矩形的面积为:<%=rectangle.computerArea()+"平方厘米"%></p>
    <p>使用getProperty和setProperty动作标记来获取和更改bean的属性（在类中必须定义了getXXX()方法）<hr/></p>
    <!--两种常用方法设置-->
    <p>设置矩形的长为30厘米<jsp:setProperty name="rectangle" property="length" value="30.0"/></p>
    <p>设置矩形的宽为20厘米<jsp:setProperty name="rectangle" property="width" value="<%=20.0%>"/></p>
    <p>矩形的长为：<jsp:getProperty name="rectangle" property="length"/></p>
    <p>矩形的宽为：<jsp:getProperty name="rectangle" property="width"/></p>
</body>
</html>
