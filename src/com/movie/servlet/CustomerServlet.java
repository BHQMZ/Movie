package com.movie.servlet;

import com.movie.Dao.CustomerDao;
import com.movie.model.CustomerModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomerServlet extends HttpServlet{
    private CustomerDao dao = new CustomerDao();
    private CustomerModel customerModel= null;
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
        customerModel = new CustomerModel();
        customerModel.setId(formatStr(req.getParameter("id")));
        customerModel.setName(formatStr(req.getParameter("name")));
        customerModel.setPhone(formatStr(req.getParameter("phone")));
        customerModel.setSex(formatStr(req.getParameter("sex")));
        customerModel.setVipId(formatStr(req.getParameter("vipId")));
        customerModel.setViptime(formatStr(req.getParameter("viptime")));

        if(dao.addCustomer(customerModel)){
            result="successful1";
        }else {
            result="failure1";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/CustomerMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        customerModel = new CustomerModel();
        customerModel.setId(formatStr(req.getParameter("id")));
        customerModel.setName(formatStr(req.getParameter("name")));
        customerModel.setPhone(formatStr(req.getParameter("phone")));
        customerModel.setSex(formatStr(req.getParameter("sex")));
        customerModel.setVipId(formatStr(req.getParameter("vipId")));
        customerModel.setViptime(formatStr(req.getParameter("viptime")));

        if(dao.updateCustomer(customerModel)){
            result="successful2";
        }else {
            result="failure2";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/CustomerMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = "";
        customerModel = new CustomerModel();
        customerModel.setId(formatStr(req.getParameter("id")));
        if(dao.deleteCustomer(customerModel)){
            result="successful3";
        }else {
            result="failure3";
        }
        RequestDispatcher rd = req.getRequestDispatcher("/CustomerMain");
        req.setAttribute("result",result);
        rd.forward(req,resp);
    }

}
