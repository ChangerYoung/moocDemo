<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/login.css">

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="login-header">
    <div class="wrap-1200">
        <a href="#"><img src="../images/logo.png" alt=""></a>
    </div>
</div>

<!-- login-content -->
<div class="login-content mlogin-bg">
    <div class="wrap-1200">
        <div class="login-field login-field-modi">
            <h4>管理员登录</h4>
            <!-- 内容部分 -->
            <!--登录-->
            <div class="tab-content">
                <form action="${pageContext.request.contextPath}/administrator/a-index.html" method="post">
                    <div class="input_div">
                        <i class="fa fa-user"></i>
                        <input type="text" value="" placeholder="请输入用户名" name="username">
                    </div>
                    <div class="input_div">
                        <i class="fa fa-lock"></i>
                        <input type="password" value="" placeholder="请输入密码" name="password">
                    </div>
                    <div class="input_line">
                        <label>
                            <input type="checkbox"> 记住登录
                        </label>
                        <a href="javascript:">忘记密码?</a>
                    </div>
                    <button class="login-btn">登录</button>
                </form>
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

            <li class="pull-right"><a href="${pageContext.request.contextPath}/teacher/apply.html">讲师申请</a></li>
            <li class="pull-right"><a href="${pageContext.request.contextPath}/administrator/a-index.html">管理员登录</a></li>
        </ul>
        <p>备案号:1234567890123456789</p>
    </div>
</div>
<!-- /footer -->
</body>
</html>