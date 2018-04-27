<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%@ page import="com.movie.Dao.HallDao" %>
<%@ page import="com.movie.model.HallModel" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="utf-8">

    <title>影厅管理</title>
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
    List<HallModel> halls = null;
    HallDao dao = new HallDao();
    halls = dao.queryAll();
%>
<script type="text/javascript">
    function deleteForm(id) {
        if (confirm("确定要删除此影厅吗？")) {
            window.location.href = "/PlayServlet?method=3&id=" + id;
        }
    }
</script>

<%
    if(request.getAttribute("result") != null){
        if(request.getAttribute("result").equals("successful1")){
            out.print("<script type=\"text/javascript\">alert(\"修改成功！\");</script>");
        }else if(request.getAttribute("result").equals("failure1")){
            out.print("<script type=\"text/javascript\">alert(\"修改失败！\");</script>");
        }
        if(request.getAttribute("result").equals("successful2")){
            out.print("<script type=\"text/javascript\">alert(\"删除成功！\");</script>");
        }else if(request.getAttribute("result").equals("failure2")){
            out.print("<script type=\"text/javascript\">alert(\"删除失败！\");</script>");
        }
    }
%>
<body class="clearfix with-menu with-shortcuts">
<header role="banner" id="title-bar">
    <h2>电影院管理系统</h2>
</header>

<ul id="shortcuts" class="children-tooltip tooltip-right">
    <li><a href="/MovieMain" class="shortcut-dashboard" title="Movie">Movie</a></li>
    <li class="current"><a href="/HallMain" class="shortcut-messages" title="Hall">Hall</a></li>
    <li><a href="/PlayMain" class="shortcut-agenda" title="Play">Play</a></li>
    <li><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>影厅管理</h1>
    </hgroup>
    <div class="with-padding">
        <table class="table responsive-table" id="sorting-advanced">
            <thead>
            <tr>
                <th>影厅编号</th>
                <th>影厅名称</th>
                <th>影厅规格</th>
                <th>影厅状态</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <td colspan="6">
                </td>
            </tr>
            </tfoot>
            <tbody class="myaa">
            <%
                for (HallModel hall : halls){
            %>
            <tr>
                <th align="center"><%=hall.getId()%></th>
                <td align="center"><%=hall.getName()%></td>
                <td align="center"><%=hall.getKind()%></td>
                <td align="center"><%if(hall.getState()==1){out.print("可用");}else {out.print("不可用");}%></td>
                <td align="center">
                    <a href="/HallModify?id=<%=hall.getId()%>">修改</a>&nbsp&nbsp
                    <a href="javascript:deleteForm('<%=hall.getId()%>')">删除</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

</section>
<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.input.js"></script>
<script src="../../js/jquery.dataTables.min.js"></script>
<script src="../../js/developr.tooltip.js"></script>
<script src="../../js/paging4.js"></script>
</body>
</html>