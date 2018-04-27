<%@ page import="com.movie.model.CustomerModel" %>
<%@ page import="com.movie.Dao.CustomerDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/28
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顾客修改</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <%--图片样式--%>
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
    CustomerModel customerModel = null;
    if(request.getParameter("id")!=null){
        CustomerDao dao = new CustomerDao();
        customerModel = dao.query(request.getParameter("id"));
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
    <li class="current"><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<div class="main-wrap">
    <div class="crumb-wrap">
    </div>
    <div class="result-wrap">
        <form action="CustomerServlet?method=2" method="post" id="myform" name="myform">
            <div class="config-items">
                <hgroup id="main-title" class="thin">
                    <h1 style="font-size: 20px">顾客修改</h1>
                </hgroup>
                <div class="result-content">
                    <table width="100%" class="insert-tab">
                        <tbody><tr>
                            <th width="15%"><i class="require-red">*</i>编号：</th>
                            <td><input style="height: 28px" type="text"  value="<%=customerModel.getId()%>" size="85" name="id" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>姓名：</th>
                            <td><input style="height: 28px" type="text" id="" value="<%=customerModel.getName()%>" size="85" name="name" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>性别：</th>
                            <td>
                                <input id="man" type="radio" <%if(customerModel.getSex().equals("男")){out.print("checked");}%> name="sex" class="common-text" VALUE="男"/>男
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <input id="woman" type="radio" <%if(customerModel.getSex().equals("女")){out.print("checked");}%> name="sex" class="common-text" VALUE="女"/>女</td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>联系方式：</th>
                            <td><input style="height: 28px" type="text" value="<%=customerModel.getPhone()%>" size="85" name="phone" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>会员编号：</th>
                            <td><input style="height: 28px" type="text" value="<%=customerModel.getVipId()%>" size="85" name="vipId" class="common-text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>会员期限：</th>
                            <td><input style="height: 28px" type="text" value="<%=customerModel.getViptime()%>" size="85" name="viptime" class="common-text"></td>
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