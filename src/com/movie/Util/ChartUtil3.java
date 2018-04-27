package com.movie.Util;

import javafx.scene.chart.NumberAxis;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.XYDataset;

import java.awt.*;

/**
 * Created by Administrator on 2018/1/10.
 */
public class ChartUtil3 {
    private static CategoryDataset getDataset(){
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();//创建数据集合
        Number[]temperature1 = {2000,3300,2000,1000,2900,3300,2600,1900,100};//不同月份的票房值数组
        Number[]temperature2 = {2030,300,1000,200,100,300,2200,900,300};
        Number[]temperature3 = {900,300,2030,300,1000,200,100,300,2200};
        for(int i=3;i<=11;i++){
            dataset.addValue(temperature1[i-3], "星球大战", i+"月");//添加数据
            dataset.addValue(temperature2[i-3], "芳华", i+"月");//添加数据
            dataset.addValue(temperature3[i-3], "前任3", i+"月");//添加数据
        }
        return dataset;
    }
    public static JFreeChart createChart(){
        StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); // 创建制图的主题样式
        standardChartTheme.setLargeFont(new Font("黑体", Font.BOLD, 16)); // 设置轴向的字体
        standardChartTheme.setRegularFont(new Font("宋体", Font.BOLD, 16)); // 设置图例的字体
        standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 24)); // 设置标题字体
        ChartFactory.setChartTheme(standardChartTheme); // 设置制图工厂使用主题
        JFreeChart chart = ChartFactory.createLineChart(
                "票房变化情况", // 图表标题
                "月份",
                "票房",
                getDataset(), // 绘制数据
                PlotOrientation.VERTICAL, // 图表方向
                true, // 定义图表是否包含图例
                true, // 定义图表是否包含提示
                false); // 定义图表是否包含URL
        return chart;
    }
}
