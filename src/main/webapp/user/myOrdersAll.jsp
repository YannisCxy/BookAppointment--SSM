<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/8
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
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
    <title>预约记录</title>
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
                            <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${user.username}">我的预约</a></li>
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
                    <th>#</th>
                    <th>图书编号</th>
                    <th>书名</th>
                    <th>预约数量</th>
                    <th>预约时间</th>
                    <th>到期时间</th>
                    <th>状态</th>
                </tr>
                <%--@elvariable id="pageInfo" type="com.github.pagehelper.PageSerializable"--%>
                <c:forEach items="${pageInfo.list}" var="orders">
                    <tr>
                        <td>${orders.id}</td>
                        <td>${orders.book_id}</td>
                        <td>${orders.book_name}</td>
                        <td>1</td>
                        <td>${orders.starttime}</td>
                        <td>${orders.finishtime}</td>
                        <td>
                            <c:if test="${orders.status eq '0'}">
                                预约取消
                            </c:if>
                            <c:if test="${orders.status eq '1'}">
                                预约成功
                            </c:if>
                            <c:if test="${orders.status eq '2'}">
                                已借走
                            </c:if>
                            <c:if test="${orders.status eq '3'}">
                                已归还
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!--分页信息-->
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前为第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，共有${pageInfo.total}条记录
        </div>
        <%--	分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=1">首页</a></li>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${username}&pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>
</body>
</html>
