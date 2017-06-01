<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>讲师管理</title>
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
        <li class="active">讲师管理</li>
    </ol>
    <!-- /路径导航 -->
    <div class="control-bar">
        <span>讲师管理</span>
        <%--<form class="form-inline">--%>
            <%--<div class="input-group">--%>
                <%--<input type="text" class="form-control" name="" placeholder="按名称搜索">--%>
                <%--<div class="input-group-addon"><i class="fa fa-search"></i></div>--%>
            <%--</div>--%>
        <%--</form>--%>
        <%--<!-- 排序规则 -->--%>
        <%--<div class="btn-group" role="group" aria-label="...">--%>
            <%--<button type="button" class="btn btn-default active"><a href="#">审核通过</a></button>--%>
            <%--<button type="button" class="btn btn-default"><a href="#">审核不通过</a></button>--%>
            <%--<button type="button" class="btn btn-default"><a href="#">待审核 </a></button>--%>
        <%--</div>--%>

    </div>

    <!-- 条件 -->
    <!-- 审核通过 -->
    <%--<div class="con-bar-result">--%>
        <%--<span>审核通过</span>--%>
        <%--<div class="btn-group" role="group" aria-label="...">--%>
            <%--<button type="button" class="btn btn-default btn-xs"><a href="#">全选</a></button>--%>
            <%--<button type="button" class="btn btn-default btn-xs"><a href="#">取消全选</a></button>--%>
        <%--</div>--%>
        <%--<div class="btn-group" role="group" aria-label="...">--%>
            <%--<button type="button" class="btn btn-default btn-xs"><a href="#">删除</a></button>--%>
            <%--<button type="button" class="btn btn-default btn-xs"><a href="#">审核不通过</a></button>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- /审核通过 -->
    <!-- 审核不通过 -->
    <!-- <div class="con-bar-result">
       <span>审核不通过</span>
       <div class="btn-group" role="group" aria-label="...">
             <button type="button" class="btn btn-default btn-xs"><a href="#">全选</a></button>
             <button type="button" class="btn btn-default btn-xs"><a href="#">取消全选</a></button>
       </div>
       <div class="btn-group" role="group" aria-label="...">
             <button type="button" class="btn btn-default btn-xs"><a href="#">删除</a></button>
             <button type="button" class="btn btn-default btn-xs"><a href="#">审核通过</a></button>
       </div>
    </div> -->
    <!-- /审核不通过 -->
    <!-- 待审核 -->
    <!--  <div class="con-bar-result">
       <span>待审核</span>
       <div class="btn-group" role="group" aria-label="...">
             <button type="button" class="btn btn-default btn-xs"><a href="#">全选</a></button>
             <button type="button" class="btn btn-default btn-xs"><a href="#">取消全选</a></button>
       </div>
       <div class="btn-group" role="group" aria-label="...">
             <button type="button" class="btn btn-default btn-xs"><a href="#">审核通过</a></button>
             <button type="button" class="btn btn-default btn-xs"><a href="#">审核不通过</a></button>
       </div>
    </div> -->
    <!-- /待审核 -->
    <!-- /条件 -->
    <!-- 用户列表 -->
    <form action="">

        <div class="m-content-field">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td>用户id</td>
                    <td>用户名</td>
                    <td>真实姓名</td>
                    <td>发布课程</td>
                    <td>邮箱</td>
                    <td>手机号</td>
                    <td>审核状态</td>
                    <td>审核操作</td>
                    <td>冻结讲师</td>
                    <td>删除讲师</td>
                </tr>
                </thead>
                <c:forEach var="userinfo" items="${userinfos}">
                <tbody>
                <tr>
                    <td><c:out value="${userinfo.userId}"></c:out></td>
                    <td><c:out value="${userinfo.username}"></c:out></td>
                    <td><c:out value="${userinfo.realname}"></c:out></td>
                    <td><c:out value="${userinfo.course}"></c:out></td>
                    <td><c:out value="${userinfo.email}"></c:out></td>
                    <td><c:out value="${userinfo.phone}"></c:out></td>
                    <td><c:out value="${userinfo.shenhezhuangtai}"></c:out></td>
                    <td><c:if test="${userinfo.shenhe == 3}"><a href="${pageContext.request.contextPath}/administrator/a-teacherpass.html?pass=1&id=<c:out value="${userinfo.userId}"></c:out>" class="btn btn-xs btn-info">通过审核</a>/<a href="${pageContext.request.contextPath}/administrator/a-teacherpass.html?pass=0&id=<c:out value="${userinfo.userId}"></c:out>" class="btn btn-danger btn-xs">不通过审核</a></c:if>
                        <c:if test="${userinfo.shenhe == 4}"><a href="${pageContext.request.contextPath}/administrator/a-teacherpass.html?pass=1&id=<c:out value="${userinfo.userId}"></c:out>" class="btn btn-xs btn-info">通过审核</a></c:if>
                        <c:if test="${userinfo.shenhe == 5}"><a href="${pageContext.request.contextPath}/administrator/a-teacherpass.html?pass=0&id=<c:out value="${userinfo.userId}"></c:out>" class="btn btn-danger btn-xs">不通过审核</a></c:if>
                    </td>
                    <td>
                        <a class="btn btn-xs btn-info" href="${pageContext.request.contextPath}/administrator/a-iceteacher.html?id=<c:out value="${userinfo.userId}"></c:out>">冻结讲师</a>
                    </td>

                    <td>
                        
                       <!-- 用弹框的时候 -->
                        <button class="btn btn-danger btn-xs btn-del-tag" type="button">删除讲师</button> <!-- 删除弹框 -->
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
													<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/administrator/a-deteacher.html?id=<c:out value="${userinfo.userId}"></c:out>">确定</a>
												</div>
											</div>
										</div>
									</div> <!-- /删除弹框 -->

								</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
    </form>
    <!-- /用户列表 -->
    <nav style="text-align:center;">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/administrator/a-teacherpaper.html?page=<c:out value="${now}"></c:out>&leixing=3" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="page" items="${pages}">
                <li ><a href="${pageContext.request.contextPath}/administrator/a-teacherpaper.html?page=<c:out value="${page}"></c:out>&leixing=1"><c:out value="${page}"></c:out></a></li>
            </c:forEach>

            <li>
                <a href="${pageContext.request.contextPath}/administrator/a-teacherpaper.html?page=<c:out value="${now}"></c:out>&leixing=2" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>

            <li>
                 <a herf="#">第<c:out value="${now}"></c:out>页</a>
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