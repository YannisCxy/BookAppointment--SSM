<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>首页</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <a class="navbar-brand" href="returnIndex.do">BAM</a>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="listBooks.do">书库</a>
                </li>
                <c:if test="${!empty user.username}">
                    <li class="dropdown">
                        <a href="queryOrders.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的预约 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${user.username}&status=1">我的预约</a></li>
                            <li><a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=1">已预约</a></li>
                            <li><a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=2">已借走</a></li>
                            <li><a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=3">已归还</a></li>
                        </ul>
                    </li>
                </c:if>
                <%--登陆后登录按钮变为用户名，点击跳转到个人中心--%>
                <c:if test="${!empty user.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="userInfo.do">${user.username}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="outlogin.do">退出</a>
                    </li>
                </c:if>
                <%--登陆前应有登陆按钮--%>
                <c:if test="${empty user.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="jumptouserlogin.do">登录</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jumptoregister.do">注册</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<h2>&nbsp;&nbsp;&nbsp;Welcome to BAM ! <small>--Book Appointment System</small></h2>
<hr/>
<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Well done!</h4>
    <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
    <hr>
    <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
</div>
</body>
</html>
