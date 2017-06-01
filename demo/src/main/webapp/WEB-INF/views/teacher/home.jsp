<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%    
String path = request.getContextPath();    
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。

String username = (String)session.getAttribute("username");
	if(username==null){
		response.sendRedirect("login");
	}
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>讲师主页</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/base.css">
<!-- 	<link rel="stylesheet" href="../css/index.css"> -->
	<link rel="stylesheet" href="<%=path%>/static/css/t-index.css">
	<script src="<%=path%>/static/js/jquery.min.js"></script>
	<script src="<%=path%>/static/js/bootstrap.min.js"></script>
	<script src="<%=path%>/static/js/t-index.js"></script>
</head>
<body>
<!-- header-nav -->
<div class="header-nav">
	<div class="wrap-1200">
		<div class="welcome-title">欢迎来到study-online</div>
		<ul>
				<li class="udown-tip">
					<a href="javascript:void(0)">我的</a>
					<div class="udown-message">
						<!-- top -->
						<div class="udown-top">
							<div class="left">
								<a href="${pageContext.request.contextPath}/home.jsp"><img src="<%=path%>/static/images/user-img.jpg" alt=""></a>
							</div>
							<div class="right">
								<div class="head">
									<p><%=username%></p>
								</div>
								<p>好好学习，天天向上！</p>
							</div>
						</div>
						<!-- bottom -->
						<div class="udown-bottom">
							<a href="${pageContext.request.contextPath}/user/set.html" class="per-set"><i class="fa fa-gear"></i>个人设置</a>
							<a href="${pageContext.request.contextPath}/logout" class="login-out"><i class="fa fa-power-off"></i>退出系统</a>
						</div>
					</div>
				</li>
		</ul>
	</div>
</div>
<!-- /header-nav -->

<!-- header-content -->
<div class="header-content">
	<div class="wrap-1200">
		<div class="logo-field">
			<a href="#"><img src="<%=path%>/static/images/logo.png" alt=""></a>
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
			<li class="a-home"><a href="#">我的课程</a></li>
			<li><a href="${pageContext.request.contextPath}/toAddCourse">创建课程</a></li>
		</ul>
	</div>
</div>
<!-- / main-botnav -->
<!-- banner -->
<div class="tbanner">
	<div class="wrap-1200">
		
	</div>
</div>
<!-- /banner -->

<!-- tclass -->
<div class="tclass">
	<div class="wrap-1200">
		<div class="tclass-content">		
			<!-- ul列表 -->
			<ul class="nav nav-pills" role="tablist">
				<li role="presentation" class="active">
					<a href="#myCreated" role="tab" data-toggle="tab">已发布课程</a>
				</li>
			</ul>
			<!--内容部分  -->
			<div class="tab-content">
				<!--已发布课程-->
				<div role="tabpanel" class="tab-pane active" id="myCreated">
					<c:forEach var="course" items="${course_list}">
						<div class="tclass-line">
							<div class="left"><a href="#"><img src="<%=path%>/static/images/${course.picurl}" alt=""></a></div>
							<div class="right">
								<button class="btn-click"><i class="fa fa-location-arrow"></i></button>
								<div class="hide-field">
									<a href="${pageContext.request.contextPath}/course/editCourse?courseId=${course.courseid}" class="link-1"><i class="fa fa-edit"></i>编辑课程</a>
									<a href="${pageContext.request.contextPath}/course/deleteCourse?courseId=${course.courseid}" class="link-1"><i class="fa fa-trash-o"></i>删除课程</a>
									<a href="${pageContext.request.contextPath}/courseDetail/editChapter?courseId=${course.courseid}" class="link-1"><i class="fa  fa-plus-circle "></i>章节管理</a>
								</div>
							</div>
							<div class="middle">
								<div>课程名称：${course.coursename}</div>
								<div>课程简介：${course.description}</div>
								<div>课程种类：
										<c:if test="${course.coursetype == 0}"><span>前端</span></c:if>
										<c:if test="${course.coursetype == 1}"><span>后台</span></c:if>
										<c:if test="${course.coursetype == 2}"><span>Android</span></c:if>
										<c:if test="${course.coursetype == 3}"><span>IOS</span></c:if>
								</div>
							</div>
							<br/><br/><br/>
						</div>
					</c:forEach>

				</div>
			</div>
			<!--/内容部分  -->
		</div>
	</div>
</div>
<!-- /tclass -->
</body>
<script>
	function deleteCourse(id){
		$.ajax({
			async:false,
			type:'POST',
			data:'courseId=' + id,
			url:'${pageContext.request.contextPath}/teacher/deleteCourse.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					location.reload();
				}else
					alert(data.message);
			}
		});
	}
</script>
</html>