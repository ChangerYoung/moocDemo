<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
	//判断session，为空则回到登陆界面
	String username = (String)session.getAttribute("username");
	if(username==null){
		response.sendRedirect("login");
	}
	
%>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>study online</title>
		<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/static/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=path%>/static/css/base.css">
		<link rel="stylesheet" href="<%=path%>/static/css/index.css">
	
		<script src="<%=path%>/static/js/jquery.min.js"></script>
		<script src="<%=path%>/static/js/bootstrap.min.js"></script>
		<script src="<%=path%>/static/js/index.js"></script>
	</head>
<body>
<!-- header-nav -->
<div class="header-nav">
	<div class="wrap-1200">
		<div class="welcome-title">欢迎来到study-online</div>
		<ul>
			<!-- <li><a href="login">登录注册</a></li> -->
			<li><a href="#">讲师申请</a></li>
			<li><a href=""><i class="fa  fa-question-circle"></i>帮助</a></li>
			<li><a href=""><i class="fa fa-bell-o"></i>消息</a></li>
			<li class="udown-tip">
			   <a href="javascript:void(0)">我的</a>
			   <div class="udown-message">
			   <!-- top -->
			   	  <div class="udown-top">
			   	  	<div class="left">
			   	  		<a href="#"><img src="<%=path%>/static/images/user-img.jpg" alt=""></a>
			   	  	</div>
			   	  	<div class="right">
			   	  		<div class="head">
			   	  			<p><%=username%></p>
			   	  		</div>
			   	  		<p>过春风十里,尽荞麦青青</p>
			   	  	</div>
			   	  </div>
			   	  <!-- bottom -->
                  <div class="udown-bottom">
                  	<a href="#" class="per-set"><i class="fa fa-gear"></i>个人设置</a>
                  	<a href="logout" class="login-out"><i class="fa fa-power-off"></i>退出系统</a>
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
			<li class="a-home"><a href="#">首页</a></li>
			<li><a href="#course_1">前端开发</a></li>
			<li><a href="#course_2">后端开发</a></li>
			<li><a href="#course_3">安卓开发</a></li>
			<li><a href="#course_4">IOS开发</a></li>
			<li><a href="#course_5">Linux操作</a></li>
		</ul>
	</div>
</div>
<!-- / main-botnav -->

<!-- banner -->
<div class="banner">
    <div class="show">
        <ul>
            <li><a href="#" ><img src="<%=path%>/static/images/banner_1.jpg"/></a></li>
            <li><a href="#" ><img src="<%=path%>/static/images/banner_2.jpg"/></a></li>
            <li><a href="#" ><img src="<%=path%>/static/images/banner_3.jpg"/></a></li>
        </ul>
    </div>
    <div class="focus">
       <a href="javascript:void(0);" class="on" ></a>
       <a href="javascript:void(0);"></a>
       <a href="javascript:void(0);"></a>
    </div>

</div>
<!-- /banner -->
<div class="hot-part">
	<div class="wrap-1200">
		<div class="title">小编推荐<small>精彩推荐</small></div>
		<div class="part-line">
			<!-- 每一部分课时 -->
			<a class="part-field mr-20" href="#">
				<img src="<%=path%>/static/images/class_01.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>

			<!-- /每一部分课时 -->
			<!-- 每一部分课时 -->
			<a class="part-field mr-20" href="#">
				<img src="<%=path%>/static/images/class_02.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>
			<!-- /每一部分课时 -->
			<!-- 每一部分课时 -->
			<a class="part-field mr-20" href="#">
				<img src="<%=path%>/static/images/class_01.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>

			<!-- /每一部分课时 -->
			<!-- 每一部分课时 -->
			<a class="part-field mr-20" href="#">
				<img src="<%=path%>/static/images/class_02.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>
			<!-- /每一部分课时 -->
			<!-- 每一部分课时 -->
			<a class="part-field mr-20" href="#">
				<img src="<%=path%>/static/images/class_01.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>

			<!-- /每一部分课时 -->
			<!-- 每一部分课时 -->
			<a class="part-field" href="#">
				<img src="<%=path%>/static/images/class_02.jpg" alt="">
				<div>微信公众账号的开发</div>
				<p>
					<span>400人在学</span>
					<span>1课时</span>
				</p>
			</a>
			<!-- /每一部分课时 -->	
		</div>
	</div>
</div>
<!-- 课程部分 -->
<div class="course-part" id="course_1">
	<div class="wrap-1200">
		<!-- 标题部分 -->
		<div class="course-tip bg-danger mr-20">
			<div class="title">前端开发</div>
			<ul>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">HtmlDOM</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">Jquery</a></li>
				<li><a href="#">Angular</a></li>
				<li><a href="#">React</a></li>
				<li><a href="#">移动web</a></li>
			</ul>
			<a href="#">更多>></a>
		</div>
		<!-- /标题部分 -->
		<!-- 大图 -->
		<a class="part-field-big mr-20" href="#">
			<img src="<%=path%>/static/images/big-course.jpg" alt="">
			<div>web前端设计从入门到精通</div>
			<p>
				<span>300人在学</span>
				<span>2小时</span>
			</p>
		</a>
		<!-- /大图 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->

	</div>
</div>
<!-- /课程部分 -->

<!-- 课程部分 -->
<div class="course-part" id="course_2">
	<div class="wrap-1200">
		<!-- 标题部分 -->
		<div class="course-tip bg-success mr-20">
			<div class="title">后台开发</div>
			<ul>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">HtmlDOM</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">Jquery</a></li>
				<li><a href="#">Angular</a></li>
				<li><a href="#">React</a></li>
				<li><a href="#">移动web</a></li>
			</ul>
			<a href="#">更多>></a>
		</div>
		<!-- /标题部分 -->
		<!-- 大图 -->
		<a class="part-field-big mr-20" href="#">
			<img src="<%=path%>/static/images/big-course.jpg" alt="">
			<div>web前端设计从入门到精通</div>
			<p>
				<span>300人在学</span>
				<span>2小时</span>
			</p>
		</a>
		<!-- /大图 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->

	</div>
</div>
<!-- /课程部分 -->


<!-- 课程部分 -->
<div class="course-part" id="course_3">
	<div class="wrap-1200">
		<!-- 标题部分 -->
		<div class="course-tip bg-warning mr-20">
			<div class="title">安卓开发</div>
			<ul>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">HtmlDOM</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">Jquery</a></li>
				<li><a href="#">Angular</a></li>
				<li><a href="#">React</a></li>
				<li><a href="#">移动web</a></li>
			</ul>
			<a href="#">更多>></a>
		</div>
		<!-- /标题部分 -->
		<!-- 大图 -->
		<a class="part-field-big mr-20" href="#">
			<img src="<%=path%>/static/images/big-course.jpg" alt="">
			<div>web前端设计从入门到精通</div>
			<p>
				<span>300人在学</span>
				<span>2小时</span>
			</p>
		</a>
		<!-- /大图 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->

	</div>
</div>
<!-- /课程部分 -->


<!-- 课程部分 -->
<div class="course-part" id="course_4">
	<div class="wrap-1200">
		<!-- 标题部分 -->
		<div class="course-tip bg-info mr-20">
			<div class="title">IOS开发</div>
			<ul>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">HtmlDOM</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">Jquery</a></li>
				<li><a href="#">Angular</a></li>
				<li><a href="#">React</a></li>
				<li><a href="#">移动web</a></li>
			</ul>
			<a href="#">更多>></a>
		</div>
		<!-- /标题部分 -->
		<!-- 大图 -->
		<a class="part-field-big mr-20" href="#">
			<img src="<%=path%>/static/images/big-course.jpg" alt="">
			<div>web前端设计从入门到精通</div>
			<p>
				<span>300人在学</span>
				<span>2小时</span>
			</p>
		</a>
		<!-- /大图 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->

	</div>
</div>
<!-- /课程部分 -->

<!-- 课程部分 -->
<div class="course-part" id="course_5">
	<div class="wrap-1200">
		<!-- 标题部分 -->
		<div class="course-tip bg-primary mr-20">
			<div class="title">Linux系统</div>
			<ul>
				<li><a href="#">HTML</a></li>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">HtmlDOM</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">Jquery</a></li>
				<li><a href="#">Angular</a></li>
				<li><a href="#">React</a></li>
				<li><a href="#">移动web</a></li>
			</ul>
			<a href="#">更多>></a>
		</div>
		<!-- /标题部分 -->
		<!-- 大图 -->
		<a class="part-field-big mr-20" href="#">
			<img src="<%=path%>/static/images/big-course.jpg" alt="">
			<div>web前端设计从入门到精通</div>
			<p>
				<span>300人在学</span>
				<span>2小时</span>
			</p>
		</a>
		<!-- /大图 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mr-20 mb-20" href="#">
			<img src="<%=path%>/static/images/class_01.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->
		<!-- 每一部分课时 -->
		<a class="part-field mb-20" href="#">
			<img src="<%=path%>/static/images/class_02.jpg" alt="">
			<div>微信公众账号的开发</div>
			<p>
				<span>400人在学</span>
				<span>1课时</span>
			</p>
		</a>
		<!-- /每一部分课时 -->

	</div>
</div>
	<!-- /课程部分 -->

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

		<li class="pull-right"><a href="#">讲师申请</a></li>
		<li class="pull-right"><a href="#">管理员登录</a></li>
	</ul>
	<p>备案号:1234567890123456789</p>
 </div>	
</div>	
<!-- /footer -->
</body>
</html>