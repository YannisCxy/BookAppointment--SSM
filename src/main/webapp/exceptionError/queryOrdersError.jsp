<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2018/9/9
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>查询失败</title>
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
    <!--标题-->
    <div>
        <h3>预约记录</h3>
    </div>
    <hr/>
    <br/>
    <br/>
    <br/>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>预约ID</th>
                    <th>图书编号</th>
                    <th>书名</th>
                    <th>预约数量</th>
                    <th>预约时间</th>
                    <th>状态</th>
                    <th></th>
                </tr>
            </table>
            <br/>
            <br/>
            <div class="col-sm-offset-4">
                <p style="font-size: 16px; color: #761c19">
                    ${msg}
                </p>
            </div>

        </div>
    </div>
</div>
</body>
</html>
