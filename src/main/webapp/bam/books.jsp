<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/2
  Time: 14:42
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
    <title>书籍列表</title>
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
        <p style="font-size: 14px; color: #ce8483" class="pull-right">
            ${msg}
        </p>
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
    <!--按钮-->
    <%--<div class="row">--%>
        <%--<div class="col-md-8">--%>
            <%--<a href="addbooks.jsp">--%>
                <%--<button type="button" class="btn">增加</button>--%>
            <%--</a>--%>
            <%--<button type="button" class="btn">删除</button>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>书名</th>
                    <th>类型</th>
                    <th>出版社</th>
                    <th>馆藏数量</th>
                    <th></th>
                </tr>
                <%--@elvariable id="pageInfo" type="com.github.pagehelper.PageSerializable"--%>
                <c:forEach items="${pageInfo.list}" var="books">
                    <tr>
                        <td>${books.id}</td>
                        <td>${books.book_name}</td>
                        <td>${books.book_type}</td>
                        <td>${books.book_publish}</td>
                        <td>${books.book_number}</td>
                        <td>
                            <button type="button" class="btn btn-sm">
                                <a href="${pageContext.request.contextPath}/booksInfo.do?id=${books.id}">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    详情
                                </a>
                            </button>
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
                    <li><a href="${pageContext.request.contextPath}/listBooks.do?pn=1">首页</a></li>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/listBooks.do?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/listBooks.do?pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/listBooks.do?pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/listBooks.do?pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/listBooks.do?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>
</body>
</html>
