<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/4
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>

<%@ taglib prefix="j" uri="/xianzhipt/jsonTag" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/XzLogin/Login.do">
        用户名<input name="username" value="aaa">
        密码<input name="password" value="aaa">
        <input type="submit">
    </form>
    <%--<j:toJson obj="${userLogin}"/>
aaaaaa--%>
</body>
</html>
