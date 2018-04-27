package com.movie.servlet;
import com.movie.Dao.TicketDao;
import com.movie.model.TicketModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2018/1/10.
 */
public class TicketServlet extends HttpServlet {
    private TicketDao dao = new TicketDao();
    private TicketModel ticketModel = null;
    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        ticketModel = new TicketModel();
        ticketModel.setId(formatStr(req.getParameter("id")));
        ticketModel.setPrice(formatStr(req.getParameter("price")));
        ticketModel.setNumber(Integer.parseInt(formatStr(req.getParameter("number"))));
        ticketModel.setPlaId(formatStr(req.getParameter("plaId")));
        ticketModel.setCode(formatStr(req.getParameter("code")));
        ticketModel.setCusId(formatStr(req.getParameter("cusId")));

        if(dao.addTicket(ticketModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/Sale");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }


}
