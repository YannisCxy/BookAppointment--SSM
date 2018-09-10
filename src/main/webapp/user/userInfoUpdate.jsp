<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/9
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>BAM图书预约</title>
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
                <li class="dropdown">
                    <a href="queryOrders.do" class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">我的预约 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/queryOrders.do?username=${user.username}">我的预约</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=1">已预约</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=2">已借走</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=3">已归还</a>
                        </li>
                    </ul>
                </li>
                <%--登录后登录按钮变为用户名，点击跳转到个人中心--%>
                <li class="nav-item">
                    <a class="nav-link" href="userInfo.do">${user.username}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="outlogin.do">退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <!-- content start -->
    <div class="row content-container">
        <div class="title">
            <h3>个人中心</h3>
        </div>
        <hr/>
        <div class="container-fluid col-md-6 col-md-offset-2">
            <form class="form-horizontal" action="userInfoUpdate.do" method="post">
                <div class="form-group row">
                    <label for="username">用户名：</label>
                    <input class="form-control" name="username" type="text" id="username" readonly="true" value="${user.username}">
                </div>
                <div class="form-group row">
                    <label for="password" class="col-2 col-form-label">密码：</label>
                    <input class="form-control" type="password" id="password" name="password" value="${user.password}">
                </div>
                <div class="form-group row">
                    <label for="name" class="col-2 col-form-label">真实姓名：</label>
                    <input class="form-control" type="text" id="name" name="name" readonly="true" value="${user.name}">
                </div>
                <div class="form-group row">
                    <label for="sex" class="col-2 col-form-label">性别：&nbsp&nbsp</label>
                    <div>
                        <c:if test="${user.sex eq '0'}">
                            <input class="form-control" type="text" id="sex" readonly="true" value="女">
                            <input class="hidden" type="hidden" name="sex" value="0">
                        </c:if>
                        <c:if test="${user.sex eq '1'}">
                            <input class="form-control" type="text" id="sex" readonly="true" value="男">
                            <input class="hidden" type="hidden" name="sex" value="1">
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-2 col-form-label">手机号码：</label>
                    <input class="form-control" type="text" id="phone" name="phone" value="${user.phone}">
                </div>
                <div class="form-group row">
                    <label for="idnumber" class="col-2 col-form-label">身份证号：</label>
                    <input class="form-control" type="text" id="idnumber" name="idnumber" readonly="true" value="${user.idnumber}">
                </div>
                <br/>
                <div class="form-group row">
                    <div>
                        <button type="submit" class="btn col-sm-4 col-sm-offset-1">确&nbsp认&nbsp修&nbsp改</button>
                    </div>
                </div>
                <p style="font-size: 16px; color: #ce8483" class="col-sm-offset-5">
                    ${msg}
                </p>
            </form>
        </div>
    </div>
    <!-- content end -->
</div>
</body>
</html>

