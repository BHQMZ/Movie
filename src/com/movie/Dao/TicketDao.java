package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.TicketModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketDao {
    private Connection connection;
    private String sql="";

    public boolean addTicket(TicketModel ticketModel) {
        connection = Database.getConnection();
        sql = "INSERT INTO ticket(tic_id,tic_price,hal_number,pla_id,tic_code ,cus_id) VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++, ticketModel.getId());
            ps.setString(i++, ticketModel.getPrice());
            ps.setInt(i++, ticketModel.getNumber());
            ps.setString(i++, ticketModel.getPlaId());
            ps.setString(i++, ticketModel.getCode());
            ps.setString(i++, ticketModel.getCusId());
            rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }
    }
    public List<TicketModel> queryHall(String id,String time){
        connection = Database.getConnection();
        sql = "select * from ticket where pla_id=(SELECT pla_id FROM play WHERE hal_id=? and pla_starttime=?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2,time);
            ResultSet rs = ps.executeQuery();
            List<TicketModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<TicketModel> query(String halId,String movId){
        connection = Database.getConnection();
        sql = "select * from ticket where pla_id IN (SELECT pla_id FROM play WHERE hal_id=? and mov_id=?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,halId);
            ps.setString(2,movId);
            ResultSet rs = ps.executeQuery();
            List<TicketModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<TicketModel> getRecords(ResultSet rs) throws SQLException {
        List<TicketModel> list = new ArrayList<>();
        while (rs.next()){
            TicketModel ticketModel = new TicketModel();
            int i = 1;
            ticketModel.setId(rs.getString(i++));
            ticketModel.setPrice(rs.getString(i++));
            ticketModel.setNumber(rs.getInt(i++));
            ticketModel.setPlaId(rs.getString(i++));
            ticketModel.setCode(rs.getString(i++));
            ticketModel.setCusId(rs.getString(i++));
            list.add(ticketModel);
        }
        return list;
    }
}
