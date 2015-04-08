package com.bornsoft.asn.utils.common;

import java.awt.image.BufferedImage;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 * 曲线图，饼图等各种统计图生成器
 * 
 * @author hooxin
 */
public class CurveGenerator
{
	// 默认宽度
	public static final int		DEFAULT_WIDTH	= 200;
	// 默认高度
	public static final int		DEFAULT_HEIGHT	= 200;
	// 系列或者统计对象
	public static final String	SERISE			= "serise";
	// 统计子类别或者 横向分类
	public static final String	TYPE			= "type";
	// 统计值 或者 纵向分类
	public static final String	VALUE			= "value";

	// 饼图
	public static final String	MODE_PIE		= "pie";
	// 区域图
	public static final String	MODE_AREA		= "area";
	// 线性图
	public static final String	MODE_LINE		= "line";

	/**
	 * @param width
	 *            图片宽度
	 * @param height
	 *            图片高度
	 * @param title
	 *            图片标题
	 * @param bottomLabel
	 *            下标显示
	 * @param leftLabel
	 *            左标显示
	 * @param datamapList
	 *            数据
	 * @return 图片
	 * @throws Exception
	 * 
	 */
	public static BufferedImage generateCurve(
			final int width, final int height, String title,
			String bottomLabel, String leftLabel,
			final List<Map<String,Object>> datamapList) throws Exception
	{
		DefaultCategoryDataset dataset = null;
		BufferedImage image = null;
		int _width = 0, _height = 0;
		_width = width == 0 ? DEFAULT_WIDTH : width;
		_height = height == 0 ? DEFAULT_HEIGHT : height;

		dataset = new DefaultCategoryDataset();
		if (datamapList != null && datamapList.size() > 0)
			for (Map<String,Object> map : datamapList)
			{
				dataset.addValue(
						(Double) map.get("value"),
						(String) map.get("serise"),
						(String) map.get("type"));
			}

		JFreeChart chart = ChartFactory.createAreaChart(
				title,
				bottomLabel,
				leftLabel,
				dataset,
				PlotOrientation.VERTICAL,
				false,
				true,
				false);

		image = chart.createBufferedImage(_width, _height);

		return image;
	}

	public static JFreeChart generateCurve(
			String title, String bottomLabel, String leftLabel,
			final List<Map<String,Object>> datamapList) throws Exception
	{
		DefaultCategoryDataset dataset = null;
		dataset = new DefaultCategoryDataset();

		if (datamapList != null && datamapList.size() > 0)
			for (Map<String,Object> map : datamapList)
			{
				dataset.addValue(
						(Double) map.get("value"),
						(String) map.get("serise"),
						(String) map.get("type"));
			}

		JFreeChart chart = ChartFactory.createAreaChart(
				title,
				bottomLabel,
				leftLabel,
				dataset,
				PlotOrientation.VERTICAL,
				false,
				true,
				false);

		return chart;
	}

	/**
	 * 饼状图
	 * 
	 * @param width
	 *            图片宽度
	 * @param height
	 *            图片高度
	 * @param title
	 *            标题
	 * @param dataList
	 *            数据集
	 * @return 饼状图
	 * @throws Exception
	 */
	public static BufferedImage generatePie(
			final int width, final int height, String title,
			List<Map<String,Object>> dataList) throws Exception
	{
		DefaultPieDataset dataset = null;
		BufferedImage image = null;
		int _width = 0, _height = 0;

		_width = width == 0 ? DEFAULT_WIDTH : width;
		_height = height == 0 ? DEFAULT_HEIGHT : height;

		dataset = new DefaultPieDataset();
		if (dataList != null && dataList.size() > 0)
			for (Map<String,Object> map : dataList)
			{
				dataset.setValue(
						(String) map.get(SERISE),
						(Double) map.get(VALUE));
			}
		JFreeChart chart = ChartFactory.createPieChart(
				title,
				dataset,
				true,
				true,
				false);

		image = chart.createBufferedImage(_width, _height);

		return image;
	}

	public static JFreeChart generatePie(
			String title, List<Map<String,Object>> dataList) throws Exception
	{
		DefaultPieDataset dataset = null;

		dataset = new DefaultPieDataset();
		if (dataList != null && dataList.size() > 0)
			for (Map<String,Object> map : dataList)
			{
				dataset.setValue(
						(String) map.get(SERISE),
						(Double) map.get(VALUE));
			}
		JFreeChart chart = ChartFactory.createPieChart(
				title,
				dataset,
				true,
				true,
				false);
		return chart;
	}

	public static JFreeChart generatePie(
			String title, Map<String,Object> dataMap) throws Exception
	{
		DefaultPieDataset dataset = null;

		dataset = new DefaultPieDataset();

		if (dataMap != null && dataMap.size() > 0)
			for (String key : dataMap.keySet())
			{
				dataset.setValue((String) key, (Double) dataMap.get(key));
			}
		JFreeChart chart = ChartFactory.createPieChart(
				title,
				dataset,
				true,
				true,
				false);
		return chart;
	}

	/**
	 * 保存图片为png格式
	 * 
	 * @param request
	 * @param chart
	 *            图标对象
	 * @param width
	 *            宽度
	 * @param height
	 *            高度
	 * @return 图片地址
	 * @throws Exception
	 */
	public static
			String saveChartOnServerAsPng(
					HttpServletRequest request, JFreeChart chart, int width,
					int height) throws Exception
	{
		String imagePath = request.getContextPath()
				+ "/DisplayChart?filename="
				+ ServletUtilities.saveChartAsPNG(
						chart,
						width,
						height,
						null,
						request.getSession());
		return imagePath;
	}
}
