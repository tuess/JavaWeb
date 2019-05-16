<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/4/18
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%--page标记用来定义某些属性和值，常用属性有contentType（值只能有一个）,import,language,pageEncoding等--%>
<%--常见的contentType属性有text/html(网页),text/plain(普通文本),application/pdf(pdf文档),image/png(png图像)等--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    //    加感叹号的，里面定义成员变量（全局变量）和方法（是一个类内的变量和方法也就是成员变量和成员方法）
    int b=0;
    int add(int x,int y)
    {
        return x*y;
    }

%>

<%
    //    这里写的是代码片，里面的变量是局部变量（是一个方法的变量也就是局部变量）
    //    如果在这里添加一个method()方法那么该程序就会报错，这样声明一个方法等于就是一个类里的方法里又声明了个方法--
    int a=0;
    a++;
    b++;
    int result=add(1,2);
    out.print("局部变量的值是："+a+"<br>");
    out.print("全局变量的值是："+b+"<br>");
    out.print("1*2的值为："+result+"<br>");
    out.print("这是第"+b+"次访问此页面"+"<br>");
%>

<%--表达式,<%=%>，表达式的值必须能求值，可以直接与hmtl代码嵌套--%>
半径为5的圆的面积为：<%=3.14*5*5%>

<%--嵌入网页--%>
<%="<br>"+"下面为index.jsp的内容"+"<br>"%>
<%@include file="index.jsp"%>

<%--forward,执行到此处停止，并跳转到指定的jsp页面--%>
<%
    long i=Math.round(Math.random()*10); //或者强制类型转换取得整数值
    if(i%2==0)
    {
        out.print("<br>"+"随机获取的是偶数，即将跳转到index.jsp!");
        request.getRequestDispatcher("index.jsp").forward(request,response);
        //重定向不能实现此功能
    }
    else
    {
        out.print("随机获取的是奇数，不跳转");
    }
%>

<%--parma标记，不能独立使用，可以作为include，forward标记的子标记来使用，为对应页面传递参数--%>
<%--接收参数的页面可以使用内置的request调用getParmaer()方法获取传递过来的参数--%>

</body>
</html>
