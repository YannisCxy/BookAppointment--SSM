<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/2
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="GB18030" isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap ������ JavaScript ��������� jQuery�����Ա������ǰ��) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- ���� Bootstrap ������ JavaScript �������Ҳ���Ը�����Ҫֻ���ص�������� -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <title>�鼮����</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <a class="navbar-brand" href="returnIndex.do">BAM</a>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/index.jsp">��ҳ</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="listBooks.do">���</a>
                </li>
                <c:if test="${!empty user.username}">
                    <li class="dropdown">
                        <a href="queryOrders.do" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">�ҵ�ԤԼ <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/queryOrders.do?username=${user.username}">ԤԼ��¼</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=1">��ԤԼ</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=2">�ѽ���</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/queryByStatus.do?username=${user.username}&status=3">�ѹ黹</a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <%--��½���¼��ť��Ϊ�û����������ת����������--%>
                <c:if test="${!empty user.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="userInfo.do">${user.username}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="outlogin.do">�˳�</a>
                    </li>
                </c:if>
                <%--��½ǰӦ�е�½��ť--%>
                <c:if test="${empty user.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="jumptouserlogin.do">��¼</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jumptoregister.do">ע��</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div class="col-sm-offset-1">
    <h3>�鼮����</h3>
    <hr/>
</div>
<br/>
<p style="font-size: 14px; color: #ce8483" class="col-sm-offset-8">
    ${msg}
</p>
<br/>

<div class="col-sm-8 col-sm-offset-2">
    <table class="table table-striped">
        <tr>
            <th>ID��</th>
            <td>${bookInfo.id}</td>
        </tr>
        <tr>
            <th>������</th>
            <td>${bookInfo.book_name}</td>
        </tr>
        <tr>
            <th>���ࣺ</th>
            <td>${bookInfo.book_type}</td>
        </tr>
        <tr>
            <th>�����磺</th>
            <td>${bookInfo.book_publish}</td>
        </tr>
        <tr>
            <th>�ݲ�������</th>
            <td>${bookInfo.book_number}</td>
        </tr>
        <tr>
            <th>��飺</th>
            <td>${bookInfo.book_text}</td>
        </tr>
    </table>
    <div class="button col-sm-offset-3">
        <a href="appointment.do?id=${bookInfo.id}&username=${username}">
            <button type="button" class="btn btn-light col-sm-6">ԤԼ</button>
        </a>
    </div>
    <br/>
    <br/>
</div>

</body>
</html>
