package com.movie.servlet;

import com.movie.Dao.VipDao;
import com.movie.model.VipModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VipServlet extends HttpServlet{
    private VipDao dao= new VipDao();
    private VipModel vipModel= null;
    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
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
        vipModel = new VipModel();
        vipModel.setId(formatStr(req.getParameter("id")));
        vipModel.setPrice(formatStr(req.getParameter("price")));
        vipModel.setLevel(formatStr(req.getParameter("level")));
        vipModel.setDiscount(formatStr(req.getParameter("discount")));

        if(dao.addVip(vipModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/VipMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        vipModel = new VipModel();
        vipModel.setId(formatStr(req.getParameter("id")));
        vipModel.setPrice(formatStr(req.getParameter("price")));
        vipModel.setLevel(formatStr(req.getParameter("level")));
        vipModel.setDiscount(formatStr(req.getParameter("discount")));

        if(dao.updateVip(vipModel)){
            result="successful2";
        }else {
            result="failure2";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/VipMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        vipModel = new VipModel();
        vipModel.setId(formatStr(req.getParameter("id")));
        if(dao.deleteVip(vipModel)){
            result="successful3";
        }else {
            result="failure3";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/VipMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }
}
