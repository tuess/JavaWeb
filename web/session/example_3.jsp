<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //获取考号及答案
    String id=(String)session.getAttribute("id");
    String first=(String)session.getAttribute("first");
    String second=(String)session.getAttribute("second");
    String third=(String)session.getAttribute("third");

    //计算总分
    int sum=0;
    if("D".equals(first))
        sum+=40;
    if("True".equals(second))
        sum+=30;
    if("True".equals(third))
        sum+=30;
%>
你的成绩如下：
<table>
    <th>考号</th>
    <th>成绩</th>
    <tr>
        <td align="center"><%=id%></td>
        <td align="center"><%=sum+"分"%></td>
    </tr>
</table>
</body>
</html>
