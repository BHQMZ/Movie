package com.movie.servlet;

import com.movie.Dao.HallDao;
import com.movie.model.HallModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HallServle extends HttpServlet {
    private HallDao dao= new HallDao();
    private HallModel hallModel = null;
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
                this.update(req,resp);
                break;
            case 2:
                this.delete(req,resp);
                break;
            default:
        }
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        hallModel = new HallModel();
        hallModel.setId(formatStr(req.getParameter("id")));
        hallModel.setName(formatStr(req.getParameter("name")));
        hallModel.setRow(Integer.valueOf(formatStr(req.getParameter("row"))));
        hallModel.setColumn(Integer.valueOf(formatStr(req.getParameter("column"))));
        hallModel.setSeat(Integer.valueOf(formatStr(req.getParameter("seat"))));
        hallModel.setKind(formatStr(req.getParameter("kind")));
        hallModel.setState(Integer.valueOf(formatStr(req.getParameter("state"))));
        if(dao.updateHall(hallModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/HallMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        hallModel = new HallModel();
        hallModel.setId(formatStr(req.getParameter("id")));
        if(dao.deleteMovie(hallModel)){
            result="successful2";
        }else {
            result="failure";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/HallMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }
}
