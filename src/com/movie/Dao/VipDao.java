package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.VipModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VipDao {
    private Connection connection;
    private String sql="";

    public boolean addVip(VipModel vipModel){
        connection = Database.getConnection();
        sql = "INSERT INTO vip(vip_id,vip_price,vip_level,vip_discount) VALUES(?,?,?,?) ";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,vipModel.getId());
            ps.setString(i++,vipModel.getPrice());
            ps.setString(i++,vipModel.getLevel());
            ps.setString(i++,vipModel.getDiscount());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean updateVip(VipModel vipModel){
        connection = Database.getConnection();
        sql = "UPDATE vip set vip_price=?,vip_level=?,vip_discount=? WHERE vip_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,vipModel.getPrice());
            ps.setString(i++,vipModel.getLevel());
            ps.setString(i++,vipModel.getDiscount());
            ps.setString(i++,vipModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deleteVip(VipModel vipModel){
        connection = Database.getConnection();
        sql = "DELETE FROM vip WHERE vip_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,vipModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public VipModel query(String id){
        connection = Database.getConnection();
        sql = "select * from vip where vip_id= ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            VipModel vipModel = new VipModel();
            vipModel.setId(rs.getString(i++));
            vipModel.setPrice(rs.getString(i++));
            vipModel.setLevel(rs.getString(i++));
            vipModel.setDiscount(rs.getString(i++));
            rs.close();
            return vipModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<VipModel> queryAll(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            sql = "SELECT * FROM vip";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<VipModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<VipModel> getRecords(ResultSet rs) throws SQLException {
        List<VipModel> list = new ArrayList<>();
        while (rs.next()){
            int i = 1;
            VipModel vipModel = new VipModel();
            vipModel.setId(rs.getString(i++));
            vipModel.setPrice(rs.getString(i++));
            vipModel.setLevel(rs.getString(i++));
            vipModel.setDiscount(rs.getString(i++));
            list.add(vipModel);
        }
        return list;
    }
}

