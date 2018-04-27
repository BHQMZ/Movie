package com.movie.servlet;

import com.movie.Dao.UserMainDao;
import com.movie.model.UserMainModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserMainServlet extends HttpServlet {
    private UserMainDao dao= new UserMainDao();
    private UserMainModel userMainModel= null;
    private String formatStr(String str) {
        return str == null ? "" : str;
    }


//    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        doGet(req,resp);
    }

//    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        int method = Integer.parseInt(req.getParameter("method"));
        switch (method){
            case 1:
                this.add(req,resp);
                break;
            case 2:
                this.update(req,resp);
                break;
            case 3:
                this.delete(req,resp);
                break;
            default:
        }
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        userMainModel = new UserMainModel();
        userMainModel.setId(Integer.parseInt(formatStr(req.getParameter("id"))));
        userMainModel.setName(formatStr(req.getParameter("name")));
        userMainModel.setPassword(formatStr(req.getParameter("password")));
        userMainModel.setLevel(Integer.parseInt(formatStr(req.getParameter("level"))));

        if(dao.addUserMain(userMainModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/UserMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        userMainModel = new UserMainModel();
        userMainModel.setId(Integer.parseInt(formatStr(req.getParameter("id"))));
        userMainModel.setName(formatStr(req.getParameter("name")));
        userMainModel.setPassword(formatStr(req.getParameter("password")));
        userMainModel.setLevel(Integer.parseInt(formatStr(req.getParameter("level"))));

        if(dao.updateUserMain(userMainModel)){
            result="successful2";
        }else {
            result="failure2";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/UserMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        userMainModel = new UserMainModel();
        userMainModel.setId(Integer.parseInt(formatStr(req.getParameter("id"))));
        if(dao.deleteUserMain(userMainModel)){
            result="successful3";
        }else {
            result="failure3";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/UserMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }
}
