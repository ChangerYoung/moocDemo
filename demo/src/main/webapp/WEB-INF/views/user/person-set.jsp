<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人设置页</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/per.css">

	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery.form.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/index.js"></script>
	<script src="../js/person-set.js"></script>
</head>
<body>

<!-- header-nav -->
<div class="header-nav">
	<div class="wrap-1200">
	    <a href="${pageContext.request.contextPath}/index.html" class="headerNav-logo"><img src="../images/logo.png" alt=""></a>
		<ul>
			<c:if test="${sessionScope.user == null}">
				<li><a href="#">登录注册</a></li>
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

<!-- 路径导航-->
<div class="class-header">
	<div class="wrap-1200">
		<!-- 导航 -->
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
			<li class="active">个人设置</li>
		</ol>
	</div>
</div>

<!-- /路径导航 -->

<!-- 个人设置 -->
<div class="perset">
	<div class="wrap-1200">
		<h3>个人设置</h3>
	</div>
</div>

<!-- /个人设置 -->

<div class="main-perset">
	<div class="wrap-1200">
		<div class="main-perset-con">
			<!-- ul列表 -->
	    	<ul class="nav nav-pills" role="tablist">
	    		<li role="presentation" class="active">
	    			<a href="#perset_mes" role="tab" data-toggle="tab">个人信息</a>
	    		</li>
	    		<li role="presentation">
	    			<a href="#perset_psw"  role="tab" data-toggle="tab">密码修改</a>
	    		</li>
	    		<li role="presentation">
	    			<a href="#perset_img"  role="tab" data-toggle="tab">更换头像</a>
	    		</li>
	    	</ul>
	    	<!--内容部分  -->
	    	<div class="tab-content">
	    		<!--个人信息-->
	    		<div role="tabpanel" class="tab-pane active" id="perset_mes">
                     <form id="infoForm">
                     	<div class="line">
                     		<label>用户名:</label>
							${sessionScope.user.username}
                     	</div>
						 <div class="line">
							 <label>昵称：</label>
							 <input type="text" name="nickname" value="${sessionScope.user.nickname}">
						 </div>
						 <div class="line">
							<label>个人简介:</label>
							 <input type="text" name="intro" value="${sessionScope.user.intro}">
						 </div>

                     	<div class="line">
							<button class="btn btn-sm btn-success" onclick="updateInfo()">保存</button>
                     	</div>
                     </form>
	    		</div>
	    		<!--密码修改-->
	    		<div role="tabpanel" class="tab-pane" id="perset_psw">
	    		     <form id="pwdForm" style="height:280px;">
	    		     	<div class="line">
                     		<label>原密码:</label>
                     		<input type="password" name="old"/>
                     	</div>
                     	<div class="line">
                     		<label>新密码:</label>
                     		<input type="password" name="newPWD"/>
                     	</div>
                     	<div class="line">
                     		<label>确认密码:</label>
                     		<input type="password" name="repeat"/>
                     	</div>
                     	<div class="line">
							<button class="btn btn-sm btn-success" onclick="updatePWD()">修改</button>
                     	</div>
	    		     </form>
	    		</div>
	    		<!--更换头像-->
	    		<div role="tabpanel" class="tab-pane" id="perset_img">
	    		    <form>
	    		    	<div class="line">
                     		<label>图片上传:</label>
                     		<input type="text" readonly value=" "  id="show_file_name" style="width:400px;"/>
                     		<button class="btn-visit" type="button" onclick="$('#file_text').click()">浏览···</button>
                     	</div>
                     	<div class="line" style="height:240px;">
                     		<img class="show-img-change" id="show_img" src="../images/user-img.jpg"/>
                     		<button class="btn btn-sm btn-info btn-submit" type="button" onclick="uploadDp()">上传图像</button>
                     	</div>
	    		    </form>
					<form id="uploadDpForm"
						  action="${pageContext.request.contextPath}/up/dp.html"
						  role="form" method="post" enctype="multipart/form-data">
						<input type="file" name="file" id="file_text" onchange="getFilename(this.value);javascript:setImagePreview('file_text','show_img');" style="display:none;">
					</form>
	    		</div>

	    	</div>
	    	<!--/内容部分  -->
		</div>
	</div>
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
<script>
	function uploadDp(){
		$('#uploadDpForm').ajaxSubmit({
			async:false,
			success: function (data) {
				if(typeof(data)!='object') data=JSON.parse(data);
				if(data&&data.success){
					alert('修改成功!');
					location.reload();
				}
				else
					alert(data.message);
			}
		});
	}

	function updateInfo(){
		$.ajax({
			async:false,
			type:'POST',
			data:$('#infoForm').serialize(),
			url:'${pageContext.request.contextPath}/user/updateInfo.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					alert('修改成功！');
				}else
					alert(data.message);
			}
		});
	}

	function updatePWD(){
		$.ajax({
			async:false,
			type:'POST',
			data:$('#pwdForm').serialize(),
			url:'${pageContext.request.contextPath}/user/updatePWD.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					alert('修改成功！');
				}else
					alert(data.message);
			}
		});
	}
</script>
</html>