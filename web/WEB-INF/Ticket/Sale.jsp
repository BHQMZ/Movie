<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%@ page import="com.movie.model.MovieModel" %>
<%@ page import="com.movie.Dao.MovieDao" %>
<%@ page import="java.util.List" %>
<head>
    <meta charset="utf-8">

    <title>售票管理</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <link rel="stylesheet" href="../../css/style.css?v=1">
    <link rel="stylesheet" href="../../css/colors.css?v=1">
    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../../css/768.css?v=1">
    <link rel="stylesheet" href="../../css/form.css?v=1">
    <link rel="stylesheet" href="../../css/table.css?v=1">
    <link rel="stylesheet" href="../../css/movie.css">
    <link rel="stylesheet" href="../../css/jquery.dataTables.css?v=1">
    <script src="../../js/modernizr.custom.js"></script>
</head>
<%
    List<MovieModel> movies = null;
    MovieDao dao = new MovieDao();
    movies = dao.querySale();
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
    <li class="current"><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>售票系统</h1>
    </hgroup>
    <div class="with-padding">
        <table class="table responsive-table" id="sorting-advanced">
            <thead>
            <tr>
                <th>电影海报</th>
                <th>电影名称</th>
                <th>上映时间</th>
                <th>下映时间</th>
                <th>影片种类</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <td colspan="6">
                    <input type="button" value="退出" class="btn btn-primary btn6 mr10" onclick="window.location.href='/LoginMain'">
                </td>
            </tr>
            </tfoot>
            <tbody class="myaa">
            <%
                for (MovieModel movie : movies){
            %>
            <tr>
                <th align="center"><img src="../../imgMovie/<%=movie.getName()%>.jpg" width="100" height="150"></th>
                <td align="center"><%=movie.getName()%></td>
                <td align="center"><%=movie.getIndate()%></td>
                <td align="center"><%=movie.getOutdate()%></td>
                <td align="center"><%=movie.getKind()%></td>
                <td align="center">
                    <a href="/Details?id=<%=movie.getId()%>">详情</a>&nbsp&nbsp
                    <a href="/Choose?id=<%=movie.getId()%>">选购</a>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>

</section>
<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.input.js"></script>
<script src="../../js/jquery.dataTables.min.js"></script>
<script src="../../js/developr.tooltip.js"></script>
<script src="../../js/paging.js"></script>
</body>
</html>
