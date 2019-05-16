<%--
  Created by IntelliJ IDEA.
  User: tuess
  Date: 2019/5/15
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<hr/>
JSTL中的c:set相当于request.setAttribute()，可以给某个变量（可以给不存在的变量赋值）和某个对象的属性赋值<br>
    <c:set var="name" value="zhangsan" scope="request" />
    拿到值：${requestScope.name}<br>
在某个作用域之中（4个范围对象和map对象），给某个对象的属性复制（此种写法，不能指定scope属性值）<br>
<%--
    <c:set target="${requestScope.student}" property="sname" value="zxs" />
--%>

<hr/>
JSTL中的c:out,用于显示操作，相当于EL中的$ {requestScope.student}<br>
    <c:out value="${requestScope.name}" /><br>
c:out可以显示不存在的数据，在后面加上default属性值<br>
<c:out value="${requestScope.password}" default="defaultPassword" /><br>
在后面加上escapeXml属性值，可以将文字全部直接打印出来<br>
设为true:<c:out value="<a href='https://www.bing.com'>必应</a>" escapeXml="true" /><br>
设为false:<c:out value="<a href='https://www.bing.com'>必应</a>" escapeXml="false" /><br>

<hr/>
c:remove，删除属性
<c:remove var="a" scope="request" />

<hr/>
单重选择，用test保存if语句的条件，var保存判断的结果<br>
<c:if test="${10>2}" var="result" scope="request" >
    true<br>
    ${requestScope.result}
</c:if>

<hr/>
多重选择，switch语句用<c:out value="<c:choose></c:choose>"/>语句,中间case语句用<c:out value='<c:when test="..."></c:when>'/>,
最后default用<c:out value="<:c:otherwise></:c:otherwise>"/><br>
    <c:choose>
        <c:when test="${1<2}">
            为true的操作
        </c:when>
        <c:when test="${1>2}">
            为false的操作
        </c:when>
        <c:otherwise>
            其它的操作
        </c:otherwise>
    </c:choose>

<hr/>
循环（迭代）标签，对于for(int i=0;i<=5;i++)这种，用<c:out value='<c:forEach begin=" " end=" " step=" "></c:forEach>'/>来做<br>
    <c:forEach begin="0" end="5" step="1" varStatus="status">
        ${status.index}...
    </c:forEach>
<br>
对于迭代，for(String str:names)这种，用<c:out value='<c:forEach var=" " items=" "></c:forEach>'/>,其中var相当于名字，items相当于被迭代的对象<br>
<%--
    <c:forEach var="name" items="${requestScope.names}">
        ${name}
    </c:forEach>
--%>
</body>
</html>
