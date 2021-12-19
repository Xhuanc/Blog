<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的好友</title>
    <link rel="icon" href="http://localhost:8080/iDouBan/image/icon/iDouBan_favicon.ico" type="image/x-icon">

    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- 显示我的好友的页面 -->
    <style type="text/css">
        /*样式初始化*/
        * {
            margin: 0;
            padding: 0; /*清除内外边距*/
        }

        ul {
            list-style: none; /*去掉列表中的样式的小点*/
        }

        .clearfix:before, .clear:after { /*清除浮动*/
            display: table;
            content: "";
        }

        .clearfix:after {
            clear: both;
        }

        .clearfix {
            *zoom: 1;
        }

        a {
            color: #FFFFFF;
            text-decoration: none; /*取消下划线*/
        }

        input {
            border: 0; /*将input的边框改为0*/
            box-sizing: border-box; /*CSS3盒子模型 border和padding都包含到width中*/

        }

        body {
            /*background-image: url("../image/BackgroundPicture.jpg");*/
            background-image: url("http://localhost:8080/iDouBan/image/BackgroundPicture.jpg");
            background-repeat: repeat-y;
        }

        /*顶部的导航栏*/
        /*顶部的导航栏*/
        #first_menu {
            display: flex;
            flex-direction: row-reverse;
            align-items: center;
            justify-content: space-around;
            height: 50px;
            background-color: rgba(255, 255, 255, 0.56);
            border-radius: 8px;
        }

        #first_menu a {
            font-family: Gabriola; /*字体*/
            color: rgba(0, 0, 0, 0.58);
            text-decoration: none; /*取消下划线*/
            padding: 14px 20px; /*上下是8，左右是15*/
            height: 7px;
            line-height: 5px; /*行高等于高度可以文字垂直居中*/
            text-align: center;
        }

        #first_menu a:hover { /*鼠标经过a链接*/
            background-color: rgba(0, 0, 0, 0.58);
            border-radius: 5px;
        }

        /*带有图标的第二个导航栏*/
        header {
            height: 74px;
            /* background-color:pink; */
            overflow: hidden; /*防止外边距合并的问题*/
            background-color: #ffffff; /*设置背景颜色*/
        }

        #second {
            width: 1000px;
            height: 50px;
            margin-top: 25px;
            margin-bottom: 25px;
            margin-left: 240px;
            background-color: rgba(255, 255, 255, 0.56);
            opacity: 0.9;
            border-radius: 8px;
        }


        /*导航栏的选项*/
        .navbar {
            float: left;
            height: 30px;
            line-height: 30px; /*行高会继承 父类*/
            /*margin-left: 260px; !*设置外边距*!*/
            margin-top: 10px;
            opacity: 1;
        }

        /*导航栏中的具体选项*/
        .navbar li {
            float: left; /*使排列成一行*/
        }

        .navbar li a {
            color: rgba(0, 0, 0, 0.58);
            text-decoration: none; /*取消下划线*/
            padding: 0 15px; /*上下是0，左右是15*/
            display: inline-block; /*显示成盒子大小*/
            border-radius: 6px;
        }

        .navbar li a:hover { /*鼠标经过a链接*/
            background-color: rgba(0, 0, 0, 0.58); /*显示的颜色*/
        }

        /*搜索框外框部分--用来使搜索框排列在一行*/
        .search {
            float: right;
            height: 30px;
            line-height: 30px; /*行高会继承 父类*/
            margin-left: 50px; /*与左边的logo相距50个像素*/
            margin-top: 10px; /*与顶部边相距15个像素*/
            margin-right: 30px;
            border-style: none;

        }

        /*搜索栏*/
        .search input[type=text] { /*选择type属性为text的文本框,无搜索键*/
            width: 249px;
            height: 30px;
            padding-left: 15px; /*搜索框中的文字与左保持20px距离*/

            float: left;
            border-top-left-radius:6px;
            border-bottom-left-radius:6px;
        }

        .search input[type=submit] { /*搜索的按钮*/
            width: 31px;
            height: 30px;
            float: left;
            /*搜素按钮的图片*/
            background: #FFFFFF url("http://localhost:8080/iDouBan/image/01.png") center center no-repeat;
            background-size: 15px 15px;
            border-top-right-radius:6px;
            border-bottom-right-radius:6px;
        }

        /*放置主要的页面内容*/
        #main_content {
            width: 1040px;
            height: 900px;
            border-radius: 15px;
            margin: auto 239.600px;
            background-color: rgba(255, 255, 255, 0.36);
            opacity: 1;
            padding: 20px;
            float: left;
        }

        /*我关注的人的信息*/
        .users_info_list {
            width: 1040px;
            height: 80px;
            background-color: #ffffff;
            margin-left: 0px;
            padding-buttom: 5px;
            border: 1px solid yellow; /*设置边框边界的大小和颜色*/

        }

        /*其他人的头像*/
        #everyone_list_portrait {
            margin-top: 10px;
            margin-buttom: 10px;
            margin-left: 5px;
        }

        /*使得两个div在同一行*/
        #everyone_list_img {
            float: left;
        }

        /*我关注的人的基本信息*/
        #everyone_list_info {
            float: left;
        }

        /*发送豆邮的按钮*/
        #send_doumail {
            height: 30px;
            float: right;
            margin-right: 25px;
            margin-top: 37px;
        }

        /*用户操作的按钮*/
        #everyone_list_operation {
            margin-right: 24px;
            margin-top: 37px;
            float: right;
        }

        /*--昵称和个性签名*/
        #everyone_list_nickname {
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;

            color: #072;

        }

        #everyone_list_signature {
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;

            color: #072;
        }

        /*用户操作超链接*/
        .operation {
            color: black;
        }

        /*分页选项的布局*/
        #paging {
            float: right;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-right: 50px;
        }

        /*分页的文字说明*/
        #page_number {
            margin-right: 20px;
        }

        /*分页的超链接*/
        .page_contrller {
            color: black;
        }

        /*好友分组的选择*/
        #friend_grouping {
            width: 400px;
            height: 80px;
            float: right;
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
        <a href="/iDouBan/FriendListServlet?method=friend_list">我的好友</a>
        <!-- 先跳转servlet 查询第一页的所有人信息 -->
        <a href="/iDouBan/EveryoneListServlet?method=everyone_list">所有人</a>
        <!-- 编辑文章 -->
        <a href="/iDouBan/jsp/article_edit.jsp" target="_blank">写文章</a>
        <a href="/iDouBan/ArticleListServlet?method=article_list">所有文章</a>
        <a href="/iDouBan/ArticleListServlet?method=my_article_list">我的文章</a>
        <a href="/iDouBan/ArticleListServlet?method=my_collection_list">我的收藏</a>
    </div>
</nav>
<!-- 第二个导航栏 -->
<header id="second">
    <nav id="second_menu">
        <!-- 导航栏部分_可选择部分 -->
        <div class="navbar">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="/iDouBan/jsp/my_page.jsp">个人主页</a></li>
                <li><a href="/iDouBan/ArticleListServlet?method=article_list">浏览发现</a></li>
            </ul>
        </div>
        <!-- 搜索框部分 -->
        <div class="search">
            <form action="FriendListServlet?method=search_friend&currentPage=1" id="search_action" method="post">
                <!-- placeholder占位符 -->
                <input type="text" name="search_content" id="search_content" placeholder="搜索你感兴趣的内容和人">
                <!-- placeholder--默认显示值 -->
                <input type="submit" value="">
            </form>
        </div>
    </nav>
</header>
<!-- 显示主要内容的地方 -->
<div id="main_content">
    <div id="main_content-left">
        <!-- 放置个人头像和信息 -->
        <div id="main_content-left-top">
            <div>
                <h1 style="margin-bottom: 20px;">我的好友</h1>
            </div>
            <!-- 好友分组操作 -->
            <div style="height: 40px;">

                <div>
                    <!-- 默认全部 -->
                    <a href="/iDouBan/FriendListServlet?method=friend_list" style="color:black">
                        全部
                    </a>
                    <!-- 自定义分组 -->
                    <c:forEach items="${requestScope.groupNames}" var="g">
                        <!-- 每一项的显示 -->
                        <a href="FriendListServlet?method=search_friend_group&search_content=${g}&currentPage=1"
                           style="color:black">
                                ${g}
                        </a>
                    </c:forEach>
                </div>


            </div>

            <!-- 展示我关注的人的信息列表 --分页列表---包含模糊搜索的功能-->
            <div>

                <c:forEach items="${requestScope.p.objects}" var="u">
                    <!-- 每一行的显示 -->
                    <div class="users_info_list">
                        <!--我关注的人的头像 -->
                        <div id="everyone_list_img">
                            <img alt="用户头像" src="${u.portrait}" width=60px height=60px id="everyone_list_portrait">
                        </div>
                        <!--我关注的人的昵称和个性签名  -->
                        <div id="everyone_list_info">
                            <p id="everyone_list_nickname">${u.nickname} </p>
                            <p id="everyone_list_signature">${u.signature}</p>
                        </div>
                        <!-- 豆邮的发送功能 -->
                        <div id="send_doumail">
                            <!-- 跳转到豆邮的详情---所有有关双方的豆邮 -->
                            <a href="/iDouBan/DoumailServlet?method=doumail_show&to_user_id=${u.userId}&nickname=${u.nickname}"
                               target="_blank" style="color:black">
                                发送邮件
                            </a>
                        </div>
                        <!-- 用户具体操作 -->
                        <div id="everyone_list_operation">
                            <a href="FriendListServlet?pre_method=black_on_record&method=friend_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}"
                               class="operation">取消关注</a>
                            <a href="FriendListServlet?pre_method=black_on_record&method=friend_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}"
                               class="operation">拉黑</a>
                        </div>
                        <!-- 用户选择分组的操作 -->
                        <div id="friend_grouping">
                            <div>
                                <!-- 只能选一个的单选框 -->
                                <select id="groups-selectbox">
                                    <option>${requestScope.groupNames}</option>

                                </select>
                            </div>
                            <!-- input标签 -->
                            <div>
                                <!-- 							 				<form action="FriendListServlet?method=search_friend_group&currentPage=1">
                                                                                <input type = "text" name="" value="" placeholder="学习">
                                                                                <input type="submit" >确认
                                                                            </form>	 -->
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>

            <!-- 分页选择链接 -->
            <c:if test="${requestScope.p.totalPage!=0}">
                <div id="paging">

                    <a href="FriendListServlet?method=${requestScope.method}&currentPage=1" id="first_page"
                       class="page_contrller">首页</a>
                    <!-- 利用el表达式的三目运算符进行判断 -->
                    <a href="FriendListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}"
                       id="pervious_page" class="page_contrller">上一页</a>
                    <a href="FriendListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}"
                       id="next_page" class="page_contrller">下一页</a>
                    <a href="FriendListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}"
                       id="last_page" class="page_contrller">尾页</a>
                    <span id="page_number">
									当前第 ${requestScope.p.currentPage?requestScope.p.currentPage:0} 页，总共 ${requestScope.p.totalPage?requestScope.p.totalPage:0} 页
									</span>
                </div>
            </c:if>

        </div>
        <div id="main_content-left-centre">


        </div>
    </div>

    <div id="main_content-right">
    </div>
</div>
<script type="text/javascript">
    //动态改变其单选框的值
</script>
</body>
</html>