<%@ page import="com.movie.model.MovieModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.Dao.MovieDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片详情</title>
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

<%
    MovieModel movie = null;
    if(request.getParameter("id")!=null){
        MovieDao dao = new MovieDao();
        movie = dao.query(request.getParameter("id"));
    }
%>

<body class="clearfix with-menu with-shortcuts" id="movie">
<header role="banner" id="title-bar">
    <h2>电影院管理系统</h2>
</header>

<ul id="shortcuts" class="children-tooltip tooltip-right">
    <li><a href="/MovieMain" class="shortcut-dashboard" title="Movie">Movie</a></li>
    <li><a href="/HallMain" class="shortcut-messages" title="Hall">Hall</a></li>
    <li><a href="/PlayMain" class="shortcut-agenda" title="Play">Play</a></li>
    <li><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li class="current"><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/Statistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>影片详情</h1>
    </hgroup>
        <div>
            <div class="mypicture"><img src="../../imgMovie/<%=movie.getName()%>.jpg" width="100%" height="100%"></div>
            <div class="mymovie1">
                <p>影片编号：<%=movie.getId()%></p>
                <p>上映时间：<%=movie.getIndate()%></p>
                <p>导&nbsp&nbsp演：<%=movie.getDirector()%></p>
                <p>影片时长：<%=movie.getTime()%></p>
                <p>影片类型：<%=movie.getStyle()%></p>
            </div>
            <div class="mymovie2">
                <p>电影名称：<%=movie.getName()%></p>
                <p>下映时间：<%=movie.getOutdate()%></p>
                <p>主&nbsp&nbsp演：<%=movie.getStar()%></p>
                <p>影片种类：<%=movie.getKind()%></p>
            </div>
            <div class="mymovie3">
                <p>影片简介：</p>
                <textarea name="introduce" rows="8" cols="90" disabled><%=movie.getIntroduce()%></textarea>
            </div>
            <div class="mymovie4">
                <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
            </div>
        </div>
</section>

<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>

</body>
</html>
