package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.HallModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HallDao {
    private Connection connection;
    private String sql="";

    public boolean updateHall(HallModel hallModel){
        connection = Database.getConnection();
        sql = "UPDATE hall SET hal_name=?,hal_rows=?,hal_count=?,hal_seats=?,hal_kind=?,hal_state=? where hal_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,hallModel.getName());
            ps.setInt(i++,hallModel.getRow());
            ps.setInt(i++,hallModel.getColumn());
            ps.setInt(i++,hallModel.getSeat());
            ps.setString(i++,hallModel.getKind());
            ps.setInt(i++,hallModel.getState());
            ps.setString(i++,hallModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deleteMovie(HallModel hallModel){
        connection = Database.getConnection();
        sql = "DELETE FROM hall WHERE hal_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,hallModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public HallModel query(String id){
        connection = Database.getConnection();
        sql = "select * from hall where hal_id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            HallModel hallModel = new HallModel();
            hallModel.setId(rs.getString(i++));
            hallModel.setName(rs.getString(i++));
            hallModel.setRow(rs.getInt(i++));
            hallModel.setSeat(rs.getInt(i++));
            hallModel.setColumn(rs.getInt(i++));
            hallModel.setKind(rs.getString(i++));
            hallModel.setState(rs.getInt(i++));
            rs.close();
            return hallModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<HallModel> queryAll(){
        connection = Database.getConnection();
        sql = "SELECT * FROM hall";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<HallModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<HallModel> getRecords(ResultSet rs) throws SQLException {
        List<HallModel> list = new ArrayList<>();
        while (rs.next()){
            HallModel hallModel = new HallModel();
            int i = 1;
            hallModel.setId(rs.getString(i++));
            hallModel.setName(rs.getString(i++));
            hallModel.setRow(rs.getInt(i++));
            hallModel.setSeat(rs.getInt(i++));
            hallModel.setColumn(rs.getInt(i++));
            hallModel.setKind(rs.getString(i++));
            hallModel.setState(rs.getInt(i++));
            list.add(hallModel);
        }
        return list;
    }
}
