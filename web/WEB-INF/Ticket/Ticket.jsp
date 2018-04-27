<%@ page import="com.movie.model.HallModel" %>
<%@ page import="com.movie.Dao.HallDao" %>
<%@ page import="com.movie.model.MovieModel" %>
<%@ page import="com.movie.Dao.MovieDao" %>
<%@ page import="com.movie.model.PlaysModel" %>
<%@ page import="com.movie.Dao.PlayDao" %>
<%@ page import="com.movie.model.TicketModel" %>
<%@ page import="com.movie.Dao.TicketDao" %>
<%@ page import="com.movie.Util.Tic_Random" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="com.movie.Util.QrCodeCreateUtil" %>
<%@ page import="javax.swing.*" %>
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
    <title>电影票生成</title>
    <link rel="Shortcut Icon" href="../../img/tubiao.ico" />
    <%--图片样式--%>
    <link rel="stylesheet" href="../css/style.css?v=1">
    <%--字体样式--%>
    <link rel="stylesheet" href="../css/colors.css?v=1">
    <link rel="stylesheet" media="only all and (min-width: 768px)" href="../css/768.css?v=1">
    <%--动画效果--%>
    <script src="../js/modernizr.custom.js"></script>
    <link rel="stylesheet" href="../css/ticket.css">
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
    String zuowei = request.getParameter("ctid");
    int z = Integer.parseInt(zuowei.substring(0,1));
    int w = Integer.parseInt(zuowei.substring(2,4));
    int zw=z*(hall.getRow()+1)+w;
    int[] a = null;
    int b = 0;
    if(request.getParameter("halid")!=null){
        hall = dao.query(request.getParameter("halid"));
        tickets = ticketDao.queryHall(request.getParameter("halid"),plays.getPlaStarttime());
        movie = movieDao.query(request.getParameter("movid"));
        plays = playDao.query(request.getParameter("plaid"));
        a = new int[hall.getColumn()];
        for (TicketModel ticket:tickets){
            a[b++] = ticket.getNumber();
        }
//        String array=request.getParameter("arr");
    }
%>
<body class="clearfix with-menu with-shortcuts" id="movie">
<header role="banner" id="title-bar">
    <h2>电影票生成</h2>
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
    <div class="myticket" id="ticket">
        <div class="myleft"><img src="../../img/user.png" width="50px" height="50px" style="position: absolute;left: 40px;top:40px;">
            <div class="mytitle"></div>
            <div class="my"><h3>温州万达影院</h3></div>
            <div class="my1">
                <div class="my11">影厅:  <%=hall.getName()%></div>
                <div class="my12">时间:  <span> <%=plays.getPlaStarttime()%><br> </span></div>
            </div>
            <div class="my2">片名： <%=movie.getName()%></div>
            <div class="my3">
                <div class="my31">座位号:<%=request.getParameter("ctid")%></div>
                <div class="my32">票价: <%=plays.getPrice()%></div>
            </div>
            <div class="my4">
                <div class="my41">票类: <%=movie.getStyle()%></div>
                <div class="my42">服务费: 0.00</div>
            </div>
            <div class="my5">
                <div class="my51">售票时间： <span> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%><br> </span></div>
                <div class="my52">工号: 00001 </div>
            </div>
            <div class="my6">票号: <% String tic_random =Tic_Random.getRandomString(16); out.print(tic_random);%></div>
            <div>
                <img alt="二维码" style="position: absolute;left: 300px;top: 340px;" src="${pageContext.request.contextPath}/qrCode?keycode=<%=tic_random%>"></img>
            </div>
        </div>
        <div class="myright">
            <h3>副券</h3>
            <p>影厅</p><p><%=hall.getName()%></p>
            <p>时间</p><p><%=plays.getPlaStarttime()%></p>
            <p>座号</p><p><%=request.getParameter("ctid")%></p>
            <p>票号</p><p><%=tic_random%></p>
            <p>票价</p><p><%=plays.getPrice()%></p>
        </div>
    </div>
    <input type="button" value="添加" class="btn btn-primary btn6 mr10" onclick="window.location.href='/TicketServlet?id=<%=Tic_Random.getRandomString(8)%>&price=<%=plays.getPrice()%>&number=<%=zw%>&plaId=<%=plays.getId()%>&code=<%=tic_random%>'">
</section>

<script src="../../js/jquery-1.8.2.min.js"></script>
<script src="../../js/setup.js"></script>
<script src="../../js/developr.tooltip.js"></script>



</body>
</html>
