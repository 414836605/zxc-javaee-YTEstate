package cn.ytwy.oa.tool;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Tool {
	//格式时间
	public static String formatTime(Date date)
	{
		SimpleDateFormat simpleDateFormat =   new SimpleDateFormat( " yy年MM月dd日 HH:mm " );
		return simpleDateFormat.format(date);
	}
	
	//字符串格式转换
	public static String iso8859ToUtf8(String string){
		String utf8String = null;
		try {
			utf8String = new String(string.getBytes("iso8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utf8String;
	}
	
	public static Date createDateUseYear(Integer year)
	{
		Date date = new Date(year, 0, 0);
		return date;
		
	}
}
