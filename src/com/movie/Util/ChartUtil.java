package com.movie.Util;
import java.awt.Font;
import java.sql.*;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

public class ChartUtil {
    //创建数据集合
    public static CategoryDataset createDataSet(){
        DefaultCategoryDataset dataSet=new DefaultCategoryDataset();  //实例化DefaultCategoryDataset对象
        Connection conn=null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/movie";
        try{  //加载JDBC-ODBC桥驱动程序
            Class.forName(driver);
            try {
                conn = DriverManager.getConnection(url,"root","123456"); //建立连接
                Statement statement = conn.createStatement();
                String sql = "SELECT\n" +
                        "\tmovie.mov_id,\n" +
                        "\tmov_name,\n" +
                        "\tplay.pla_price * COUNT(ticket.tic_id)\n" +
                        "FROM\n" +
                        "\tmovie,\n" +
                        "\tplay,\n" +
                        "\tticket\n" +
                        "WHERE\n" +
                        "\tmovie.mov_id = play.mov_id\n" +
                        "AND play.pla_id = ticket.pla_id\n" +
                        "GROUP BY\n" +
                        "\tmovie.mov_id,\n" +
                        "\tmov_name,\n" +
                        "\tplay.pla_price";
                ResultSet rs = statement.executeQuery(sql);

                while(rs.next()){
                    //int id = rs.getInt(1);
                    dataSet.addValue(rs.getInt(3),"电影名称",rs.getString(2));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return dataSet;
    }

    //创建JFreeChart 对象
    public static JFreeChart createChart (){
        StandardChartTheme standardChartTheme=new StandardChartTheme("CN"); //创建主题样式
        standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20)); //设置标题字体
        standardChartTheme.setRegularFont(new Font("宋体",Font.PLAIN,15)); //设置图例的字体
        standardChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 15));          //设置轴向的字体
        ChartFactory.setChartTheme(standardChartTheme);    //设置主题样式
        //通过ChartFactory 创建JFreeChart
        JFreeChart chart = ChartFactory.createBarChart3D(
                "电影票房统计",                    //图表标题
                "电影名称",                           //横轴标题
                "票房（元）",                        //纵轴标题
                createDataSet(),                       //数据集合
                PlotOrientation.VERTICAL,      //图表方向
                false,                               //是否显示图例标识
                false,                               //是否显示tooltips
                false);                              //是否支持超链接
        return chart;
    }
}