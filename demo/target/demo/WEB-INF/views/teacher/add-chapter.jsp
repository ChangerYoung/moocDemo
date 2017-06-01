<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>章节管理</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/t-index.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery.form.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/t-index.js"></script>
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
			<a href="#"><img src="../images/logo.png" alt=""></a>
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
            <li><a href="${pageContext.request.contextPath}/home.html">我的课程</a> </li>
			<li><a href="${pageContext.request.contextPath}/teacher/addCourse.html">创建课程</a></li>
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
             		<strong>课程名 ${course.name }</strong>
             		<a href="#" title="创建新的章节" data-toggle="modal" data-target=".create-new-chapter" onclick="initChapter(0,0,'')"><i class="fa fa-plus-circle right"></i></a>
             	</h4>
                   <!-- 课程章节 -->
				 <c:forEach var="chapter" items="${chapters}">
					 <div class="c-chapter">
						 <h3>
							 <i class="fa fa-reorder left"></i>
							 <strong>第${chapter.number}章 ${chapter.name }</strong>
							 <i class="fa fa-chevron-circle-down right"></i>
							 <a href="#" title="编辑章节" data-toggle="modal" data-target=".create-new-chapter" onclick="initChapter(${chapter.id},${chapter.number},'${chapter.name}')"><i class="fa fa-pencil-square right"></i></a>
							 <a href="#" title="删除章节"><i class="fa fa-minus-circle right" onclick="deleteChapter(${chapter.id})"></i></a>
							 <a href="#" title="创建新的小节" data-toggle="modal" data-target=".create-new-subchapter" onclick="initSubChapter(0,${chapter.number},0,'','','')"><i class="fa fa-plus-circle right"></i></a>
						 </h3>
					 </div>
					 <ul class='c-chapter-list'>
						 <c:forEach var="subc" items="${chapter.subchapter}">
							 <li>
								 <a href="#" class="edit-c" title="编辑小节" data-toggle="modal" data-target=".create-new-subchapter" onclick="initSubChapter(${subc.id},${subc.number},${subc.subNum},'${subc.name}','${subc.content}','${subc.videoPath}')"><i class="fa fa-pencil-square right"></i></a>
								 <a href="#" class="delete-c" title="删除小节"><i class="fa fa-trash-o rihgt" onclick="deleteChapter(${subc.id})"></i></a>
								 <a href="#" class="main-c-link">${subc.number}.${subc.subNum} ${subc.name }</a>
							 </li>
						 </c:forEach>
					 </ul>
				 </c:forEach>
                   <!-- / 课程章节-->
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





<!-- 创建新章节 -->
<div class="modal fade create-new-chapter" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close btn-default" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">编辑章节</h4>
			</div>
			<form id="createChapterForm" style="width:800px;margin:20px auto;">
				<input type="hidden" name="id" value="0" id="cha-id">
				<input type="hidden" name="courseId" value="${course.id}">
				<input type="hidden" name="number" id="cha-num" value="0">
				<input type="hidden" name="subNum" value="0">
				<div class="line">
					<span>章节名</span>
					<input type="text" value="" name="name" id="cha-name" placeholder="请输入章节名">
				</div>
				<div class="line" style="text-align:right;">
					<input type="button" class="btn btn-sm btn-info" style="margin-right:30px;" value="保存" onclick="addChapter()">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- /创建新章节 -->
<!-- 修改章节信息 -->
<div class="modal fade create-new-subchapter" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close btn-default" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel2">编辑小节</h4>
			</div>
			<form id="createSubchapter" style="width:800px;margin:20px auto;">
				<input type="hidden" name="id" value="0" id="sub-id">
				<input type="hidden" name="courseId" value="${course.id}">
				<input type="hidden" name="number" value="0" id="sub-num">
				<input type="hidden" name="subNum" value="0" id="sub-subNum">
				<div class="line">
					<span>小节名</span>
					<input type="text" value="" name="name" id="sub-name" placeholder="请输入章节名">
				</div>
				<div class="line">
					<span>内容</span>
					<textarea name="content" id="sub-content" cols="30" rows="10"></textarea>
				</div>
				<div class="line">
					<span>视频</span>
					<input type="text" id="show_file_name" name="videoPath" style="width:300px;">
					<button class="btn-liulan" type="button" onclick="$('#file_wrap').click()">浏览···</button>
				</div>
				<div class="line" style="text-align:right;">
					<input type="button" class="btn btn-sm btn-info" style="margin-right:30px;" value="保存" onclick="addSubchapter()">
				</div>
			</form>
			<form id="uploadVideoForm"
				  action="${pageContext.request.contextPath}/up/video.html"
				  role="form" method="post" enctype="multipart/form-data">
				<input type="file" name="file" id="file_wrap" onchange="getFilename(this.value)" style="display:none;" >
			</form>
		</div>
	</div>
</div>

<!-- /修改章节信息 -->



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
	function getFilename(e){
		file_changed=true;
		$('#show_file_name').val(e);
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
			type:'POST',
			data:'id=' + id,
			url:'${pageContext.request.contextPath}/teacher/deleteChapter.html',
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