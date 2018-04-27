package com.movie.servlet;


import com.movie.Dao.MovieDao;
import com.movie.model.MovieModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MovieServlet extends HttpServlet{

    private MovieDao dao = new MovieDao();
    private MovieModel movieModel = null;

    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
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
        movieModel = new MovieModel();
        movieModel.setId(formatStr(req.getParameter("id")));
        movieModel.setName(formatStr(req.getParameter("name")));
        movieModel.setIntroduce(formatStr(req.getParameter("introduce")));
        movieModel.setTime(formatStr(req.getParameter("time")));
        movieModel.setIndate(formatStr(req.getParameter("indate")));
        movieModel.setDirector(formatStr(req.getParameter("director")));
        movieModel.setOutdate(formatStr(req.getParameter("outdate")));
        movieModel.setStar(formatStr(req.getParameter("star")));
        movieModel.setStyle(formatStr(req.getParameter("style")));
        movieModel.setKind(formatStr(req.getParameter("kind")));
        if(dao.addMovie(movieModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/MovieMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        movieModel = new MovieModel();
        movieModel.setId(formatStr(req.getParameter("id")));
        movieModel.setName(formatStr(req.getParameter("name")));
        movieModel.setIntroduce(formatStr(req.getParameter("introduce")));
        movieModel.setTime(formatStr(req.getParameter("time")));
        movieModel.setIndate(formatStr(req.getParameter("indate")));
        movieModel.setDirector(formatStr(req.getParameter("director")));
        movieModel.setOutdate(formatStr(req.getParameter("outdate")));
        movieModel.setStar(formatStr(req.getParameter("star")));
        movieModel.setStyle(formatStr(req.getParameter("style")));
        movieModel.setKind(formatStr(req.getParameter("kind")));
        if(dao.updateMovie(movieModel)){
            result="successful2";
        }else {
            result="failure2";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/MovieMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        movieModel = new MovieModel();
        movieModel.setId(formatStr(req.getParameter("id")));
        if(dao.deleteMovie(movieModel)){
            result="successful3";
        }else {
            result="failure3";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/MovieMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }
}
