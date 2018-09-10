<%--
  Created by IntelliJ IDEA.
  User: Yannic
  Date: 2018/9/2
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>添加图书</title>
</head>
<body>
<form action="addBooks.do" method="post">
    书名：<input type="text" name="book_name"><br />
    类型：<input type ="text" name="book_type"><br/>
    价格： <input type="text" name="book_price"><br/>
    出版社：<input type ="text" name="book_publish"><br/>
    馆藏数量：<input type ="text" name="book_number"><br/>
    简介：<input type ="text" name="book_text"><br/>
    <input type="submit" value="添加">
</form>
</body>
</html>
