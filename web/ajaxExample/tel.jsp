<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/16
  Time: 14:35
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function register() {
            var tel=document.getElementById("tel").value;
            //通过ajax异步请求服务端
            xmlhttprequest = new XMLHttpRequest();
            //设置XMLHttpRequest对象的回调函数,不需要写()
            xmlhttprequest.onreadystatechange = callback;
            xmlhttprequest.open("post","http://localhost:8080/JspProject_war_exploded/TelServlet",true);
            //get方式传的数据加在地址的后面
            //xmlhttprequest.open("post","http://localhost:8080/JspProject_war_exploded/TelServlet?tel="+tel,true);
            //设置post方式的头信息，如果有文件上传， 请求头应设置为("Content-Type","multipart/form-data"),get方式不需要设置请求头
            xmlhttprequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
            //发送数据，为key=value的形式
            xmlhttprequest.send("tel="+tel);
            //get方式send填null
            //xmlhttprequest.send(null);
        }

        //定义回调函数
        function callback() {
            //请求状态码和响应状态码都对时再进行下一步
            var data=xmlhttprequest.responseText;
            if(xmlhttprequest.readyState===4 && xmlhttprequest.status===200){
                if(data==="true"){
                    alert("此号码已存在，请更换号码")
                }else{
                    alert("注册成功")
                }
            }
        }
    </script>
</head>
<body>
手机号：<input type="text" id="tel" name="tel"><br>
<input type="button" value="注册" onclick="register()">
</body>
</html>
