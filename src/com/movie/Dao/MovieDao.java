package com.movie.Dao;

import com.movie.connection.Database;
import com.movie.model.MovieModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDao {
    private Connection connection;
    private String sql="";

    public boolean addMovie(MovieModel movieModel){
        connection = Database.getConnection();
        sql = "INSERT INTO movie(mov_id,mov_name,mov_introduce,mov_indate,mov_outdate,mov_time,mov_director,mov_star,mov_style,mov_kind) VALUES(?,?,?,?,?,?,?,?,?,?) ";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,movieModel.getId());
            ps.setString(i++,movieModel.getName());
            ps.setString(i++,movieModel.getIntroduce());
            ps.setString(i++,movieModel.getIndate());
            ps.setString(i++,movieModel.getOutdate());
            ps.setString(i++,movieModel.getTime());
            ps.setString(i++,movieModel.getDirector());
            ps.setString(i++,movieModel.getStar());
            ps.setString(i++,movieModel.getStyle());
            ps.setString(i++,movieModel.getKind());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean updateMovie(MovieModel movieModel){
        connection = Database.getConnection();
        sql = "UPDATE movie set mov_name=?,mov_introduce=?,mov_indate=?,mov_outdate=?,mov_time=?,mov_director=?,mov_star=?,mov_style=?,mov_kind=? WHERE mov_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,movieModel.getName());
            ps.setString(i++,movieModel.getIntroduce());
            ps.setString(i++,movieModel.getIndate());
            ps.setString(i++,movieModel.getOutdate());
            ps.setString(i++,movieModel.getTime());
            ps.setString(i++,movieModel.getDirector());
            ps.setString(i++,movieModel.getStar());
            ps.setString(i++,movieModel.getStyle());
            ps.setString(i++,movieModel.getKind());
            ps.setString(i++,movieModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deleteMovie(MovieModel movieModel){
        connection = Database.getConnection();
        sql = "DELETE FROM movie WHERE mov_id=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,movieModel.getId());
            rows = ps.executeUpdate();
            return rows>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public MovieModel query(String id){
        connection = Database.getConnection();
        sql = "select * from movie where mov_id= ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 1;
            MovieModel movieModel = new MovieModel();
            movieModel.setId(rs.getString(i++));
            movieModel.setName(rs.getString(i++));
            movieModel.setIntroduce(rs.getString(i++));
            movieModel.setIndate(rs.getString(i++));
            movieModel.setOutdate(rs.getString(i++));
            movieModel.setTime(rs.getString(i++));
            movieModel.setDirector(rs.getString(i++));
            movieModel.setStar(rs.getString(i++));
            movieModel.setStyle(rs.getString(i++));
            movieModel.setKind(rs.getString(i++));
            rs.close();
            return movieModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<MovieModel> queryAll(){
        connection = Database.getConnection();
        sql = "SELECT * FROM movie";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<MovieModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    public List<MovieModel> querySale(){
        connection = Database.getConnection();
        sql = "SELECT * FROM movie WHERE mov_id in (SELECT mov_id FROM play)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<MovieModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            Database.releaseConnection(connection);
        }
    }

    private List<MovieModel> getRecords(ResultSet rs) throws SQLException {
        List<MovieModel> list = new ArrayList<>();
        while (rs.next()){
            MovieModel movieModel = new MovieModel();
            int i = 1;
            movieModel.setId(rs.getString(i++));
            movieModel.setName(rs.getString(i++));
            movieModel.setIntroduce(rs.getString(i++));
            movieModel.setIndate(rs.getString(i++));
            movieModel.setOutdate(rs.getString(i++));
            movieModel.setTime(rs.getString(i++));
            movieModel.setDirector(rs.getString(i++));
            movieModel.setStar(rs.getString(i++));
            movieModel.setStyle(rs.getString(i++));
            movieModel.setKind(rs.getString(i++));
            list.add(movieModel);
        }
        return list;
    }
}
