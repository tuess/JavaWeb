<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/18
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name"); //取得传递过来的名字
        String cities[]=request.getParameterValues("cities"); //取得传递过来的城市名数组
    %>
    输入的姓名为：<%=name+"<br>"%>
    去过的城市有：
    <%
        if(cities!=null) //防止出错
        {
            for(int i=0;i<cities.length;i++)
            {
                out.print(cities[i]+" ");
            }
        }
//        请求转发（数据会保留，地址栏不变）
//        request.getRequestDispatcher("request.jsp").forward(request,response);
    %>
</body>
</html>
