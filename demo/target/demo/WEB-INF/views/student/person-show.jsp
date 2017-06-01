<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/per.css">

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

<!-- 个人展示banner -->
<div class="pershow">
	<div class="wrap-1200">
		<div class="per-intro">
			<h3>${sessionScope.user.nickname}</h3>
			<h5>${sessionScope.user.intro}</h5>

		</div>
	</div>
</div>

<!-- /个人展示banner -->

<!-- 个人展示内容 -->
<div class="main-pershow">
	<div class="wrap-1200">
	<!-- 侧边导航 -->
		<div class="left">
			<ul class="nav" role="tablist">
	    		<li role="presentation" class="active">
	    			<a href="#mper_course"  data-toggle="tab"><i class="fa fa-laptop"></i>课程</a>
	    		</li>
	    	</ul>
		</div>
	<!-- 右侧内容 -->
	    <div class="right">
	    	<!--内容部分  -->
	    	<div class="tab-content">
	    	<div class="top">
	    		   	   <a href="#" class="active">最近学习</a>
	    		   	</div>
	    		<!--课程区-->
	    		<div role="tabpanel" class="tab-pane active" id="mper_course">
					<c:forEach var="progress" items="${progresses}">
						<div class="per-course-line">
							<a href="#"><img src="../upload/${progress.course.coverPic}" alt=""></a>
							<div class="perline-middle">
								<h4>${progress.course.name}</h4>
								<p><span>已学至：${progress.chapter.number}.${progress.chapter.subNum} ${progress.chapter.name }</span></p>
							</div>
							<div class="perline-right">
								<a href="javascript:deleteChapter(${progress.id})" class="a-trash" title="删除课程"><i class="fa fa-trash-o"></i></a>
								<a href="${pageContext.request.contextPath}/study/learning.html?id=${progress.chapter.id}" class="btn btn-sm btn-success">继续学习</a>
							</div>
						</div>
					</c:forEach>
	    		   
	    		</div>
	    		<div role="tabpanel" class="tab-pane" id="mper_message">
	    		    <div class="top">
	    		   	   <a href="#">系统通知</a>
	    		   	   <a href="#">我的消息</a>
	    		   	</div>
	    		   	   <table class="table table-hover table-striped">
	    		   	   	<tbody>
	    		   	   		<tr>
	    		   	   			<td>系统通知新消息系统通知新消息系统通知新消息系统通知新消息</td>
	    		   	   		</tr>
	    		   	   		<tr>
	    		   	   			<td>系统通知新消息系统通知新消息系统通知新消息系统通知新消息</td>
	    		   	   		</tr>
	    		   	   	</tbody>
	    		   	   </table>
                       <!-- 我的消息 -->
	    		   	   <table class="table table-hover table-striped" id="my_mes">
	    		   	   	<tbody>
	    		   	   		<tr>
	    		   	   		    <td class="td-img">
	    		   	   		       <a href="#"><img src="../images/user-img.jpg" alt=""></a>
	    		   	   		       <p>木木和旋</p>
	    		   	   		    </td>
	    		   	   			<td>系统通知新消息系统通知新消息系统通知新消息系统通知新消息</td>
	    		   	   		</tr>
	    		   	   		<tr>
	    		   	   		    <td class="td-img">
	    		   	   		       <a href="#"><img src="../images/user-img.jpg" alt=""></a>
	    		   	   		       <p>木木和旋</p>
	    		   	   		    </td>
	    		   	   			<td>系统通知新消息系统通知新消息系统通知新消息系统通知新消息</td>
	    		   	   		</tr>
	    		   	   		<tr>
	    		   	   		    <td class="td-img">
	    		   	   		       <a href="#"><img src="../images/user-img.jpg" alt=""></a>
	    		   	   		       <p>木木和旋</p>
	    		   	   		    </td>
	    		   	   			<td>系统通知新消息系统通知新消息系统通知新消息系统通知新消息</td>
	    		   	   		</tr>
	    		   	   		<tr>
	    		   	   		    <td colspan="2" class="bg-f0">
		    		   	   		    <form action="" id="sent_mes">
		    		   	   		    	<label for=""><i class="fa fa-edit "></i>编辑</label>
		    		   	   		    	<input type="text" placeholder="请编辑内容">
		    		   	   		    	<input type="submit" class="" value="发送">
		    		   	   		    </form>
	    		   	   		    </td>
	    		   	   		</tr>
	    		   	   	</tbody>
	    		   	   </table> 
	    		</div>
	    		<div role="tabpanel" class="tab-pane" id="mper_target">
	    		 <div class="top">
	    		    <a href="#" class="active">我的关注</a>
	    		   	<a href="#">我的粉丝</a>
	    		 </div>
                 <!-- 我的关注 -->
                    <div class="concern">
                    	<div class="con-top">
                    		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
                    		<h4>木木和弦</h4>
                    		<p>软件开发工程师</p>
                    	</div>
                    	<div class="con-bottom">
                    	<span>关注:123</span><span>粉丝：234</span>
                    		<a href="#">取消关注</a>
                    		<a href="#">消息</a>
                    	</div>
                    </div>

                     <div class="concern">
                    	<div class="con-top">
                    		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
                    		<h4>木木和弦</h4>
                    		<p>软件开发工程师</p>
                    	</div>
                    	<div class="con-bottom">
                    	<span>关注:123</span><span>粉丝：234</span>
                    		<a href="#">取消关注</a>
                    		<a href="#">消息</a>
                    	</div>
                    </div>

                     <div class="concern">
                    	<div class="con-top">
                    		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
                    		<h4>木木和弦</h4>
                    		<p>软件开发工程师</p>
                    	</div>
                    	<div class="con-bottom">
                    	<span>关注:123</span><span>粉丝：234</span>
                    		<a href="#">取消关注</a>
                    		<a href="#">消息</a>
                    	</div>
                    </div>
                     <div class="concern">
                    	<div class="con-top">
                    		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
                    		<h4>木木和弦</h4>
                    		<p>软件开发工程师</p>
                    	</div>
                    	<div class="con-bottom">
                    	<span>关注:123</span><span>粉丝：234</span>
                    		<a href="#">取消关注</a>
                    		<a href="#">消息</a>
                    	</div>
                    </div>
                    
                 <!-- /我的关注 -->

                 <!-- 我的粉丝 -->
                  <div class="concern">
                    	<div class="con-top">
                    		<a href="#"><img src="../images/user-img.jpg" alt=""></a>
                    		<h4>木木和弦</h4>
                    		<p>软件开发工程师</p>
                    	</div>
                    	<div class="con-bottom">
                    	<span>关注:123</span><span>粉丝：234</span>
                    		<a href="#">+关注</a>
                    		<a href="#">消息</a>
                    	</div>
                    </div>
                 <!-- /我的粉丝 -->

	    		</div>
	    		<div role="tabpanel" class="tab-pane" id="mper_asktip">
	    		<!-- 我的提问 -->
                   <div class="ask-part">
                   	  <div class="ask-top">
                   	  	 <a href="#"><img src="../images/user-img.jpg" alt=""></a>
                   	  	 <h4>微信开发的学习工具有哪些?<small class="pull-right">2016-01-01 10:00</small></h4>
                   	  </div>
                   	  <!-- 回答 -->
                   	  <div class="ask-con">
                   	  	<div class="left">[回答---1]</div>
                   	  	<div class="right">
                   	  		微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···
                   	  	</div>
                   	  </div>
                       
                       <div class="ask-con">
                   	  	<div class="left">[回答---1]</div>
                   	  	<div class="right">
                   	  		微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···微信开发的学习工具有···
                   	  	</div>
                   	  </div>


                   </div>
	    	    <!-- /我的提问 -->
	    		</div>
	    		<div role="tabpanel" class="tab-pane" id="mper_discuss">
	    		555
	    		</div>
	    	</div>
	    </div>
	</div>
</div>
<!-- /个人展示内容 -->

</body>
<script>
	function deleteChapter(id){
		$.ajax({
			async:false,
			type:'POST',
			data:'id=' + id,
			url:'${pageContext.request.contextPath}/study/deleteProgress.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					location.reload();
				}else
					alert("删除失败！");
			}
		});
	}
</script>
</html>