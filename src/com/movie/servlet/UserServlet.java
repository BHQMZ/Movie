package com.movie.servlet;
import com.movie.model.UserModel;
import com.movie.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out=resp.getWriter();
        String method = req.getParameter("method");
        if (method.equals("1")) {
            UserModel userModel = new UserModel();
            UserService userService = new UserService();
            userModel.setName(req.getParameter("account"));
            userModel.setPassword(req.getParameter("password"));
            int i = userService.userLogin(userModel);
            if (i == 0) {
                HttpSession session = req.getSession();
                session.setAttribute("userLevel",i);
                Cookie c = new Cookie("user",userModel.getName());
                c.setMaxAge(600);
                resp.addCookie(c);
                out.print("<script language=javascript>alert('用户登录成功！');window.location.replace(\"/MovieMain\");</script>");
            } else if (i == 1){
                out.print("<script language=javascript>alert('您输入的用户名不存在，请重新输入！');history.go(-1);</script>");
            } else if (i == 2){
                out.print("<script language=javascript>alert('您输入的登录密码有误，请重新输入！');history.go(-1);</script>");
            } else if (i == 3){
                out.print("<script language=javascript>alert('登录异常！');history.go(-1);</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
