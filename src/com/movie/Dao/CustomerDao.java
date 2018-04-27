package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.CustomerModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    private Connection connection;
    private String sql="";

    public boolean addCustomer(CustomerModel customerModel){
        connection = Database.getConnection();
        sql = "INSERT INTO customer(cus_id,cus_name,cus_phone,cus_sex,vip_id,cus_viptime) VALUES(?,?,?,?,?,?) ";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,customerModel.getId());
            ps.setString(i++,customerModel.getName());
            ps.setString(i++,customerModel.getPhone());
            ps.setString(i++,customerModel.getSex());
            ps.setString(i++,customerModel.getVipId());
            ps.setString(i++,customerModel.getViptime());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean updateCustomer(CustomerModel customerModel){
        connection = Database.getConnection();
        sql = "UPDATE customer set cus_name=?,cus_phone=?,cus_sex=?,vip_id=?,cus_viptime=? WHERE cus_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,customerModel.getName());
            ps.setString(i++,customerModel.getPhone());
            ps.setString(i++,customerModel.getSex());
            ps.setString(i++,customerModel.getVipId());
            ps.setString(i++,customerModel.getViptime());
            ps.setString(i++,customerModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deleteCustomer(CustomerModel customerModel){
        connection = Database.getConnection();
        sql = "DELETE FROM customer WHERE cus_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,customerModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public CustomerModel query(String id){
        connection = Database.getConnection();
        sql = "select cus_id,cus_name,cus_sex,cus_phone,vip_id,cus_viptime from customer where cus_id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            CustomerModel customerModel = new CustomerModel();
            customerModel.setId(rs.getString(i++));
            customerModel.setName(rs.getString(i++));
            customerModel.setSex(rs.getString(i++));
            customerModel.setPhone(rs.getString(i++));
            customerModel.setVipId(rs.getString(i++));
            customerModel.setViptime(rs.getString(i++));
            rs.close();
            return customerModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<CustomerModel> queryAll(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            sql = "SELECT customer.*,vip_level FROM customer,vip WHERE customer.vip_id=vip.vip_id";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<CustomerModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<CustomerModel> getRecords(ResultSet rs) throws SQLException {
        List<CustomerModel> list = new ArrayList<>();
        while (rs.next()){
            CustomerModel customerModel = new CustomerModel();
            int i = 1;
            customerModel.setId(rs.getString(i++));
            customerModel.setName(rs.getString(i++));
            customerModel.setSex(rs.getString(i++));
            customerModel.setPhone(rs.getString(i++));
            customerModel.setVipId(rs.getString(i++));
            customerModel.setViptime(rs.getString(i++));
            customerModel.setVipLevel(rs.getString(i++));
            list.add(customerModel);
        }
        return list;
    }
}
