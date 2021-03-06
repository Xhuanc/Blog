<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>账号管理</title>
    <link rel="icon" href="http://localhost:8080/iDouBan/image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 登录成功之后，进行个人信息的修改 -->
    <!-- 导航栏 -->
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/iDouBan/css/header.css">
    <style type="text/css">
        /*放置主要的页面内容*/
        #main_content {
            width: 1040px;
            height: 900px;
            border-radius: 15px;
            margin: auto 239.600px;
            background-color: rgba(255, 255, 255, 0.36);
            opacity: 1;
        }

        /*页面的主要布局*/
        #main_content-left-top {
            margin: 40px;
        }

        /*用户头像*/
        #userPicture {
            border-radius: 8px;
            width: 200px;
            height: 200px;
        }
		/*#blogLogo{*/

		/*	opacity: 1;*/
		/*	margin:0 10% 0 50%;*/
		/*}*/
        /*#second1 {*/
        /*    height: 80px;*/
        /*    overflow: hidden;*/
        /*    background-color: #ffffff;*/
        /*    margin-bottom: 10px;*/
        /*}*/

        #change_btn {
            /* 按钮美化 */
            width: 200px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }

        #change_btn:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }

        .basic_btn {
            /* 按钮美化 */
            width: 80px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
        }

        .intput_style {
            width: 320px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            padding: 5px;
            line-height: 20px;
            border-radius: 3px;
            font-size: 14px;
            font-family: "Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "  Microsoft Yahei", sans-serif;
            text-align: left;
        }
        #List input
        {
            margin:8px 0;
        }
    </style>
</head>


<!-- 个人信息的主页 -->
<body>
<!-- 顶部的菜单栏 -->
<nav id="first">
    <div id="first_menu">
        <!-- 跳到servlet，对用户的cookie进行注销 -->
        <a href="/iDouBan/ClearLoginServlet">退出登录</a>
        <!-- 相对于端口号的相对路径 -->
        <a href="/iDouBan/jsp/alter.jsp">账号管理</a>
        <a href="/iDouBan/jsp/my_page.jsp">个人主页</a>
        <a href="/iDouBan/DoumailServlet?method=my_doumail_list">我的邮箱</a>
        <a href="/iDouBan/FriendListServlet?method=blacklist_list">黑名单</a>
        <a href="/iDouBan/FriendListServlet?method=attention_list">我的关注</a>
<%--        <a href="/iDouBan/FriendListServlet?method=friend_list">我的好友</a>--%>
        <!-- 先跳转servlet 查询第一页的所有人信息 -->
        <a href="/iDouBan/EveryoneListServlet?method=everyone_list">所有人</a>
        <!-- 编辑文章 -->
        <a href="/iDouBan/jsp/article_edit.jsp" target="_blank">写文章</a>
        <a href="/iDouBan/ArticleListServlet?method=article_list">所有文章</a>
        <a href="/iDouBan/ArticleListServlet?method=my_article_list">我的文章</a>
        <a href="/iDouBan/ArticleListServlet?method=my_collection_list">我的收藏</a>
    </div>
</nav>

<!-- 显示主要内容的地方 -->
<div id="main_content">
    <div id="main_content-left">
        <!-- 放置个人头像和信息 -->
        <div id="main_content-left-top">
            <!-- 显示头像 -->
            <div>
                <%--											 TODO: 头像--%>
                欢迎您:${sessionScope.uname}<br/>

                <img src="${sessionScope.userInfo.portrait}" alt="我的头像" width="200" height="200"/><br/>
            </div>
            <!-- 用户更换头像 -->
            <div>
                <br/>
                <form action="http://localhost:8080/iDouBan/UploadServlet" method="post" enctype="multipart/form-data">
                    <input type="file" name="photo" value=""/><br><br/>
                    <input class="basic_btn" type="submit" name="修改" value="上传头像"/>
                </form>
                <br/>
            </div>

            <!-- 用作个人主页的信息展示 -->
            <div id="List">
                <form action="http://localhost:8080/iDouBan/MyPageServlet" method="post">
                    用户昵称 : <input type="text" class="intput_style" name="nickname"/><br/><br/>
                    个性签名 : <input type="text" class="intput_style" name="signature"/><br/><br/>
                    自我介绍 : <input type="text" class="intput_style" name="selfIntroduc"/><br/><br/>
                    用户地址 : <input type="text" class="intput_style" name="address"/><br/><br/>
                    <input id="change_btn" type="submit" value="修改">

                </form>
            </div>
        </div>
        <div id="main_content-left-centre">


        </div>
    </div>

    <div id="main_content-right">
    </div>
</div>
<br/>

</body>
</html>