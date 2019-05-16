<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/12
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>性别</th>
    </tr>

    <%
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        String url="jdbc:mysql://localhost:3306/test"+"?serverTimezone=GMT%2B8";;
        String sql="select * from student";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(url,"root","157175");
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
            out.print("<tr>");
                out.print("<td align='center'>"+rs.getString("id")+"</td>");
                out.print("<td align='center'>"+rs.getString("name")+"</td>");
                out.print("<td align='center'>"+rs.getString("sex")+"</td>");
            out.print("</tr>");
            }
            out.print("</table>");

        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if (pst!=null) pst.close();
            if(con!=null) con.close();
        }
    %>
</body>
</html>
