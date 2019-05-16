<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="example_3.jsp" method="post" name="form1">
        <%
            //获取考号
            String id=request.getParameter("id");
            //将考号id以"id"为关键字存到session中，以下同理
            session.setAttribute("id",id);
            //选择第一题
            String first=request.getParameter("first");
            session.setAttribute("first",first);
            //判断第一题
            String second=request.getParameter("second");
            session.setAttribute("second",second);
            //判断第二题
            String third=request.getParameter("third");
            session.setAttribute("third",third);
        %>

        <p>答题卡</p>
        你的考号：<%=id%><br>
        一，单项选择题（每题40分）<br>
        1.<%=first%><br>
        二，判断题（每题30分）<br>
        1.<%=second%><br>
        2.<%=third%><br>
        <input type="submit" value="确认">
        <a href="example_1.jsp">返回</a>
    </form>
</body>
</html>
