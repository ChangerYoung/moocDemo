<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程学习页</title>
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
		<div class="left">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
				<li><a href="${pageContext.request.contextPath}/study/list.html?id=${course.type.id}">${course.type.name}</a></li>
			</ol>
			<p>${current.number}.${current.subNum} ${current.name }</p>
		</div>
	</div>
</div>

<!-- /class-header -->

<!-- 课程介绍部分 -->
<div class="mc-intro-con" style="height:480px;">
	<div class="wrap-1200">
		<video src="../upload/${current.videoPath}" controls="controls"></video>
	</div>
</div>
<!-- /课程介绍部分 -->

<!-- main-part -->
<div class="main-part">
	<div class="wrap-1200">
	    <!-- 左侧评论区 -->
	    <div class="main-partL">
	    	<!-- ul列表 -->
	    	<ul class="nav nav-pills" role="tablist">
	    		<li role="presentation" class="active">
	    			<a href="#m_class_field" aria-controls="m_class_field" role="tab" data-toggle="tab">课程</a>
	    		</li>
	    		<%--<li role="presentation">--%>
	    			<%--<a href="#m_answer_field" aria-controls="m_answer_field" role="tab" data-toggle="tab">问答区</a>--%>
	    		<%--</li>--%>
	    		<%--<li role="presentation">--%>
	    			<%--<a href="#m_discuss_field" aria-controls="m_discuss_field" role="tab" data-toggle="tab">评论区</a>--%>
	    		<%--</li>--%>
	    	</ul>
	    	<!--内容部分  -->
	    	<div class="tab-content">
	    		<!--课程区-->
	    		<div role="tabpanel" class="tab-pane active" id="m_class_field">
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
	    		</div>
	    		<%--<!--问答区-->--%>
	    		<%--<div role="tabpanel" class="tab-pane" id="m_answer_field">--%>
                    <%--<div class="ask-field">--%>
                    <%--<form action="">--%>
                    	<%--<div class="line">--%>
                    		<%--<span>标题：</span>--%>
                    		<%--<input type="text" value="" placeholder="请输入标题">--%>
                    	<%--</div>--%>
                    	<%--<div class="line" style="height:80px;">--%>
                    		<%--<span>内容：</span>--%>
                    		<%--<textarea placeholder="请输入内容"></textarea>--%>
                    	<%--</div>--%>
                    	<%--<div class="line"><a class="btn-form-click" href="#">提交</a></div>--%>
                    	<%----%>
                    <%--</form>--%>
                    <%--</div>--%>
                    <%--<!-- wenda -->--%>
                    <%--<div class="c-part-ans">--%>
                    	<%--<div class="title">全部问答</div>--%>
                    	<%--<!-- line -->--%>
                    	<%--<div class="answer-content-line">--%>
                    		<%--<div class="left">--%>
                    			<%--<a href="#"><img src="../images/user-img.jpg" alt=""></a>--%>
                    			<%--<p>木木和弦</p>--%>
                    		<%--</div>--%>
                    		<%--<div class="middle">--%>
                    			<%--<a><i class="fa fa-question-circle"></i>这里怎么传的值</a>--%>
                    			<%--<div class="mi-an">--%>
                    				<%--<span>[最近回答]</span><span><a href="#">[username:]</a></span>还没学进阶，我个人猜测 for $i from 1 through lenth($list) 应该是一个循环条件，$i从1开始循环，直到list的长度值结束，然--%>
                    			<%--</div>--%>
                    		   <%--<p>2016-01-01 10:00</p>--%>
                    		<%--</div>--%>
                    		<%--<div class="right">--%>
                    			<%--<a href="#"><span class='badge bg-warning'>12</span><br/>回答</a>--%>
                    		<%--</div>--%>
                    	<%--</div>--%>
                    	<%--<!-- /line -->--%>
                    	<%--<!-- line -->--%>
                    	<%--<div class="answer-content-line">--%>
                    		<%--<div class="left">--%>
                    			<%--<a href="#"><img src="../images/user-img.jpg" alt=""></a>--%>
                    			<%--<p>木木和弦</p>--%>
                    		<%--</div>--%>
                    		<%--<div class="middle">--%>
                    			<%--<a><i class="fa fa-question-circle"></i>这里怎么传的值</a>--%>
                    			<%--<div class="mi-an">--%>
                    				<%--<span>[最近回答]</span><span><a href="#">[username:]</a></span>还没学进阶，我个人猜测 for $i from 1 through lenth($list) 应该是一个循环条件，$i从1开始循环，直到list的长度值结束，然--%>
                    			<%--</div>--%>
                    		   <%--<p>2016-01-01 10:00</p>--%>
                    		<%--</div>--%>
                    		<%--<div class="right">--%>
                    			<%--<a href="#"><span class='badge bg-warning'>12</span><br/>回答</a>--%>
                    		<%--</div>--%>
                    	<%--</div>--%>
                    	<%--<!-- /line -->--%>
                    <%--</div>--%>


	    		<%--</div>--%>
	    		<%--<!--评论区-->--%>
	    		<%--<div role="tabpanel" class="tab-pane" id="m_discuss_field">--%>
                    <%--<!-- pinlun -->--%>
                    <%--<div class="ask-field">--%>
                    <%--<form action="">--%>
                    	<%--<div class="line" style="height:80px;">--%>
                    		<%--<span>评论：</span>--%>
                    		<%--<textarea placeholder="请输入内容"></textarea>--%>
                    	<%--</div>--%>
                    	<%--<div class="line"><a class="btn-form-click" href="#">发表</a></div>--%>
                    	<%----%>
                    <%--</form>--%>
                    <%--</div>--%>
                    <%--<!-- bann -->--%>
                    <%--<div class="c-part-ans">--%>
                    	<%--<div class="title">全部评论</div>--%>
                    	<%--<!-- line -->--%>
                    	<%--<div class="answer-content-line">--%>
                    		<%--<div class="left">--%>
                    			<%--<a href="#"><img src="../images/user-img.jpg" alt=""></a>--%>
                    		<%--</div>--%>
                    		<%--<div class="middle">--%>
                    			<%--<a href="#">username</a>--%>
                    			<%--<div class="mi-an">--%>
                    				<%--还没学进阶，我个人猜测 for $i from 1 through lenth($list) 应该是一个循环条件，$i从1开始循环，直到list的长度值结束，然--%>
                    			<%--</div>--%>
                    		   <%--<p>2016-01-01 10:00</p>--%>
                    		<%--</div>--%>
                    		<%--<div class="right">--%>
                    			<%--<a href="#"><i class="fa fa-heart-o"></i>12</a>--%>
                    		<%--</div>--%>
                    	<%--</div>--%>
                    	<%--<!-- /line -->--%>
                    <%--</div>--%>
	    		<%--</div>--%>
	    	</div>
	    	<!--/内容部分  -->			
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