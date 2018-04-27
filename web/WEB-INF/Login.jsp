<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link href="../css/login.css" rel="stylesheet">
	<link rel="Shortcut Icon" href="../img/tubiao.ico" />
</head>
<body>
<div class="admin_login">
	<div class="adming_login_border">
		<div class="admin_input">
			<form name="form1" method="post" action="/UserServlet?method=1&sign=0" onSubmit="return userCheck()">
				<h1 align="center" style="color: white">登录</h1>
				<div class="admin_items">
					<input type="text" name="account" placeholder="用户名" value="" id="user" class="admin_input_style" />
					<input type="password" name="password"  placeholder="密码" value="" id="password" class="admin_input_style" />
					<input type="submit" name="dousub" value="登录" class="btn btn-primary" />
				</div>
				<%--<p class="admin_p">忘记密码|<a href="Register.jsp">注册新账号</a>|</p>--%>
			</form>
		</div>
	</div>
</div>
</body>
</html>
