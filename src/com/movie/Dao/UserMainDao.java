package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.UserMainModel;
import com.movie.model.VipModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserMainDao {
    private Connection connection;
    private String sql="";
    public boolean addUserMain(UserMainModel userMainModel){
        connection = Database.getConnection();
        sql = "INSERT INTO login(id,name,password,level) VALUES(?,?,?,?) ";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setInt(i++,userMainModel.getId());
            ps.setString(i++,userMainModel.getName());
            ps.setString(i++,userMainModel.getPassword());
            ps.setInt(i++,userMainModel.getLevel());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean updateUserMain(UserMainModel userMainModel){
        connection = Database.getConnection();
        sql = "UPDATE login set name=?,password=?,level=? WHERE id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,userMainModel.getName());
            ps.setString(i++,userMainModel.getPassword());
            ps.setInt(i++,userMainModel.getLevel());
            ps.setInt(i++,userMainModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deleteUserMain(UserMainModel userMainModel){
        connection = Database.getConnection();
        sql = "DELETE FROM login WHERE id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1,userMainModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public UserMainModel query(Integer id){
        connection = Database.getConnection();
        sql = "select * from login where id= ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            UserMainModel userMainModel = new UserMainModel();
            userMainModel.setId(rs.getInt(i++));
            userMainModel.setName(rs.getString(i++));
            userMainModel.setPassword(rs.getString(i++));
            userMainModel.setLevel(rs.getInt(i++));
            rs.close();
            return userMainModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<UserMainModel> queryAll(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            sql = "SELECT * FROM login";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<UserMainModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<UserMainModel> getRecords(ResultSet rs) throws SQLException{
        List<UserMainModel> list = new ArrayList<>();
        while (rs.next()){
            int i = 1;
            UserMainModel userMainModel = new UserMainModel();
            userMainModel.setId(rs.getInt(i++));
            userMainModel.setName(rs.getString(i++));
            userMainModel.setPassword(rs.getString(i++));
            userMainModel.setLevel(rs.getInt(i++));
            list.add(userMainModel);
        }
        return list;
    }

}
