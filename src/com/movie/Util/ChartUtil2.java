package com.movie.Util;
import java.awt.Font;
import java.sql.*;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

public class ChartUtil2 {
    //创建数据集合
    private static PieDataset createDataset(){
        DefaultPieDataset dataset = new DefaultPieDataset();                        //创建饼图的数据集合
        Connection conn=null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/movie";
        try{  //加载JDBC-ODBC桥驱动程序
            Class.forName(driver);
            try {
                conn = DriverManager.getConnection(url,"root","123456"); //建立连接
                Statement statement = conn.createStatement();
                String sql="select movie.mov_id,mov_name,play.pla_price*COUNT(ticket.tic_id) " +
                        "from movie,play,ticket " +
                        "where movie.mov_id=play.mov_id and play.pla_id=ticket.pla_id " +
                        "group by movie.mov_id,mov_name,play.pla_price";
//                String sql="{CALL pr_mov_num()}";
                ResultSet rs = statement.executeQuery(sql);
                while(rs.next()){
                    //int id = rs.getInt(1);
                    dataset.setValue(rs.getString(2), rs.getDouble(3));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return dataset;//返回数据集合
    }
    //创建JFreeChart 对象
    public static JFreeChart createChart(){
        JFreeChart jfreeChart = ChartFactory.createPieChart("电影票房占比", createDataset(), true, true, false); //创建JFreeChart对象
        TextTitle localTextTitle = jfreeChart.getTitle();             //获取标题
        localTextTitle.setFont(new Font("隶书",0,15));           //标题字体样式
        PiePlot localPiePlot = (PiePlot)jfreeChart.getPlot();       //获取绘图区对象
        localPiePlot.setLabelFont(new Font("宋体", 0, 12));     //设置分类标签的字体
        localPiePlot.setCircular(false);                             //设置饼图是否一定是正圆
        return jfreeChart;
    }
}