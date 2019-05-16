<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/23
  Time: 13:32
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
    ResultSet result=null;
    String url="jdbc:sqlserver://localhost:1433;database=Library";
    String sql="SELECT TOP 1000 [rdTypeName]\n" +
            "      ,[CanLendQty]\n" +
            "      ,[CanLendDay]\n" +
            "  FROM [Library].[dbo].[TB_ReaderType]";
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
        //Statement st=con.createStatement(int type,int concurrency)
        //type有三种值，ResultSet.TYPE_FORWARD_ONLY，表示结果集只能向下滚动，ResultSet.TYPE_SCROLL_INSENSITIVE表示结果集可以上下滚动，当数据库变化时，
        //结果集不变，ResultSet.TYPE_SCROLL_SENSITIVE表示结果集可以上下滚动，当数据库变化时，结果集同步改变
        //concurrency有两种取值，表示是否可以用结果集更新数据库的表，ResultSet.CONCUR_UPDATABLE表示可以，ResultSet.CONCUR_READ_ONLY表示不能
        st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); //表示可以上下滚动，同步改变，不可以反向更新
        //由已创建的Statement对象调用executeQuery方法执行sql语句，executeQuery方法用于查询，executeUpdate方法用于insert，update，delete等
        //ResultSet对象是execute方法的返回值，调用next方法移动到下一个数据行，数据行存在则返回true，否则返回false
        result=st.executeQuery(sql);
        //获得数据后可以使用getXXX方法取得数据
        result.last(); //将游标移动到最后
        int number= result.getRow(); //获取最后一行的行号
        result.afterLast(); //为了逆序输出记录，要将游标移动到最后一行之后
        while (result.previous()){ //previous,和next相反，向上移动
            out.print("<tr>");
                out.print("<td align='center'>"+result.getString("rdTypeName")+"</td>");
                out.print("<td align='center'>"+result.getString("CanLendQty")+"</td>");
                out.print("<td align='center'>"+result.getString("CanLendDay")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        out.print("共有："+number+"条记录"+"<br>");
        out.print("逆序输出记录！"+"<br>");
        out.print("单独输出第三条记录"+"<br>");
        //public boolean absolute(int row),将游标移动到参数指定的行,赋负值，即倒数的行，返回false
        result.absolute(3);
        out.print(result.getString("rdTypeName")+" ");
        out.print(result.getString("CanLendQty")+" ");
        out.print(result.getString("CanLendDay")+" ");
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
