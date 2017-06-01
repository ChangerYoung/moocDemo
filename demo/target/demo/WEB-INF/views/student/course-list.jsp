<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${type.name}</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/index.css">

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/index.js"></script>
</head>
<body>

<!-- header-nav -->
<div class="header-nav">
	<div class="wrap-1200">
		<div class="welcome-title">欢迎来到study-online</div>
		<ul>
			<c:if test="${sessionScope.user == null}">
				<li><a href="${pageContext.request.contextPath}/login.html">登录注册</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<li class="udown-tip">
					<a href="javascript:void(0)">我的</a>
					<div class="udown-message">
						<!-- top -->
						<div class="udown-top">
							<div class="left">
								<a href="${pageContext.request.contextPath}/home.html"><img src="../upload/${sessionScope.user.dpPath}" alt=""></a>
							</div>
							<div class="right">
								<div class="head">
									<p>${sessionScope.user.nickname}</p>
								</div>
								<p>${sessionScope.user.intro}</p>
							</div>
						</div>
						<!-- bottom -->
						<div class="udown-bottom">
							<a href="${pageContext.request.contextPath}/user/set.html" class="per-set"><i class="fa fa-gear"></i>个人设置</a>
							<a href="${pageContext.request.contextPath}/logout.html" class="login-out"><i class="fa fa-power-off"></i>退出系统</a>
						</div>
					</div>
				</li>
			</c:if>
		</ul>
	</div>
</div>
<!-- /header-nav -->

<!-- header-content -->
<div class="header-content">
	<div class="wrap-1200">
		<div class="logo-field">
			<a href="${pageContext.request.contextPath}/index.html"><img src="../images/logo.png" alt=""></a>
		</div>
		<form action="">
			<div class="search-field">
				<input type="text" placeholder="搜索课程资源" value="" class="search-input">
				<a href="#"><i class="fa fa-search"></i></a>
			</div>
		</form>
	</div>
</div>
<!-- /header-content -->

<!-- main-botnav -->
<div class="main-botnav">
	<div class="wrap-1200">
		<ul>
			<li class="a-home"><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
			<c:forEach var="t" items="${types}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${t.id}">${t.name}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- / main-botnav -->

<div class="course-part-line" id="1">
	<div class="wrap-1200">
		<div class="top-title bg-primary mr-20 mb-20">${type.name}</div>

		<c:forEach var="course" items="${page.result}">
			<a class="part-field mr-20 mb-20" href="${pageContext.request.contextPath}/study/content.html?id=${course.id}">
				<img src="../upload/${course.coverPic}" alt="">
				<div>${course.name}</div>
			</a>
		</c:forEach>

		<ul class="pagination pagination-sm" style="text-align:center;">
			<c:if test="${page.pageNo > 1}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo - 1}">&laquo;</a></li>
			</c:if>
			<c:if test="${page.pageNo > 4 && page.pageNo == page.totalPage}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo - 4}">${page.pageNo - 4}</a></li>
			</c:if>
			<c:if test="${page.pageNo > 3 && page.pageNo >= page.totalPage - 1}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo - 3}">${page.pageNo - 3}</a></li>
			</c:if>
			<c:if test="${page.pageNo > 2}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo - 2}">${page.pageNo - 2}</a></li>
			</c:if>
			<c:if test="${page.pageNo > 1}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo - 1}">${page.pageNo - 1}</a></li>
			</c:if>

			<li class="active"><a>${page.pageNo}</a></li>

			<c:if test="${page.pageNo < page.totalPage}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo + 1}">${page.pageNo + 1}</a></li>
			</c:if>
			<c:if test="${page.pageNo < page.totalPage - 1}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo + 2}">${page.pageNo + 2}</a></li>
			</c:if>
			<c:if test="${page.pageNo < page.totalPage - 2 && page.pageNo <= 2}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo + 3}">${page.pageNo + 3}</a></li>
			</c:if>
			<c:if test="${page.pageNo < page.totalPage - 3 && page.pageNo == 1}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo + 4}">${page.pageNo + 4}</a></li>
			</c:if>

			<li><a>共${page.totalPage}页</a></li>
			<c:if test="${page.pageNo < page.totalPage}">
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${type.id}&pageNo=${page.pageNo + 1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<!-- <a class="btn btn-default btn-xs click-tag">查看更多</a> -->
	
</div>



<!-- footer -->
<div class="footer">
 <div class="wrap-1200">
 	<ul>
		<li><a href="#">关于我们</a></li>
		<li><a href="#">意见反馈</a></li>
		<li><a href="#">友情链接</a></li>
		<li><a href="#">联系我们</a></li>
		<li><a href="#">讲师招聘</a></li>
		<li><a href="#">网站地图</a></li>

		<li class="pull-right"><a href="${pageContext.request.contextPath}/administrator/a-login.html">管理员登录</a></li>
	</ul>
	<p>备案号:1234567890123456789</p>
 </div>	
</div>	
<!-- /footer -->
</body>
</html>