<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--	<%request.setCharacterEncoding("GBK");response.setCharacterEncoding("GBK");%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="http://localhost:8080/iDouBan/css/iconFont_Login/iconfont.css">
    <title>Login</title>
    <!-- 背景图片的设置 CSS  初始化css -->
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

        body {
            background-size: cover;
            background: #edf4ed url("http://localhost:8080/iDouBan/portrait/bg.jpg") no-repeat fixed center center;
            /*background: #edf4ed url("http://localhost:8080/iDouBan/image/user_img/test.png") no-repeat fixed center center;*/
        }

        a:link, a:visited { /*去掉下划线*/
            text-decoration: none;
        }
    </style>
</head>
<style type="text/css">
    /*绝对定位*/
    #login {
        margin: 0 auto;
        margin-top: 200px;
        padding: 20px 50px;
        background-color: #a2a2a290;
        width: 450px;
        height: 350px;
        border-radius: 10px;
        text-align: center;
    }

    /*登录标题*/
    #header_h1 {
        color: white;
        margin: 0 auto;
        margin-bottom: 30px;
    }

    /*对表单元素中的input的输入框进行统一格式处理*/
    /*对齐中长方形*/
    #uname, #upwd {
        margin: 0 auto;
        margin-bottom: 50px;
        border-radius: 15px;
        width: 200px;
        height: 42px;
        font-size: 14px;
        padding-left: 10px;

        border-style: none;
    }

    /*登录按钮的样式*/
    #entry {
        width: 260px;
        height: 42px;
        margin: 0 auto;
        outline: none;
        text-decoration: none;
        font-size: 14px;
        border: 0;
        border-radius: 0.625rem;
        background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
    }

    #entry:hover {
        background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
    }
    #uname:focus, #upwd:focus, #verify_code:focus {
        background: white;
        border: 1px solid grey;
    }

    /*验证码的输入框*/
    #verify_code {
        padding-left: 10px;
        margin-bottom: 10px;
        vertical-align: middle; /*input img同一行的方法*/
        outline: none;
        dipslay: inline-block;
        border-radius: 15px;
        text-decoration: none;
        border-style: none;
        width: 100px;
        height: 42px;
        color: black;
        font-size: 14px;
        border-color: white;
    }

    /*验证码图片*/
    #verify_pic {
        margin-bottom: 10px;
        outline: none;
        dipslay: inline-block;
        border-radius: 7px;
        text-decoration: none;
        border-style: none;
        width: 85px;
        height: 42px;
        vertical-align: middle;
    }

    /*验证码一行*/
    .verify_inner {
        dipslay: inline-block;
        margin-bottom: 10px;
        outline: none;
        border-radius: 3px;
        text-decoration: none;
        border-style: none;
        width: 300px;
        height: 42px;
        color: black;
        font-size: 14px;
    }

    /*设置换验证码按钮的位置*/
    #btn {
        margin-left: 5px;
        color: #220903;
        outline: none;
        border-radius: 3px;
        text-decoration: none;
        border-style: none;
        text-color: black;
        background-color: #edf4ed;
    }

    /*div的设置统一长方形方块*/
    .login_level {
        width: 350px;
        height: 50px;
        margin-left: 50px;
        center: center;
    }

    /*三个按钮*/
    #select {
        width: 350px;
        height: 30px;
        margin-left: 50px;
        center: center;
        flex: auto;

    }

    /*底部两个链接的位置*/
    #login_bottom_find {
        margin-left: 30px;
        border-style: none;
        width: 300px;
        height: 42px;
        font-size: 14px;
        color: white;
    }

    #login_bottom_sign {
        margin-left: 70px;
        border-style: none;
        width: 300px;
        height: 42px;
        font-size: 14px;
        color: white;
    }

</style>


<form action="/iDouBan/LoginServlet" method="post" id="login_form">
    <%-- <font color="red">${requestScope.message}</font> --%>
    <div id="login">
        <div><h1 id="header_h1">LOGIN</h1>
        </div>
        <!-- 登录的长方形界面框 -->
        <div id="name" class="login_level">
            <!-- 获取cookie中的对象的值 -->
            <span class="iconfont icon-zhanghao"></span>
            <input type="text" id="uname" name="uname" value="${cookie.uname.value}" placeholder="username">

        </div>
        <div id="pwd" class="login_level">

            <span class="iconfont icon-mima"></span>
            <input type="password" id="upwd" name="upwd" value="${cookie.upwd.value}" placeholder="password">

        </div>

        <!-- 验证码的输入框 + 验证码图片 -->
        <div id="verify" class="login_level">
            <!-- 验证码-->
            <div class="verify_inner">

                <span class="iconfont icon-yanzhengma" style="margin-left: 43px"></span>
                <input type="text" name="image" placeholder="code" id="verify_code">

                <img src="/iDouBan/VerifyCodeServlet" width="80" height="42" id="verify_pic">
            </div>
        </div>


        <div id="select">
            <label>
                <input type="checkbox" name="auto" id="auto"/>自动登录
            </label>
            <label>
                <input type="checkbox" name="remember" value="" id="remember"/>记住密码
            </label>
        </div>
        <div>
            <input type="button" onclick="check()" value="LOGIN" id="entry"/>
        </div>

        <div style="padding: 15px 0">
            <a href="http://localhost:8080/iDouBan/jsp/register.jsp" id="login_bottom_find">忘记密码</a>
            <a href="http://localhost:8080/iDouBan/jsp/register.jsp" id="login_bottom_sign">注册账号</a>
        </div>
        <!-- 表单输入数据给后台，返回的错误的消息提示功能 -->
        <div id="msg" class="login_level">
            <!-- 提示信息 -->
            <span  style="color: red; font-size:larger">${requestScope.errorMsg}</span>

        </div>


    </div>
</form>

<!--  自动登录按钮被点击后 非空判断  -->
<c:if test="${not empty cookie.auto.value}">
    <!-- 重定位到登陆界面 -->
    <c:redirect url="http://localhost:8080/iDouBan/jsp/alter.jsp"/>
</c:if>


<!-- JS代码-->
<script type="text/javascript">
    //检查用户输入是否为空
    function check() {
        var username = document.getElementById("uname")
        var password = document.getElementById("upwd")
        var code = document.getElementById("verify_code")
        if (username.value == "") {
            alert("请输入用户名")
        } else if (password.value == "") {
            alert("请输入密码")
        } else if (code.value == "") {
            alert("请输入验证码");
        } else {
            document.forms[0].submit()
        }
    }

    //按钮点击，更改验证码的图片 动态获取img元素----不用重定位或者转发，在原页面实现验证码图片的转化
    document.getElementById("verify_pic").onclick = function () {

        // 改变src，从而让浏览器发送请求到servlet
        //该方法先获取其标签img 再对应的是第一个标签（下标从0开始）
        //根据系统时间在点击之后改变验证码
        document.getElementsByTagName("img")[0].src =
            "/iDouBan/VerifyCodeServlet?time=" + new Date().getTime();
    };
</script>


</body>
</html>
