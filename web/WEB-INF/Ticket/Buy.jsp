<%@ page import="java.util.List" %>
<%@ page import="com.movie.Dao.HallDao" %>
<%@ page import="com.movie.Dao.PlayDao" %>
<%@ page import="com.movie.Dao.TicketDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movie.Dao.MovieDao" %>
<%@ page import="com.movie.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影票购买</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <%--图片样式--%>
    <link rel="stylesheet" href="../../css/style.css?v=1">
    <%--字体样式--%>
    <link rel="stylesheet" href="../../css/colors.css?v=1">
    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../../css/768.css?v=1">
    <%--动画效果--%>
    <script src="../../js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="../../css/movie.css">
    <link rel="stylesheet" href="../../css/seat.css">
</head>

<%
    HallDao dao = new HallDao();
    HallModel hall = new HallModel();
    MovieModel movie = new MovieModel();
    MovieDao movieDao = new MovieDao();
    PlaysModel plays = new PlaysModel();
    PlayDao playDao = new PlayDao();
    List<TicketModel> tickets= null;
    TicketDao ticketDao = new TicketDao();
    List<String> str = new ArrayList<>();
    int[] a = null;
    int b = 0;
    if(request.getParameter("id")!=null){
        hall = dao.query(request.getParameter("id"));
        movie = movieDao.query(request.getParameter("movid"));
        plays = playDao.query(request.getParameter("plaid"));
        tickets = ticketDao.queryHall(request.getParameter("id"),plays.getPlaStarttime());
        a = new int[hall.getColumn()];
        for (TicketModel ticket:tickets){
            a[b++] = ticket.getNumber();
        }
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
    <li><a href="/MovieStatistics" class="shortcut-settings" title="Statistics">Statistics</a></li>
    <li><a href="/UserMain" class="shortcut-notes" title="Settings">Settings</a></li>
</ul>
<section role="main" id="main">
    <hgroup id="main-title" class="thin">
        <h1>电影票选购</h1>
    </hgroup>
    <div>
        <%
            int x,y = 100,sum=0;
            String color="";
            String onclick="";
            for (int i = 0; i < hall.getRow(); i++) {
                x=100;y+=40;
                for (int j = 0; j < hall.getSeat(); j++) {
                    x+=40;sum++;color="white";onclick="Buy(this)";
                    for (int k = 0; k < b; k++) {
                        if(a[k]==sum){color="red";onclick="";break;}
                    }
        %>
        <div id="<%=i+1%>排<%=j+1%>坐" onclick="<%=onclick%>" style="width: 35px;height: 35px;background-color: <%=color%>;border:1px solid #000; position: absolute;left: <%=x%>px;top: <%=y%>px; " ></div>
        <%

                }
            }
        %>
    </div>

    <div class="myseat" id="seat">
        <div class="myright">
            <div class="my"><img src="../../imgMovie/<%=movie.getName()%>.jpg" width="100%" height="100%"></div>
            <div class="mytop">
                <h3><%=movie.getName()%></h3>
                <p>版本：<%=movie.getStyle()%><br>
                    片长：<%=movie.getTime()%></p>
            </div>
            <div class="mycenter">
                <p>影院：<span>无</span></p>
                <p>影厅：<span><%=hall.getName()%></span></p>
                <p>场次：<span><%=plays.getPlaStarttime()%></span></p>
            </div>
            <div class="mybottom">
                <p>座位号：<input id="in" type="text" style="width: 300px; border: none;background-color: transparent " value="" disabled></p>
            </div>
            <div class="mybutton">
                <button class="btn btn-primary btn6 mr10">购买</button>
            </div>
        </div>
    </div>
</section>

<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>

</body>
</html>
<script type="text/javascript">
    var arr=[];
    function Buy(div)
    {
        if(div.style.backgroundColor=="white")
        {
            div.style.backgroundColor = "orange";
            arr.push(div.id);
            document.getElementById("in").value=arr;
        }
        else
        {
            div.style.backgroundColor = "white";
            arr.splice($.inArray(div.id, arr), 1);
            document.getElementById("in").value=arr;
        }
    }
    $(document).ready(function(){
        $("button").click(function(){
            var str = "确定要购买"+arr+"吗?";
            if (confirm(str)) {
                window.location.href='/Ticket?halid=<%=hall.getId()%>&plaid=<%=plays.getId()%>&movid=<%=movie.getId()%>&ctid='+arr;
            }
        });
    });
</script>
