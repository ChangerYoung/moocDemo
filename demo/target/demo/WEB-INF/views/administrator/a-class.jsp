<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程列表页</title>
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
        <li class="active">课程管理</li>
    </ol>
    <!-- /路径导航 -->
    <div class="control-bar">
        <span>课程列表</span>
        <%--<form class="form-inline">--%>
            <%--<div class="input-group">--%>
                <%--<input type="text" class="form-control" name="" placeholder="按名称搜索">--%>
                <%--<div class="input-group-addon"><i class="fa fa-search"></i></div>--%>
            <%--</div>--%>
        <%--</form>--%>
    </div>

    <!-- 内容部分 -->
    <div class="m-content-field">
        <table class="table">
            <thead>
            <tr>
                <th>课程id</th>
                <th>课程名</th>
                <th>讲师</th>
                <th>章节</th>
                <th>课程类型</th>
                <th>审核状态</th>
                <th>审核操作</th>
                <th>删除课程</th>
            </tr>
            </thead>
            <c:forEach var="userinfo" items="${userinfos}">
            <tr>
                <td><c:out value="${userinfo.id}"></c:out></td>
                <td><c:out value="${userinfo.name}"></c:out></td>
                <td><c:out value="${userinfo.teacher}"></c:out></td>
                <td><a href="${pageContext.request.contextPath}/administrator/a-chapter.html?id=<c:out value="${userinfo.id}"></c:out>"class="btn btn-xs btn-info"><c:out value="${userinfo.chapter}"></c:out></a></td>
                <td><c:out value="${userinfo.typename}"></c:out></td>
                <td><c:out value="${userinfo.statuszhuangtai}"></c:out></td>
                <td>
                    <c:if test="${userinfo.status == 0}"><a href="${pageContext.request.contextPath}/administrator/a-classpass.html?pass=1&id=<c:out value="${userinfo.id}"></c:out>" class="btn btn-xs btn-info">通过审核</a>/<a href="${pageContext.request.contextPath}/administrator/a-classpass.html?pass=0&id=<c:out value="${userinfo.id}"></c:out>" class="btn btn-danger btn-xs">不通过审核</a></c:if>
                    <c:if test="${userinfo.status == 1}"><a href="${pageContext.request.contextPath}/administrator/a-classpass.html?pass=0&id=<c:out value="${userinfo.id}"></c:out>" class="btn btn-danger btn-xs">不通过审核</a></c:if>
                    <c:if test="${userinfo.status == 2}"><a href="${pageContext.request.contextPath}/administrator/a-classpass.html?pass=1&id=<c:out value="${userinfo.id}"></c:out>" class="btn btn-xs btn-info">通过审核</a></c:if>
                </td>
                <td>
                     <!-- 用弹框的时候 -->
                        <button class="btn btn-danger btn-xs btn-del-tag" type="button">删除课程</button> <!-- 删除弹框 -->
									<div class="modal fade bs-example-modal-sm" 
										 role="dialog"
										aria-labelledby="mySmallModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">Close</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">
														<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>警告
													</h4>
												</div>
												<div class="modal-body">删除后不可恢复，确定删除吗？</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default btn-sm"
														data-dismiss="modal">取消</button>
													<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/administrator/a-decourse.html?id=<c:out value="${userinfo.id}"></c:out>">确定</a>
												</div>
											</div>
										</div>
									</div> <!-- /删除弹框 -->
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- /内容部分 -->
    <nav style="text-align:center;">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/administrator/a-classpage.html?page=<c:out value="${now}"></c:out>&leixing=3" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="page" items="${pages}">
                <li ><a href="${pageContext.request.contextPath}/administrator/a-classpage.html?page=<c:out value="${page}"></c:out>&leixing=1"><c:out value="${page}"></c:out></a></li>
            </c:forEach>

            <li>
                <a href="${pageContext.request.contextPath}/administrator/a-classpage.html?page=<c:out value="${now}"></c:out>&leixing=2" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>

            <li>
                <a herf="#"> 第<c:out value="${now}"></c:out>页</a>
            </li>


        </ul>
    </nav>
</div>
<script>
   $(function(){
	   $('.btn-del-tag').click(function(){
		   $(this).next().modal('show');
	   })
   })
</script>
</body>
</html>