package com.ssdut.demo.util;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PublicMethod {
	
	/**
	 * 获取每页是10
	 * @return
	 */
	public static int getPageSizeMin(){
		String string = getPropertiesByFileNameAndProName("uploadconf","pagesize.min");
		return Integer.valueOf(string);
	}
	
	
	/**
	 * 获取每页是15
	 * @return
	 */
	public static int getPageSizeMid(){
		String string = getPropertiesByFileNameAndProName("uploadconf","pagesize.mid");
		return Integer.valueOf(string);
	}
	
	
	/**
	 * 获取每页是20
	 * @return
	 */
	public static int getPageSizeMax(){
		String string = getPropertiesByFileNameAndProName("uploadconf","pagesize.max");
		return Integer.valueOf(string);
	}
	
	
	
	/**
	 * 判断字符串input是否可以转化成数字
	 * @param input
	 * @return
	 */
	public static boolean isNumeric(String input){
		Pattern pattern = Pattern.compile("(-|)[0-9]*");
		Matcher isNum = pattern.matcher(input);
		if(! isNum.matches()){
			return false;
		}
		return true;
	}
	
	
	/**
	 * 判断字符串str是否在数组strs中
	 * @param str
	 * @param strs
	 * @return 存在返回true  不存在返回false
	 */
	public static boolean isExist(String str,String []strs){
		for(String s : strs){
			if(s.equals(str)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 根据时间格式获取当前时间
	 * @param patten
	 * @return
	 */
	public static String getCurrentTime(String patten){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patten);
		Date date = new Date();
		return simpleDateFormat.format(date);
	}
	
	/**
	 * 根据资源文件名称和资源名获取对应的值
	 * @param fileName
	 * @param proname
	 * @return
	 */
	public static String getPropertiesByFileNameAndProName(String fileName,String proname){
		/*加载上传文件的配置文件 start**/
		ResourceBundle resource = ResourceBundle.getBundle(fileName);//fileName为属性文件名如果是放在src下，直接用test即可 读取属性文件
		if(resource != null){
			return resource.getString(proname);//获取允许的文件拓展名
		}else{
			return "";
		}
		/*加载上传文件的配置文件 end**/
	}
	
	/**
	 * 根据路径和文件名删除文件
	 * @param path
	 * @param filename
	 * @return
	 */
	public static boolean deleteFileByPathAndName(String path,String filename){
		File file = new File(path,filename);
		if(file.exists()){
			return file.delete();
		}
		return false;
	}
	
	public static int getMonth(Date date)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH);
		return month;
	}
	
	public static int getDay(Date date)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return day;
	}
	public static Date stringToDate(String str){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
}
