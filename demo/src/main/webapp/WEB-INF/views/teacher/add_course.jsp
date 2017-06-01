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
Integer teacher_id = (Integer)session.getAttribute("userid");
	if(username==null){
		response.sendRedirect("login");
	}
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>创建课程</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/base.css">
 	<link rel="stylesheet" href="<%=path%>/static/css/index.css">
	<link rel="stylesheet" href="<%=path%>/static/css/t-index.css">
	<script src="<%=path%>/static/js/jquery.min.js"></script>
	<script src="<%=path%>/static/js/jquery.form.js"></script>
	<script src="<%=path%>/static/js/bootstrap.min.js"></script>
	<script src="<%=path%>/static/js/t-index.js"></script>
</head>
<body>
<!-- header-nav -->
<div class="header-nav">
    <div class="wrap-1200">
        <div class="welcome-title">欢迎来到study-online</div>
        <ul>
            <c:if test="${username != null}">
                <li class="udown-tip">
                    <a href="javascript:void(0)">我的</a>
                    <div class="udown-message">
                        <!-- top -->
                        <div class="udown-top">
                            <div class="left">
                                <a href="${pageContext.request.contextPath}/home.html"><img src="<%=path%>/static/images/user-img.jpg" alt=""></a>
                            </div>
                            <div class="right">
                                <div class="head">
                                    <p>好好学习，天天向上</p>
                                </div>
                            </div>
                        </div>
                        <!-- bottom -->
                        <div class="udown-bottom">
                            <a href="${pageContext.request.contextPath}/user/set.html" class="per-set"><i class="fa fa-gear"></i>个人设置</a>
                            <a href="${pageContext.request.contextPath}/logout" class="login-out"><i class="fa fa-power-off"></i>退出系统</a>
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
            <li><a href="${pageContext.request.contextPath}/course/toMyCourse">我的课程</a> </li>
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
			<!-- step1 -->
         <div class="step">
             <div class="content">
                <form id="courseForm" class="form-step1" action="${pageContext.request.contextPath}/course/addCourse" method="post">
                   <h4>创建/更新课程</h4>
                    <input type="hidden" name="courseid" value="${course.courseid}">
                    <input type="hidden" name="courseteacherid" value="<%=teacher_id%>">
                   <div class="line">
                      <span>课程名</span>
                      <input type="text" name="coursename" value="${course.coursename}" placeholder="请输入课程名">
                   </div>
                   <div class="line">
                      <span>课程方向</span>
                      <select name="coursetype" id="">
                              <option value="0">前端</option>
                              <option value="1">后台</option>
                              <option value="2">android</option>
                              <option value="3">ios</option>
                      </select>
                   </div>
                   <div class="line">
                      <span>课程介绍</span>
                      <textarea name="description" cols="30" rows="10">${course.description}</textarea>
                   </div>
                   <div class="line">
                      <span>封面图片</span>
                      <input type="text" id="show_file_name" name="picurl" value="${course.picurl}" style="width:300px;">
                      <button class="btn-liulan" type="button" onclick="$('#file_wrap').click()">浏览···</button>
                      <input type="button"  class="btn-liulan" name="uploadButton" id="uploadButton" style="" value="提交" />
                      <label id="warning"></label>	
                   </div>
                   <div class="line">
                       <input type="submit" class="btn btn-sm btn-info pull-right" style="margin-right:30px;" value="发布" >
                   </div>

                </form>

                 <form id="uploadPicForm"
                       action="${pageContext.request.contextPath}/upload/fileUpload"
                       role="form" method="post" enctype="multipart/form-data" >
                     <input type="file" name="file" id="file_wrap" onchange="getFilename(this.value)" style="display:none;" >
                 	 <input type="button" name="uploadButton" id="uploadButton" style="" value="提交" type="hidden"/>	
                 </form>
             </div>
         </div>
         <!-- /step1 -->
		</div>
	</div>
</div>
<!-- /tclass -->


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
    var file_changed=false;
    function getFilename(e){
        file_changed=true;
        $('#show_file_name').val(e);
        //选择图片完成后上传
        //uploadPic();
    }
    //异步提交文件
    $(function () { 
		//上传图片 
		$("#uploadButton").click(function () { 
			if ($("#file_wrap").val() == "") { 
				alert("请选择一个图片文件，再点击上传。"); 
				return; 
			} 
			$('#uploadPicForm').ajaxSubmit({
				type:"post",  //form 的method方法
				contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
				success:function(data){  //表单提交成功后执行的函数
					alert("执行成功！");
				}
		}); 
			alert("提交成功！");
	}); 
}); 
    
</script>
</html>