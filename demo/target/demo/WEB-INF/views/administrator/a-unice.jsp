<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户解冻</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/m-index.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>

<div class="m-header">
    <div class="logo-field">
        <a href="#"><img src="../images/logo.png" alt=""></a>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/administrator/a-loginout.html"><i class="fa fa-power-off"></i>退出登录</a></li>
        <li><a href="#">欢迎来到后台管理系统</a></li>
    </ul>
</div>

<div class="m-sidebar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/administrator/a-index.html?page=1&leixing=1"><i class="fa fa-home"></i>首页</a></li>
        <li><a href="${pageContext.request.contextPath}/administrator/a-unicepage.html?page=1&leixing=1"><i class="fa fa-th-large"></i>用户解冻</a></li>
        <li><a href="${pageContext.request.contextPath}/administrator/a-teacher.html"><i class="fa fa-dashboard"></i>讲师管理</a></li>
        <li><a href="${pageContext.request.contextPath}/administrator/a-class.html"><i class="fa fa-folder-open"></i>课程管理</a></li>
    </ul>
</div>

<div class="m-content">
    <!-- 路径导航 -->
    <ol class="breadcrumb">
        <li><i class="fa fa-flag"></i></li>
        <li><a href="${pageContext.request.contextPath}/administrator/a-index.html?page=1&leixing=1">首页</a></li>
        <li class="active">用户解冻</li>
    </ol>
    <!-- /路径导航 -->
    <div class="control-bar">
        <span>被冻结用户列表</span>

        <!-- 排序规则 -->
        <%--<div class="btn-group" role="group" aria-label="...">--%>
        <%--<button type="button" class="btn btn-default"><a href="#">注册时间 <i class="fa fa-long-arrow-up"></i></a></button>--%>
        <%--<button type="button" class="btn btn-default"><a href="#">注册时间 <i class="fa fa-long-arrow-down"></i></a></button>--%>
        <%--<button type="button" class="btn btn-default"><a href="#">等级 <i class="fa fa-long-arrow-up"></i></a></button>--%>
        <%--<button type="button" class="btn btn-default"><a href="#">等级 <i class="fa fa-long-arrow-up"></i></a></button>--%>
        <%--</div>--%>

    </div>

    <div class="m-content-field">
        <!-- 用户列表 -->
        <table class="table table-striped">
            <thead>
            <tr>
                <td>用户id</td>
                <td>用户名</td>
                <td>真实姓名</td>
                <td>证件号</td>
                <td>邮箱</td>
                <td>手机号</td>
                <td>解冻用户</td>
                <td>删除</td>
            </tr>
            </thead>
            <c:forEach var="userinfo" items="${userinfos}">
            <tbody>
            <tr>
                <td><c:out value="${userinfo.userId}"></c:out></td>
                <td><c:out value="${userinfo.username}"></c:out></td>
                <td><c:out value="${userinfo.realname}"></c:out></td>
                <td><c:out value="${userinfo.cardId}"></c:out></td>
                <td><c:out value="${userinfo.email}"></c:out></td>
                <td><c:out value="${userinfo.phone}"></c:out></td>
                <td>
                    <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/administrator/a-uniceuser.html?id=<c:out value="${userinfo.userId}"></c:out>">解冻用户</a>
                </td>
                <td>
                    <button class="btn btn-danger btn-xs">删除</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- /用户列表 -->

        <nav style="text-align:center;">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/administrator/a-unice.html?page=<c:out value="${now}"></c:out>&leixing=3" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="page" items="${pages}">
                    <li ><a href="${pageContext.request.contextPath}/administrator/a-unice.html?page=<c:out value="${page}"></c:out>&leixing=1"><c:out value="${page}"></c:out></a></li>
                </c:forEach>

                <li>
                    <a href="${pageContext.request.contextPath}/administrator/a-unice.html?page=<c:out value="${now}"></c:out>&leixing=2" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>

                <li>
                   <a href="#">第<c:out value="${now}"></c:out>页</a> 
                </li>


            </ul>
        </nav>
    </div>
</div>
</body>
</html>