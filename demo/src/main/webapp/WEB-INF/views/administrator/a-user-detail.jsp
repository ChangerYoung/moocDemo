<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息详细</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/fontAwesome/font-awesome.min.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/m-index.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>

<div class="m-header">
    <div class="logo-field">
        <a href="#"><img src="../images/logo.png" alt=""></a>
    </div>
    <ul>
        <li><a href="#"><i class="fa fa-power-off"></i>退出登录</a></li>
        <li><a href="#">欢迎来到后台管理系统</a></li>
    </ul>
</div>

<div class="m-sidebar">
    <ul>
        <li><a href="#"><i class="fa fa-home"></i>首页</a></li>
        <li><a href="#"><i class="fa fa-th-large"></i>用户管理</a></li>
        <li><a href="#"><i class="fa fa-dashboard"></i>讲师管理</a></li>
        <li><a href="#"><i class="fa fa-folder-open"></i>课程管理</a></li>
    </ul>
</div>

<div class="m-content">
    <!-- 路径导航 -->
    <ol class="breadcrumb">
        <li><i class="fa fa-flag"></i></li>
        <li><a href="#">首页</a></li>
        <li><a href="#">用户管理</a></li>
        <li><a href="#">用户列表</a></li>
        <li class="active">用户信息详细</li>
    </ol>
    <!-- /路径导航 -->
    <div class="control-bar">
        <span>用户详细信息</span>
    </div>
    <!-- 内容部分 -->
    <div class="m-content-field">
        <!-- 导航部分 -->
        <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active">
                <a href="#m_pertro" aria-controls="m_pertro" role="tab" data-toggle="tab">用户介绍</a>
            </li>
            <li role="presentation">
                <a href="#m_classLearn" aria-controls="m_classLearn" role="tab" data-toggle="tab">学习课程</a>
            </li>
            <li role="presentation">
                <a href="#m_classConcern" aria-controls="classConcern" role="tab" data-toggle="tab">关注课程</a>
            </li>
            <li role="presentation">
                <a href="#m_perConcern" aria-controls="m_perConcern" role="tab" data-toggle="tab">我的关注</a>
            </li>
            <li role="presentation">
                <a href="#m_perFans" aria-controls="m_perFans" role="tab" data-toggle="tab">我的粉丝</a>
            </li>
        </ul>
        <!-- /导航部分 -->
        <!--内容部分  -->
        <div class="tab-content">
            <!--用户介绍-->
            <div role="tabpanel" class="tab-pane active" id="m_pertro">
                <div class="intro">
                    <div class="left"><img src="../images/user-img.jpg" alt=""></div>
                    <div class="right">
                        <h3>木木和弦<small>108</small></h3>
                        <p>过春风十里，尽荞麦青青</p>
                    </div>
                </div>
            </div>
            <!--学习课程-->
            <div role="tabpanel" class="tab-pane" id="m_classLearn">
                <table class="table">
                    <thead>
                    <tr>
                        <td>课程名</td>
                        <td>讲师</td>
                        <td>方向</td>
                        <td>章节</td>
                        <td>状态</td>
                        <td>详情</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>微信开发</td>
                        <td><a href="#">木木和弦</a></td>
                        <td>前端开发</td>
                        <td>10</td>
                        <td>更新中</td>
                        <td>
                            <button class="btn btn-info btn-xs">查看</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--关注课程-->
            <div role="tabpanel" class="tab-pane" id="m_classConcern">
                <table class="table">
                    <thead>
                    <tr>
                        <td>课程名</td>
                        <td>讲师</td>
                        <td>方向</td>
                        <td>章节</td>
                        <td>状态</td>
                        <td>详情</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>微信开发</td>
                        <td><a href="#">木木和弦</a></td>
                        <td>前端开发</td>
                        <td>10</td>
                        <td>更新中</td>
                        <td>
                            <button class="btn btn-info btn-xs">查看</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--我的关注-->
            <div role="tabpanel" class="tab-pane" id="m_perConcern">
                <table class="table">
                    <thead>
                    <tr>
                        <td>用户名</td>
                        <td>角色</td>
                        <td>等级</td>
                        <td>备注</td>
                        <td>详情</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>木头</td>
                        <td>用户</td>
                        <td>108</td>
                        <td></td>
                        <td>
                            <button class="btn btn-info btn-xs">查看</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--我的粉丝-->
            <div role="tabpanel" class="tab-pane" id="m_perFans">
                <table class="table">
                    <thead>
                    <tr>
                        <td>用户名</td>
                        <td>角色</td>
                        <td>等级</td>
                        <td>备注</td>
                        <td>详情</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>木头</td>
                        <td>讲师</td>
                        <td>108</td>
                        <td></td>
                        <td>
                            <button class="btn btn-info btn-xs">查看</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /内容部分  -->
    </div>

    <!-- /内容部分 -->


</div>

</body>
</html>