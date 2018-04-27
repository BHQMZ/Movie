package com.movie.servlet;

import com.movie.Dao.PlayDao;
import com.movie.model.PlaysModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PlayServlet extends HttpServlet {
    private PlayDao dao = new PlayDao();
    private PlaysModel playsModel = null;

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
        playsModel = new PlaysModel();
        playsModel.setId(formatStr(req.getParameter("id")));
        playsModel.setHalId(formatStr(req.getParameter("halId")));
        playsModel.setMovId(formatStr(req.getParameter("movId")));
        playsModel.setPlaStarttime(formatStr(req.getParameter("plaStarttime")));
        playsModel.setPrice(formatStr(req.getParameter("price")));

        if(dao.addPlay(playsModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/PlayMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        playsModel = new PlaysModel();
        playsModel.setId(formatStr(req.getParameter("id")));
        playsModel.setHalId(formatStr(req.getParameter("halId")));
        playsModel.setMovId(formatStr(req.getParameter("movId")));
        playsModel.setPlaStarttime(formatStr(req.getParameter("plaStarttime")));
        playsModel.setPrice(formatStr(req.getParameter("price")));

        if(dao.updatePlay(playsModel)){
            result="successful2";
        }else {
            result="failure2";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/PlayMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        playsModel = new PlaysModel();
        playsModel.setId(formatStr(req.getParameter("id")));
        if(dao.deletePlay(playsModel)){
            result="successful3";
        }else {
            result="failure3";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/PlayMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

}
