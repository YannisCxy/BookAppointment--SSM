<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2018/9/9
  Time: 8:42
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
<div class="container">
    <!--标题-->
    <div>
        <h3>书籍列表</h3>
    </div>
    <hr/>
    <form class="form-inline pull-right" action="queryBooks.do" method="get">
        <%--<label for="querytype"  class="col-form-label">搜索类型：</label>--%>
        <select id="querytype" name="querytype"  class="form-control mr-sm-2">
            <option selected>搜索类型</option>
            <option value="book_name">书名</option>
            <option value="book_type">类型</option>
            <option value="book_publish">出版社</option>
        </select>
        <label for="queryinfo"></label>
        <input id="queryinfo" name="queryinfo" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
    </form>
    <br/>
    <br/>
    <br/>
    <!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>书名</th>
                    <th>类型</th>
                    <th>出版社</th>
                    <th>馆藏数量</th>
                    <th></th>
                </tr>
            </table>
            <br/>
            <p style="font-size: 16px; color: #2e6da4;" class="col-sm-offset-4">
                ${msg}
            </p>
        </div>
    </div>
</div>
</body>
</html>
