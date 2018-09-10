<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/8/30
  Time: 10:42
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
    <title>用户登录</title>
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
<br/>


<div>
    <div style="height: 1000px;" class="container">
        <div class="center-block">
            <div class="col-sm-7">
                <h3>用户登录</h3>
                <hr/>
                <div class="panel panel-default">
                    <br/>
                    <div class="panel-body">
                        <form class="form-horizontal" action="verifyUser.do" method="post">
                            <div class="form-group row">
                                <label for="username" class="col-sm-offset-1 col-sm-2 col-form-label">用户名：</label>
                                <div class="col-sm-7">
                                    <input type="text" name="username" class="form-control" id="username">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Password" class="col-sm-offset-1 col-sm-2 col-form-label">密码：</label>
                                <div class="col-sm-7">
                                    <input type="password" name="password" class="form-control" id="Password">
                                </div>
                            </div>
                            <br/>
                            <div class="form-group row center-block">
                                <div class="col-sm-offset-4 col-sm-4">
                                    <button type="submit" class="btn btn-block">登&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp录</button>
                                </div>
                                <p style="font-size: 14px; color: #ce8483">
                                    ${msg}
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

