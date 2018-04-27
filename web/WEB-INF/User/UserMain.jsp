<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%@ page import="com.movie.model.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.Dao.UserMainDao" %>
<%@ page import="com.movie.model.UserMainModel" %>

<head>
    <meta charset="utf-8">

    <title>登录管理</title>
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
    List<UserMainModel> users = null;
    UserMainDao dao = new UserMainDao();
    users = dao.queryAll();
%>
<script type="text/javascript">
    function deleteForm(id) {
        if (confirm("确定要删除此人吗？")) {
            window.location.href = "/UserMainServlet?method=3&id=" + id;
        }
    }
</script>
<%
    if(request.getAttribute("result") != null){
        if(request.getAttribute("result").equals("successful1")){
            out.print("<script type=\"text/javascript\">alert(\"添加成功！\");</script>");
        }else if(request.getAttribute("result").equals("failure1")){
            out.print("<script type=\"text/javascript\">alert(\"添加失败！\");</script>");
        }
        if(request.getAttribute("result").equals("successful2")){
            out.print("<script type=\"text/javascript\">alert(\"修改成功！\");</script>");
        }else if(request.getAttribute("result").equals("failure2")){
            out.print("<script type=\"text/javascript\">alert(\"修改失败！\");</script>");
        }
        if(request.getAttribute("result").equals("successful3")){
            out.print("<script type=\"text/javascript\">alert(\"删除成功！\");</script>");
        }else if(request.getAttribute("result").equals("failure3")){
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
    <li><a href="/HallMain" class="shortcut-messages" title="Hall">Hall</a></li>
    <li><a href="/PlayMain" class="shortcut-agenda" title="Play">Play</a></li>
    <li><a href="/CustomerMain" class="shortcut-contacts" title="Customer">Customer</a></li>
    <li><a href="/VipMain" class="shortcut-medias" title="Vip">Vip</a></li>
    <li><a href="/Sale" class="shortcut-stats" title="Ticket">Ticket</a></li>
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li class="current"><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>用户管理</h1>
    </hgroup>
    <div class="with-padding">
        <table class="table responsive-table" id="sorting-advanced">
            <thead>
            <tr>
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>级别</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <td colspan="6">
                    <input type="button" value="添加" class="btn btn-primary btn6 mr10" onclick="window.location.href='/UserAdd'">

                </td>
            </tr>
            </tfoot>
            <tbody class="myaa">
            <%
                for (UserMainModel user : users){
            %>
            <tr>
                <td align="center"><%=user.getId()%></td>
                <td align="center"><%=user.getName()%></td>
                <td align="center"><%=user.getPassword()%></td>
                <td align="center"><%=user.getLevel()%></td>
                <td align="center">
                    <a href="/UserModify?id=<%=user.getId()%>">修改</a>&nbsp&nbsp
                    <a href="javascript:deleteForm('<%=user.getId()%>')">删除</a>
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
<script>

    // Call template init (optional, but faster if called manually)
    $.template.init();

    // Table sort - DataTables
    var table = $('#sorting-advanced');
    table.dataTable({
        'aoColumnDefs': [
            { 'bSortable': false, 'aTargets': [ 0, 4 ] }
        ],
        'sPaginationType': 'full_numbers',
        'sDom': '<"dataTables_header"lfr>t<"dataTables_footer"ip>',
        'fnInitComplete': function( oSettings )
        {
            // Style length select
            table.closest('.dataTables_wrapper').find('.dataTables_length select').addClass('select blue-gradient glossy').styleSelect();
            tableStyled = true;
        }
    });

    // Table sort - styled
    $('#sorting-example1').tablesorter({
        headers: {
            0: { sorter: false },
            5: { sorter: false }
        }
    }).on('click', 'tbody td', function(event)
    {
        // Do not process if something else has been clicked
        if (event.target !== this)
        {
            return;
        }

        var tr = $(this).parent(),
            row = tr.next('.row-drop'),
            rows;

        // If click on a special row
        if (tr.hasClass('row-drop'))
        {
            return;
        }

        // If there is already a special row
        if (row.length > 0)
        {
            // Un-style row
            tr.children().removeClass('anthracite-gradient glossy');

            // Remove row
            row.remove();

            return;
        }

        // Remove existing special rows
        rows = tr.siblings('.row-drop');
        if (rows.length > 0)
        {
            // Un-style previous rows
            rows.prev().children().removeClass('anthracite-gradient glossy');

            // Remove rows
            rows.remove();
        }

        // Style row
        tr.children().addClass('anthracite-gradient glossy');

        // Add fake row
        $('<tr class="row-drop">'+
            '<td colspan="'+tr.children().length+'">'+
            '<div class="float-right">'+
            '<button type="submit" class="button glossy mid-margin-right">'+
            '<span class="button-icon"><span class="icon-mail"></span></span>'+
            'Send mail'+
            '</button>'+
            '<button type="submit" class="button glossy">'+
            '<span class="button-icon red-gradient"><span class="icon-cross"></span></span>'+
            'Remove'+
            '</button>'+
            '</div>'+
            '<strong>Name:</strong> John Doe<br>'+
            '<strong>Account:</strong> admin<br>'+
            '<strong>Last connect:</strong> 05-07-2011<br>'+
            '<strong>Email:</strong> john@doe.com'+
            '</td>'+
            '</tr>').insertAfter(tr);

    }).on('sortStart', function()
    {
        var rows = $(this).find('.row-drop');
        if (rows.length > 0)
        {
            // Un-style previous rows
            rows.prev().children().removeClass('anthracite-gradient glossy');

            // Remove rows
            rows.remove();
        }
    });

    // Table sort - simple
    $('#sorting-example2').tablesorter({
        headers: {
            5: { sorter: false }
        }
    });

</script>
</body>
</html>