package com.movie.Dao.impl;
import com.movie.connection.Database;
import com.movie.Dao.UserDao;
import com.movie.model.UserModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{

    private Connection connection;
    @Override
    public int userLogin(UserModel model) {
        connection = Database.getConnection();
        String sql = "select * from login where name=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getName());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(!rs.getString("password").equals(model.getPassword())){
                    return 2;
                }else {
                    return 0;
                }
            }else {
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return 3;
    }
}
