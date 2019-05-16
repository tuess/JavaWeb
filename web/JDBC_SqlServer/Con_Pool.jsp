<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/23
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="Con_pool" class="com.test.Connection_Pool" scope="session"/>
<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    String sql="SELECT TOP 1000 [rdTypeName]\n" +
            "      ,[CanLendQty]\n" +
            "      ,[CanLendDay]\n" +
            "  FROM [Library].[dbo].[TB_ReaderType]";
    try{
        con=Con_pool.getOneCon();
        if(con==null){
            out.print("人数过多，稍后访问！");
            return;
        }
        st=con.createStatement();
        rs=st.executeQuery(sql);
        //输出表格
        out.print("<table>");
            out.print("<tr>");
                out.print("<th>身份类别</th>");
                out.print("<th>借书数量</th>");
                out.print("<th>借书日期</th>");
            out.print("</tr>");
        while(rs.next()){
            out.print("<tr>");
            out.print("<td align='center'>"+rs.getString("rdTypeName")+"</td>");
            out.print("<td align='center'>"+rs.getString("CanLendQty")+"</td>");
            out.print("<td align='center'>"+rs.getString("CanLendDay")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    }catch (SQLException e){
        e.printStackTrace();
    }finally {
        try{
            if(rs!=null){
                rs.close();
            }
            if(st!=null){
                st.close();
            }
            if(con!=null){
                //将连接对象放回连接池中
                Con_pool.releaseCon(con);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
%>
</body>
</html>
