<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/6
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>user注册</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <a class="navbar-brand" href="returnIndex.do">BAM</a>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="listBooks.do">书库</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="jumptouserlogin.do">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="jumptoregister.do">注册</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="col-sm-offset-1 col-sm-8">
    <h3>用户注册</h3>
    <hr/>
    <div class="container-fluid col-md-6 col-md-offset-1">
        <form class="form-horizontal" action="addUser.do" method="post">
            <div class="form-group row">
                <label for="username">用户名：</label>
                <input class="form-control" name="username" type="text" id="username"><p style="font-size: 14px; color: #ce8483">${msg}</p>
            </div>
            <div class="form-group row">
                <label for="password" class="col-2 col-form-label">密码：</label>
                <input class="form-control" type="password" id="password" name="password">
            </div>
            <div class="form-group row">
                <label for="name" class="col-2 col-form-label">真实姓名：</label>
                <input class="form-control" type="text" id="name" name="name">
            </div>
            <div class="form-group row">
                <label for="sex" class="col-2 col-form-label">性别：&nbsp&nbsp</label>
                <input type="radio" value="0" name="sex" id="sex">&nbsp女&nbsp&nbsp&nbsp
                <input type="radio" value="1" name="sex" checked>&nbsp男
            </div>
            <div class="form-group row">
                <label for="phone" class="col-2 col-form-label">手机号码：</label>
                <input class="form-control" type="text" id="phone" name="phone">
            </div>
            <div class="form-group row">
                <label for="idnumber" class="col-2 col-form-label">身份证号：</label>
                <input class="form-control" type="text" id="idnumber" name="idnumber">
            </div>
            <div class="form-group row">
                <div class="col-sm-5 col-sm-offset-3">
                    <button type="submit" class="btn btn-block"><strong>注&nbsp&nbsp册</strong></button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
