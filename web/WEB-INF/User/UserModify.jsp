<%@ page import="com.movie.model.UserMainModel" %>
<%@ page import="com.movie.Dao.UserDao" %>
<%@ page import="com.movie.Dao.impl.UserDaoImpl" %>
<%@ page import="com.movie.Dao.UserMainDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录修改</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <link rel="stylesheet" href="../../css/style.css?v=1">
    <%--字体样式--%>
    <link rel="stylesheet" href="../../css/colors.css?v=1">

    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../../css/768.css?v=1">
    <%--动画效果--%>
    <script src="../../js/modernizr.custom.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script type="text/javascript" src="../../js/modernizr.min.js"></script>
</head>
<%
    UserMainModel user = null;
    if(request.getParameter("id")!=null){
        UserMainDao dao = new UserMainDao();
        user = dao.query(Integer.parseInt(request.getParameter("id")));
    }
%>
<body class="clearfix with-menu with-shortcuts">
<header role="banner" id="title-bar">
    <h2>电影院管理系统</h2>
</header>

<ul id="shortcuts" class="children-tooltip tooltip-right">
    <li><a href="/MovieMain" class="shortcut-dashboard" title="Movie">Movie</a></li>
    <li><a href="/HallMain" class="shortcut-messages" title="Hall">Hall</a></li>
    <li><a href="/PlayMain" class="shortcut-agenda" title="Play">Play</a></li>
    <li><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li class="current"><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<div class="main-wrap">
    <div class="crumb-wrap">
    </div>
    <div class="result-wrap">
        <form action="UserMainServle?method=2" method="post" id="myform" name="myform">
            <div class="config-items">
                <hgroup id="main-title" class="thin">
                    <h1 style="font-size: 20px">用户添加</h1>
                </hgroup>
                <div class="result-content">
                    <table width="100%" class="insert-tab">
                        <tbody><tr>
                            <th width="15%"><i class="require-red">*</i>编号：</th>
                            <td><input style="height: 28px" type="text"  value="<%=user.getId()%>" size="85" name="id" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>用户名：</th>
                            <td><input style="height: 28px" type="text" id="" value="<%=user.getName()%>" size="85" name="name" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>密码：</th>
                            <td><input style="height: 28px" type="text" value="<%=user.getPassword()%>" size="85" name="password" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>权限：</th>
                            <td><input style="height: 28px" type="text" value="<%=user.getLevel()%>" size="85" name="level" class="common-text"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input type="submit" value="修改" class="btn btn-primary btn6 mr10">
                                <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
                            </td>
                        </tr>
                        </tbody></table>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Scripts -->
<script src="../../js/jquery-1.8.2.min.js"></script>

<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>



</body>
</html>
