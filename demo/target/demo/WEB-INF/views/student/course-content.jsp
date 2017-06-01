<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程详情页</title>
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
	    <a href="${pageContext.request.contextPath}/index.html" class="headerNav-logo"><img src="../images/logo.png" alt=""></a>
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

<!-- class-header -->
<div class="class-header">
	<div class="wrap-1200">
		<!-- 导航 -->
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/study/list.html?id=${course.type.id}">${course.type.name}</a></li>
		</ol>
		<span>${course.name}</span>
	</div>
</div>

<!-- /class-header -->

<!-- 课程介绍部分 -->
<div class="mc-intro-con">
	<div class="wrap-1200">
		<div class="mc-intro-part">
			<img src="../upload/${course.coverPic}" alt="">
			<div class="mc-message">
				<h3>${course.name}</h3>
				<div class="mes-detail">
					<p>课程介绍</p>
					<div>
						${course.introduction}
					</div>
					<a href="${pageContext.request.contextPath}/study/learning.html?id=${progress.chapterId}" class="btn btn-sm btn-success pull-right">
						<c:if test="${progress.id == 0}">开始学习</c:if>
						<c:if test="${progress.id != 0}">继续学习</c:if>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /课程介绍部分 -->

<!-- main-part -->
<div class="main-part">
	<div class="wrap-1200">
		<!-- 左侧评论区 -->
		<%-- <div class="main-partL">
			<ul class="c-list">
			    <li class="c-chanel">课程章节</li>
				<c:forEach var="chapter" items="${chapters}">
					<li>
						<i class="fa fa-reorder"></i>
						<div>
							<p>第${chapter.number}章 ${chapter.name }</p>
						</div>
					</li>
				</c:forEach>
			</ul>

		</div> --%>
		
		<!-- 左侧评论区 -->
		
		<div class="main-partL">
			<ul class="c-list">
			    <li class="c-chanel">课程章节</li>
                    <c:forEach var="chapter" items="${chapters}">
						<div class="c-chapter">
							<h3>
								<i class="fa fa-reorder left"></i>
								<strong>第${chapter.number}章 ${chapter.name }</strong>
								<i class="fa fa-plus right"></i>
							</h3>
						</div>
						<ul class='c-chapter-list'>
							<c:forEach var="sub" items="${chapter.subchapter}">
								<li><a href="${pageContext.request.contextPath}/study/learning.html?id=${sub.id}">${sub.number}.${sub.subNum} ${sub.name }</a></li>
							</c:forEach>
						</ul>
					</c:forEach>
			</ul>

		</div>
		
		
		<!-- 右侧评论区 -->
		<div class="main-partR">
			<!-- 讲师信息 -->
            <div class="t-intro-field">
            	<div class="title">讲师信息</div>
            	<div class="top">
            		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
            		<div class="user-header">
            			<p class="u-name"><strong>${course.teacherEntity.info.realname}</strong></p>
            			<p class="u-pos">曾工作单位：${course.teacherEntity.info.company}</p>
            		</div>
            	</div>
            	<div class="intro-content">
            		<p><strong>个人签名</strong></p>
            		<div>
						${course.teacherEntity.intro}
					</div>
            	</div>
            </div>
		</div>
	</div>
</div>
<!-- /main-part -->


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