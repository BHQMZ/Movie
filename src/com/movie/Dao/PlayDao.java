package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.PlaysModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlayDao {
    private Connection connection;
    private String sql="";

    public boolean addPlay(PlaysModel playsModel){
        connection = Database.getConnection();
        sql = "INSERT INTO play(pla_id,hal_id,mov_id,pla_starttime,pla_price) VALUES(?,?,?,?,?) ";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,playsModel.getId());
            ps.setString(i++,playsModel.getHalId());
            ps.setString(i++,playsModel.getMovId());
            ps.setString(i++,playsModel.getPlaStarttime());
            ps.setString(i++,playsModel.getPrice());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean updatePlay(PlaysModel playsModel){
        connection = Database.getConnection();
        sql = "UPDATE play set hal_id=?,mov_id=?,pla_starttime=?,pla_price=? WHERE pla_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,playsModel.getHalId());
            ps.setString(i++,playsModel.getMovId());
            ps.setString(i++,playsModel.getPlaStarttime());
            ps.setString(i++,playsModel.getPrice());
            ps.setString(i++,playsModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deletePlay(PlaysModel playsModel){
        connection = Database.getConnection();
        sql = "DELETE FROM play WHERE pla_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,playsModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public PlaysModel query(String id){
        connection = Database.getConnection();
        sql = "select * from play where pla_id= ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            PlaysModel playsModel = new PlaysModel();
            playsModel.setId(rs.getString(i++));
            playsModel.setHalId(rs.getString(i++));
            playsModel.setMovId(rs.getString(i++));
            playsModel.setPlaStarttime(rs.getString(i++));
            playsModel.setPrice(rs.getString(i++));
            rs.close();
            return playsModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<PlaysModel> queryBuy(String id){
        connection = Database.getConnection();
        sql = "select * from play where mov_id= ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            List<PlaysModel> list = getRecord(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<PlaysModel> queryCh(String id){
        connection = Database.getConnection();
        sql = "SELECT play.*,hal_name,mov_name,mov_time  FROM play,movie,hall WHERE play.mov_id=movie.mov_id and play.hal_id=hall.hal_id and movie.mov_id=?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            List<PlaysModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<PlaysModel> queryAll(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            sql = "SELECT play.*,hal_name,mov_name,mov_time FROM play,movie,hall WHERE play.mov_id=movie.mov_id and play.hal_id=hall.hal_id";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<PlaysModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<PlaysModel> getRecord(ResultSet rs) throws SQLException {
        List<PlaysModel> list = new ArrayList<>();
        while (rs.next()){
            PlaysModel playsModel = new PlaysModel();
            int i = 1;
            playsModel.setId(rs.getString(i++));
            playsModel.setHalId(rs.getString(i++));
            playsModel.setMovId(rs.getString(i++));
            playsModel.setPlaStarttime(rs.getString(i++));
            playsModel.setPrice(rs.getString(i++));
            list.add(playsModel);
        }
        return list;
    }

    private List<PlaysModel> getRecords(ResultSet rs) throws SQLException {
        List<PlaysModel> list = new ArrayList<>();
        while (rs.next()){
            PlaysModel playsModel = new PlaysModel();
            int i = 1;
            playsModel.setId(rs.getString(i++));
            playsModel.setHalId(rs.getString(i++));
            playsModel.setMovId(rs.getString(i++));
            playsModel.setPlaStarttime(rs.getString(i++));
            playsModel.setPrice(rs.getString(i++));
            playsModel.setHalName(rs.getString(i++));
            playsModel.setMovName(rs.getString(i++));
            playsModel.setMovTime(rs.getString(i++));
            list.add(playsModel);
        }
        return list;
    }
}
