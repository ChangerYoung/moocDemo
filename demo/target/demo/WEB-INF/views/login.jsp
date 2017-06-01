<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%    
String path = request.getContextPath();    
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录注册页</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/base.css">
	<link rel="stylesheet" href="<%=path%>/static/css/login.css">

	<script src="<%=path%>/static/js/jquery.min.js"></script>
	<script src="<%=path%>/static/js/bootstrap.min.js"></script>
	<script>
		//$('#username').blur(checkUserName) ;
		//检查用户名是否存在
		function checkUserName(){
			//alert("ok");
			$.ajax({
	             type: "GET",
	             url: "getAllUsers",
	             data: {},
	             dataType: "json",
	             success: function(data){
	                         var text = "用户名合法！";
	                         var name = $("#username").val();
	                         $.each(data, function(ind, val){
	                        	 //alert(val.username+" "+name);
	                               if(val.username==name){
										text="用户名已存在！";
										//alert("用户名已存在！");
		                               }
	                         });
	                         $('#warning').html(text);
	                      }
	         });
			}
		//检查两次输入密码的一致性
		function checkPwd(){
				var text = "密码合法！";
				var p1 = $('#userpwd').val();
				var p2 = $('#userpwd2').val();
				if(p1!=p2){
					text = "两次输入密码不一致";
					}
				$('#warning_pwd').html(text);
			}
	</script>
</head>
<body>
<div class="login-header">
	<div class="wrap-1200">
		<a href="#"><img src="<%=path%>/static/images/logo.png" alt=""></a>
	</div>
</div>

<!-- login-content -->
<div class="login-content">
	<div class="wrap-1200">
		<div class="login-field">
		    <!-- 导航 -->
			<ul class="nav nav-pills nav-justified" id="loginNav" role="tablist">
               <li role="presentation" class="active">
                  <a href="#login_signIn" aria-controls="login_signIn" role="tab" data-toggle="tab">社区会员登录</a>
               </li>
               <li role="presentation">
                  <a href="#login_signUp" aria-controls="login_signUp" role="tab" data-toggle="tab">用户注册</a>
               </li>
           </ul>
           <!-- 内容部分 -->
           <div class="tab-content">
           	<!--登录-->
	           	<div role="tabpanel" class="tab-pane active" id="login_signIn">
	               <form action="studentlogin" method="post">
	               	 <div class="input_div">
	               	 	<i class="fa fa-user"></i>
	               	 	<input type="text" value="${username}" name="username" placeholder="请输入用户名">
	               	 </div>
	               	 <div class="input_div">
	               	 	<i class="fa fa-lock"></i>
	               	 	<input type="text" name="userpwd" value="${userpwd}" placeholder="请输入密码">
	               	 </div>
	                  <!-- 身份 -->
	                  <p class="radio-wrapper">
	                    <!-- <label class="radio-inline">身份</label> -->
	                    <label class="radio-inline">
	                      <input type="radio" name="usertype" value="0">学生
	                    </label>
	                    <label class="radio-inline">
	                      <input type="radio" name="usertype"  value="1"> 讲师
	                    </label>
	                    <label class="radio-inline">
	                      <input type="radio" name="usertype" value="2">管理员
	                    </label>
	                  </p>
	               	 <div class="input_line">
	               	 	<label>
	               	 	   <input type="checkbox"> 记住登录
	    			    </label>
	    				<a href="javascript:">忘记密码?</a>
	               	 </div>
	                 <button class="login-btn">登录</button>
	                 <label style="color: red;">${errorMessage}</label>
	               </form>
	           	</div>
           	<!--注册-->
           	<div role="tabpanel" class="tab-pane" id="login_signUp">
               <form action="register" method="post">
               	 <div class="input_div">
               	 	<i class="fa fa-user"></i>
               	 	<input id="username" type="text" name="username" placeholder="请输入用户名" onblur="checkUserName()">
               	 	<label id="warning" style="color:red;"></label>
               	 </div>
               	 <div class="input_div">
               	 	<i class="fa fa-lock"></i>
               	 	<input id="userpwd" type="text" name="userpwd" placeholder="请输入密码">
               	 </div>
               	 <div class="input_div">
               	 	<i class="fa fa-lock"></i>
               	 	<input id="userpwd2" type="text" name="userpwd2" placeholder="确认密码" onblur="checkPwd()">
               	 	<label id="warning_pwd" style="color:red;"></label>
               	 </div>
               	 <div class="input_div">
               	 	<i class="fa fa-envelope"></i>
               	 	<input type="text" value="" placeholder="邮箱">
               	 </div>
               	 <div class="input_div"  style="width:200px;">
               	 	<i class="fa fa-lock"></i>
               	 	<input type="text" value="" placeholder="请输入验证码" style="width:165px;">
               	 	<img src="<%=path%>/static/images/yanzheng.png" alt="">
               	 </div>
                 <button class="login-btn">注册</button>
               </form>
           	</div>
           </div>

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

		<li class="pull-right"><a href="#">讲师申请</a></li>
		<li class="pull-right"><a href="#">管理员登录</a></li>
	</ul>
	<p>备案号:1234567890123456789</p>
 </div>	
</div>	
<!-- /footer -->

</body>
</html>