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
	<title>章节管理</title>
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
			<c:if test="${user != null}">
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
								<p>好好学习，天天向上</p>
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
            <li><a href="${pageContext.request.contextPath}/course/toMyCourse">我的课程</a> </li>
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
			<!-- step1 -->
         <div class="step">
             <div class="content">
             	<h4>
             		<strong>课程名： ${course.coursename}</strong>
             		<a href="#" title="创建新的章节" data-toggle="modal" data-target=".create-new-chapter" onclick="initChapter(0,0,'')"><i class="fa fa-plus-circle right"></i></a>
             	</h4>
                <h5 style="text-align:center;">已有章节</h5>
				 <c:forEach var="coursedetail" items="${coursedetails_list}" varStatus="status">
					 <div class="c-chapter">
					 	<input type="hidden" name="classid" value="${coursedetail.classid}" />
							 <h3>
							 <i class="fa fa-reorder left"></i>
							 <strong>第${status.count}章 </strong>
							 <i class="fa fa-chevron-circle-down right"></i>
							 <a href="#" title="编辑章节" data-toggle="modal" data-target=".create-new-chapter" onclick="initChapter(${chapter.id},${chapter.number},'${chapter.name}')"><i class="fa fa-pencil-square right"></i></a>
							 <a href="#" title="删除章节"><i class="fa fa-minus-circle right" onclick="deleteChapter(${coursedetail.classid})"></i></a>
						 </h3>
					 </div>
				 </c:forEach>
                   <!-- / 课程章节-->
             </div>
         </div>
         <!-- /step1 -->
		</div>
	</div>
</div>

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





<!-- 创建新章节 -->
<div class="modal fade create-new-chapter" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close btn-default" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">增加章节</h4>
			</div>
			<form id="createSubchapter" style="width:800px;margin:20px auto;" action="${pageContext.request.contextPath}/courseDetail/addChapter">
				<input type="hidden" name="courseid" value="${course.courseid}">
				
				<div class="line">
					<span>视频</span>
					<input type="text" id="show_file_name_video" name="videourl" style="width:300px;">
					<button class="btn-liulan" type="button" onclick="$('#file_wrap_video').click()">浏览···</button>
				</div>
				<div class="line">
					<span>ppt</span>
					<input type="text" id="show_file_name_ppt" name="ppturl" style="width:300px;">
					<button class="btn-liulan"  type="button" onclick="$('#file_wrap_ppt').click()">浏览···</button>
				</div>
				<div class="line" style="text-align:right;">
					<input type="button" id="button_upload" class="btn btn-sm btn-info" style="margin-right:30px;" value="上传" >
				</div>
				<div class="line" style="text-align:right;">
					<input type="submit" class="btn btn-sm btn-info" style="margin-right:30px;" value="保存" >
				</div>
			</form>
			<form id="uploadVideoForm"
				  action="${pageContext.request.contextPath}/upload/uploadVideoAndPPT"
				  role="form" method="post" enctype="multipart/form-data">
				<input type="file" name="video" id="file_wrap_video" onchange="getFilenameOfVideo(this.value)" style="display:none;" >
				<input type="file" name="ppt" id="file_wrap_ppt" onchange="getFilenameOfPPT(this.value)" style="display:none;" >
			</form>
		</div>
	</div>
</div>

<!-- /创建新章节 -->

</body>
<script>
	function initChapter(id, num, name) {
		$("#cha-id").val(id);
		$("#cha-num").val(num);
		$("#cha-name").val(name);
	}
	function initSubChapter(id, num, subNum, name, content, file) {
		$("#sub-id").val(id);
		$("#sub-num").val(num);
		$("#sub-subNum").val(subNum);
		$("#sub-name").val(name);
		$("#sub-content").val(content);
		$("#show_file_name").val(file);
	}
	var file_changed=false;
	function getFilenameOfVideo(e){
		file_changed=true;
		$('#show_file_name_video').val(e);
	}
	function getFilenameOfPPT(e){
		file_changed=true;
		$('#show_file_name_ppt').val(e);
	}
	function addChapter(){
		$.ajax({
			async:false,
			type:'POST',
			data:$('#createChapterForm').serialize(),
			url:'${pageContext.request.contextPath}/teacher/saveChapter.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					location.reload();
				}else
					alert("保存失败！");
			}
		});
	}

	function uploadVideo(){
		var ret=false;
		$('#uploadVideoForm').ajaxSubmit({
			async:false,
			success: function (data) {
				if(typeof(data)!='object') data=JSON.parse(data);
				if(data&&data.success){
					$('#show_file_name').val(data.data);
					console.log(data.data,data.success,data.message);
					ret=true;
				}
				else
					alert(data.message);
			}
		});
		return ret;
	}

	function addSubchapter(){
		if(file_changed) {
			var tmp = uploadVideo();//reportUrl
			if (tmp == false) {
				return false;
			}
		}
		file_changed=false;

		$.ajax({
			async:false,
			type:'POST',
			data:$('#createSubchapter').serialize(),
			url:'${pageContext.request.contextPath}/teacher/saveChapter.html',
			success:function(data){
				if(typeof(data)!="object") data=JSON.parse(data);
				if(data&&data.success){
					location.reload();
				}else
					alert("保存失败！");
			}
		});
	}

	function deleteChapter(id){
		$.ajax({
			async:false,
			type:'GET',
			dataType:"json",
			url:'${pageContext.request.contextPath}/courseDetail/deleteChapter?classid='+id,
			success:function(data){
					alert("删除成功！");
					location.reload();
			},
			error:function(data){
					alert("删除失败！");
				}
		});
	}

	$(function () { 
		//上传图片 
		$("#button_upload").click(function () { 
			if ($("#file_wrap_video").val() == "") { 
				alert("请选择一个视频文件，再点击上传。"); 
				return; 
			}
			if ($("#file_wrap_ppt").val() == "") { 
				alert("请选择一个ppt文件，再点击上传。"); 
				return; 
			} 
			alert("开始上传");
			$('#uploadVideoForm').ajaxSubmit({
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