/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: Rev $
 * $Author: Author $
 * $LastChangedDate: LastChangedDate $
 *
 */

package com.boventech.demo.util;

import java.awt.Font;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.time.Day;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;

import com.boventech.demo.entity.AnswerRecord;
import com.boventech.demo.entity.Exam;
import com.boventech.demo.entity.KnowledgePoint;
import com.boventech.demo.entity.UserAnswer;

/**
 * @author peng.xia
 * 
 */
public class Cartogram {

    public String getBarChart(String contextPath, AnswerRecord answerRecord) {
        CategoryDataset dataset = getBarDataSet(answerRecord.getUserAnswers());
        JFreeChart chart = ChartFactory.createBarChart3D("答题记录统计图", // 图表标题
                "类型", // 目录轴的显示标签
                "题数", // 数值轴的显示标签
                dataset, // 数据集
                PlotOrientation.HORIZONTAL, // 图表方向：水平、垂直
                true, // 是否显示图例(对于简单的柱状图必须是false)
                false, // 是否生成工具
                false // 是否生成URL链接
                );

        // 从这里开始
        CategoryPlot plot = chart.getCategoryPlot();// 获取图表区域对象
        CategoryAxis domainAxis = plot.getDomainAxis(); // 水平底部列表
        domainAxis.setLabelFont(new Font("黑体", Font.BOLD, 14)); // 水平底部标题
        domainAxis.setTickLabelFont(new Font("宋体", Font.BOLD, 12)); // 垂直标题
        ValueAxis rangeAxis = plot.getRangeAxis();// 获取柱状
        rangeAxis.setLabelFont(new Font("黑体", Font.BOLD, 15));
        chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 15));
        chart.getTitle().setFont(new Font("宋体", Font.BOLD, 20));// 设置标题字体

        // 到这里结束，虽然代码有点多，但只为一个目的，解决汉字乱码问题

        String path = contextPath + "/resources/img/";
        String name = answerRecord.getId() + "-B.png";
        try {
            ChartUtilities.saveChartAsPNG(new File(path + name), chart, 870, 500);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return name;
    }

    public String getPieChart(String contextPath, AnswerRecord answerRecord) {
        DefaultPieDataset data = getPieDataSet(answerRecord.getUserAnswers());
        JFreeChart chart = ChartFactory.createPieChart3D("知识点统计图", data, true, false, false);
        // 设置百分比
        PiePlot pieplot = (PiePlot) chart.getPlot();
        DecimalFormat df = new DecimalFormat("0.00%");// 获得一个DecimalFormat对象，主要是设置小数问题
        NumberFormat nf = NumberFormat.getNumberInstance();// 获得一个NumberFormat对象
        StandardPieSectionLabelGenerator sp1 = new StandardPieSectionLabelGenerator("{0}  {2}", nf, df);// 获得StandardPieSectionLabelGenerator对象
        pieplot.setLabelGenerator(sp1);// 设置饼图显示百分比

        // 没有数据的时候显示的内容
        pieplot.setNoDataMessage("无数据显示");
        pieplot.setCircular(false);
        pieplot.setLabelGap(0.02D);

        pieplot.setIgnoreNullValues(true);// 设置不显示空值
        pieplot.setIgnoreZeroValues(true);// 设置不显示负值
        chart.getTitle().setFont(new Font("宋体", Font.BOLD, 20));// 设置标题字体
        PiePlot piePlot = (PiePlot) chart.getPlot();// 获取图表区域对象
        piePlot.setLabelFont(new Font("宋体", Font.BOLD, 10));// 解决乱码
        chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 10));

        String path = contextPath + "/resources/img/";
        String name = answerRecord.getId() + "-P.png";
        try {
            ChartUtilities.saveChartAsPNG(new File(path + name), chart, 870, 500);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return name;
    }
    
    public String  getTimeSeriesChart(String contextPath,Exam exam){  
        XYDataset xydataset = getTimeSeriesDataSet(exam.getAnswerRecords());  
        JFreeChart jfreechart = ChartFactory.createTimeSeriesChart("知识点分析", "日期", "价格",xydataset, true, true, true);  
        XYPlot xyplot = (XYPlot) jfreechart.getPlot();  
        DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis();  
        dateaxis.setDateFormatOverride(new SimpleDateFormat("MMM-yyyy"));  
        
        dateaxis.setLabelFont(new Font("黑体",Font.BOLD,14));         //水平底部标题  
        dateaxis.setTickLabelFont(new Font("宋体",Font.BOLD,12));  //垂直标题  
        ValueAxis rangeAxis=xyplot.getRangeAxis();//获取柱状  
        rangeAxis.setLabelFont(new Font("黑体",Font.BOLD,15));  
        jfreechart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 15));  
        jfreechart.getTitle().setFont(new Font("宋体",Font.BOLD,20));//设置标题字体  
        
        String path = contextPath + "/resources/img/";
        String name = exam.getId() + "-T.png";
        try {
            ChartUtilities.saveChartAsPNG(new File(path + name), jfreechart, 870, 500);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return name;
    } 
    
    private static XYDataset getTimeSeriesDataSet(List<AnswerRecord> answerRecords) {
        TimeSeriesCollection timeseriescollection = new TimeSeriesCollection();
        for (AnswerRecord answerRecord : answerRecords) {
            HashMap<String, Double> map = new HashMap<String, Double>();
            HashMap<String, Double> map2 = new HashMap<String, Double>();
            
            for (UserAnswer userAnswer : answerRecord.getUserAnswers()) {
                for (KnowledgePoint knowledgePoint : userAnswer.getQuestion().getKnowledgePoints()) {
                    if (map.containsKey(knowledgePoint.getContent())) {
                        map.put(knowledgePoint.getContent(), map.get(knowledgePoint.getContent()) + 1);
                        map2.put(knowledgePoint.getContent()+"-accuracy", map2.get(knowledgePoint.getContent()+"-accuracy") + userAnswer.getAccuracy());
                    } else {
                        map.put(knowledgePoint.getContent(), 1.0);
                        map2.put(knowledgePoint.getContent()+"-accuracy", 0.0);
                    }
                }
            }
            Iterator<String> iterator = map.keySet().iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                @SuppressWarnings("deprecation")
                TimeSeries timeseries = new TimeSeries(key,org.jfree.data.time.Day.class);  
                timeseries.add(new Day(answerRecord.getCreateDate()), map2.get(key+"-accuracy")/map.get(key));
                timeseriescollection.addSeries(timeseries);
            }
        }
        return timeseriescollection;
    }

    private static DefaultPieDataset getPieDataSet(List<UserAnswer> userAnswers) {
        DefaultPieDataset dataset = new DefaultPieDataset();
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        for (UserAnswer userAnswer : userAnswers) {
            for (KnowledgePoint knowledgePoint : userAnswer.getQuestion().getKnowledgePoints()) {
                if (map.containsKey(knowledgePoint.getContent())) {
                    map.put(knowledgePoint.getContent(), map.get(knowledgePoint.getContent()) + 1);
                } else {
                    map.put(knowledgePoint.getContent(), 1);
                }
            }
        }
        Iterator<String> iterator = map.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();
            dataset.setValue(key, map.get(key));
        }
        return dataset;
    }

    private static CategoryDataset getBarDataSet(List<UserAnswer> userAnswers) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        int right = 0;
        int wrong = 0;
        int half = 0;
        for (UserAnswer userAnswer : userAnswers) {
            if (userAnswer.getAccuracy() == 1) {
                right++;
            }
            if (userAnswer.getAccuracy() == 0.5) {
                half++;
            }
            if (userAnswer.getAccuracy() == 0) {
                wrong++;
            }
        }

        dataset.addValue(userAnswers.size(), "总题数", "总题数");
        dataset.addValue(right, "答对", "答对题数");
        dataset.addValue(half, "半对", "半对题数");
        dataset.addValue(wrong, "答错", "答错题数");

        return dataset;
    }

}
