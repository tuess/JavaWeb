<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/16
  Time: 15:44
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function register() {
            var $tel = $("#tel").val();
            /*$.ajax({
                url:"../TelServlet",
                请求方式:"post",
                data:"tel="+$tel,
                success:function (result,testStatus) {
                    if(result==="true"){
                        alert("此号码已存在，请更换号码");
                    }else {
                        alert("注册成功");
                    }
                },
                error:function (xhr,errorMessage,e) {
                  alert("系统异常")
                }
            });*/

            /* get和post方式，数据要严格按照顺序,其它都一样，改get为post即可
             $.get(
                 "../TelServlet", //请求的地址
                 "tel="+$tel,     //发送的数据
                 function (result) { //成功的回调函数
                     if(result==="true"){
                         alert("此号码已存在，请更换号码");
                     }else {
                         alert("注册成功");
                     }
                 },
                 "text" //期待的返回值类型（可以不写）
             );*/

            /* $().load(),简化版的$get，前面需填入一个选择器，一般会省略回调函数，省略后会直接将函数返回参数直接显示在选择器里面
             $("#tip").load(
                 "../TelServlet",
                 "tel="+$tel,
                 function (result) {
                     if(result==="true"){
                         $("#tip").append("<h1>此号码已存在</h1>");
                     }else{
                         $("#tip").append("<h1>添加成功</h1>");
                     }
                 }
             )*/

            /*$.getJSON(),传递json格式的数据
            $.getJSON(
                "../TelServlet",
                {"tel":$tel},
                function (result) { //返回值是json类型,需要在servlet中返回json
                    if(result.msg==="true"){
                        alert("此号码已存在，请更换号码");
                    }else{
                        alert("注册成功");
                    }
                }
            )
        }*/

            /* 单个json的处理方式
            function test() {
                $.getJSON(
                    "../TelServlet",
                    {"tel":"111"},
                    function (result) { //返回值是json类型,需要在servlet中返回json
                        //js需要通过eval()函数将返回值转换成一个js能够识别的json对象
                        var jsonLogin = eval(result.login1);
                        alert(jsonLogin.name+"---"+jsonLogin.pwd+"---"+jsonLogin.login);
                    }
                )
            }*/
        }

            //多个json的处理方式
            function test() {
                $.getJSON(
                    "../TelServlet",
                    {"tel": "111"},
                    function (result) { //返回值是json类型,需要在servlet中返回json
                        //js需要通过eval()函数将返回值转换成一个js能够识别的json对象
                        var jsonLogin = eval(result);
                       $.each(jsonLogin,function (i,element) {
                           alert(this.name+"---"+this.pwd+"---"+this.login);
                       });
                    }
                )
            }
    </script>
</head>
<body>
手机号：<input type="text" id="tel" name="tel"><br>
<input type="button" value="注册" onclick="register()">
<input type="button" value="测试json" onclick="test()">
<span id="tip"></span>
</body>
</html>