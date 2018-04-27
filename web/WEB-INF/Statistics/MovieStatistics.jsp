<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>
<%@ page import="com.movie.Util.ChartUtil" %>
<%@ page import="com.movie.Util.ChartUtil2" %>
<%@ page import="com.movie.Util.ChartUtil3" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/28
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <%--图片样式--%>
    <link rel="stylesheet" href="../css/style.css?v=1">
    <%--字体样式--%>
    <link rel="stylesheet" href="../css/colors.css?v=1">
    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../css/768.css?v=1">
    <%--动画效果--%>
    <script src="../js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="../css/statistics.css">
</head>

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
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li class="current"><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <div class="statistics" id="statistics">
        <div class="myone" style="position: absolute;top:400px;left:50px;">
        <%
            String fileName = ServletUtilities.saveChartAsJPEG(ChartUtil.createChart(),450,300,session);
            String graphURL = request.getContextPath() + "/DisplayChart?filename=" + fileName;
        %><img src="<%=graphURL%>" border="1"><br><br><br>
    </div>
        <div class="mytwo"style="position: absolute;top:50px;left:50px;">
            <%
            String fileName2 = ServletUtilities.saveChartAsJPEG(ChartUtil2.createChart(),450,300,session);
            String graphURL2 = request.getContextPath() + "/DisplayChart?filename=" + fileName2;
            //  out.print(fileName);
            //  out.print("<br>");
            //  out.print(graphURL);
            %><img src="<%=graphURL2%>" border="1"><br><br><br>
        </div>

        <div class="mythree" style="position: absolute;top:50px;left:600px;">
            <%
                String fileName3 = ServletUtilities.saveChartAsJPEG(ChartUtil3.createChart(),800,650,session);
                String graphURL3 = request.getContextPath() + "/DisplayChart?filename=" + fileName3;
            %><img src="<%=graphURL3%>" border="1"><br><br><br>
        </div>
    </div>
</section>

<script src="../../js/jquery-1.8.2.min.js"></script>

<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>



</body>
</html>
