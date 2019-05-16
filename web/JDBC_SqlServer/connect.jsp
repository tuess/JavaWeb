<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/19
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>身份类别</th>
        <th>借书数量</th>
        <th>借书日期</th>
    </tr>

<%
    Connection con=null;
    Statement st=null;
    PreparedStatement pst=null;
    ResultSet result=null;
    String url="jdbc:sqlserver://localhost:1433;database=Library";
    String sql="SELECT TOP 1000 [rdTypeName]\n" +
            "      ,[CanLendQty]\n" +
            "      ,[CanLendDay]\n" +
            "  FROM [Library].[dbo].[TB_ReaderType]";
    String sql1="select * from TB_ReaderType where rdTypeName like ?";
    try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    }
    catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        //创建Connection对象
        con=DriverManager.getConnection(url,"sa","157175");
        //由已创建的Connection对象调用createStatement方法创建Statement对象
        st=con.createStatement();
        //创建prepareStatement预编译对象，再后面executeQuery（）方法执行的时候就不用在方法里面加sql语句参数了
        //pst=con.prepareStatement(sql1);
        //设置值（preparedStatement可以用？代替，再用setInt()或者setString()等方法给？赋值）
        //pst.setString(1,"%生%");
        //由已创建的Statement对象调用executeQuery方法执行sql语句，executeQuery方法用于查询，executeUpdate方法用于insert，update，delete等
        //ResultSet对象是execute方法的返回值，调用next方法移动到下一个数据行，数据行存在则返回true，否则返回false,executeUpdate返回的是一个受影响的行数
         result=st.executeQuery(sql);
        //调用preparedStatement对象
        //result=pst.executeQuery();
        //获得数据后可以使用getXXX方法取得数据
        while (result.next()){
            out.print("<tr>");
                out.print("<td align='center'>"+result.getString("rdTypeName")+"</td>");
                out.print("<td align='center'>"+result.getString("CanLendQty")+"</td>");
                out.print("<td align='center'>"+result.getString("CanLendDay")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
    }
    catch (SQLException e){
        e.printStackTrace();
    }
    finally{
            try{
                if(result!=null){
                    result.close();
                }
                if(st!=null){
                    st.close();
                }
//                if(pst!=null){
//                    pst.close();
//                }
                if(con!=null){
                    con.close();
                }
            }
            catch (SQLException e){
                e.printStackTrace();
            }
    }
%>
</body>
</html>
