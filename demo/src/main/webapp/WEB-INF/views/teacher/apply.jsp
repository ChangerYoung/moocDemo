<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>讲师申请页</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/login.css">

	<script src="../js/jquery.min.js"></script>
    <script src="../js/jquery.form.js"></script>
	<script src="../js/bootstrap.min.js"></script>
  <script src="../js/person-set.js"></script>
</head>
<body>
<div class="login-header">
	<div class="wrap-1200">
		<a href="#"><img src="../images/logo.png" alt=""></a>
	</div>
</div>

<!-- login-content -->
<div class="login-content tlogin-bg">
	<div class="wrap-1200">
       <form id="applyForm" class="tlogin-field">
         <div class="title">讲师申请</div>
         <div class="tline">
           <label for=""><i class="fa fa-user"></i>用户名</label>
           <input type="text" name="username" placeholder="请登录后进行操作"
                  value="${sessionScope.user.username }" readonly>
         </div>
         <div class="tline">
           <label for=""><i class="fa fa-user"></i>真实姓名</label>
           <input type="text" name="realname" placeholder="请输入真实姓名">
         </div>
         <div class="tline">
           <label for=""><i class="fa fa-envelope-o"></i>邮箱</label>
           <input type="text" name="email" placeholder="请输入邮箱">
         </div>
         <div class="tline">
           <label for=""><i class="fa  fa-edit"></i>证件号</label>
           <input type="text" name="cardId" placeholder="请输入证件号">
         </div>
         <div class="tline">
           <label for=""><i class="fa fa-phone-square"></i>手机号</label>
           <input type="text" name="phone" placeholder="请输入手机号">
         </div>
         <div class="tline">
           <label for=""><i class="fa fa-building-o"></i>曾工作单位</label>
           <input type="text" name="company" placeholder="请输入曾工作单位">
         </div>
         <div class="tline">
           <label for=""><i class="fa fa-map-marker"></i>居住地</label>
           <input type="text" name="address" placeholder="请输入现居住地">
         </div>
         <div class="tline">
           <label for=""><i class="fa  fa-flag-o "></i>最高学历</label>
           <select name="education" id="">
             <option value="1">博士</option>
             <option value="2">硕士</option>
             <option value="3">本科</option>
             <option value="4">专科</option>
             <option value="5">高中</option>
           </select>
         </div>
         <div class="tline">
           <label for=""><i class="fa  fa-paperclip"></i>附件上传</label>
           <input type="text" id="show_file_name" name="cardPic" readonly style="width:180px;margin-right:20px;">
           <button class="btn-liulan" type="button" onclick="$('#file_wrap').click()">浏览···</button>
         </div>
         <div class="tline">
             <input type="button" class="btn-apply" value="申请" onclick="aplly()">
         </div>
           <input type="hidden" name="userId" value="${sessionScope.user.id }">
           <input type="hidden" name="id" value="${sessionScope.userInfo.id }">
       </form>
	</div>
    <form id="uploadPicForm"
          action="${pageContext.request.contextPath}/up/pic.html"
          role="form" method="post" enctype="multipart/form-data">
        <input type="file" name="file" id="file_wrap" onchange="getFilename(this.value)" style="display:none;" >
    </form>
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
<script>
    var file_changed=false;
    function getFilename(e){
        file_changed=true;
        $('#show_file_name').val(e);
    }
    function uploadPic(){
        var ret=false;
        $('#uploadPicForm').ajaxSubmit({
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

    function aplly(){
        if(file_changed) {
            var tmp = uploadPic();//reportUrl
            if (tmp == false) {
                return false;
            }
        }
        file_changed=false;

        $.ajax({
            async:false,
            type:'POST',
            data:$('#applyForm').serialize(),
            url:'${pageContext.request.contextPath}/teacher/apply.html',
            success:function(data){
                if(typeof(data)!="object") data=JSON.parse(data);
                if(data&&data.success){
                    alert("申请成功，请耐心等待审核通过。")
                    window.location.href='${pageContext.request.contextPath}/logout.html';
                }else
                    alert("保存失败！");
            }
        });
    }
</script>
</html>