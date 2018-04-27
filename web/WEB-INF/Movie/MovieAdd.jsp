<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/28
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片添加</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <%--图片样式--%>
    <link rel="stylesheet" href="../../css/style.css?v=1">
    <%--字体样式--%>
    <link rel="stylesheet" href="../../css/colors.css?v=1">
    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../../css/768.css?v=1">
    <%--动画效果--%>
    <script src="../../js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="../../css/movie.css">
</head>

<body class="clearfix with-menu with-shortcuts" id="movie">
<header role="banner" id="title-bar">
    <h2>电影院管理系统</h2>
</header>

<ul id="shortcuts" class="children-tooltip tooltip-right">
    <li class="current"><a href="/MovieMain" class="shortcut-dashboard" title="Movie">Movie</a></li>
    <li><a href="/HallMain" class="shortcut-messages" title="Hall">Hall</a></li>
    <li><a href="/PlayMain" class="shortcut-agenda" title="Play">Play</a></li>
    <li><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>影片添加</h1>
    </hgroup>
    <form method="post" action="MovieServle?method=1">
        <div>
            <div class="mymovie1">
                <p>影片编号：<input type="text" name="id" id="textfield1" value=""></p>
                <p>上映时间：<input type="text" name="indate" id="textfield3" value=""></p>
                <p>导&nbsp&nbsp演：<input type="text" name="director" id="textfield5" value=""></p>
                <p>影片时长：<input type="text" name="time" id="textfield7" value=""></p>
                <p>影片类型：<input type="text" name="style" id="textfield9" value=""></p>
            </div>
            <div class="mymovie2">
                <p>电影名称：<input type="text" name="name" id="textfield2" value=""></p>
                <p>下映时间：<input type="text" name="outdate" id="textfield4" value=""></p>
                <p>主&nbsp&nbsp演：<input type="text" name="star" id="textfield6" value=""></p>
                <p>影片种类：<input type="text" name="kind" id="textfield8" value=""></p>
            </div>
            <div class="mymovie3">
                <p>影片简介：</p>
                <textarea name="introduce" rows="8" cols="90"></textarea>
            </div>
            <div class="mymovie4">
                <input type="submit" value="添加" class="btn btn-primary btn6 mr10">
                <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
            </div>
        </div>
    </form>
</section>

<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>



</body>
</html>
