package com.nc.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * <b>공통 함수 클래스</b><br/>
 * @Class Name  : ISmartSchedJob
 * @since   : 2014. 7. 30. 
 * @author   : Han Jung-Wan
 */
public class CommonUtil {
	 public static String decimal2hex(int d) {
        String digits = "0123456789ABCDEF";
        if (d == 0) return "0";
        String hex = "";
        while (d > 0) {
            int digit = d % 16;                // rightmost digit
            hex = digits.charAt(digit) + hex;  // string concatenation
            d = d / 16;
        }
        return hex;
    }
	 private static final int sizeOfIntInHalfBytes = 2;
	  private static final int numberOfBitsInAHalfByte = 4;
	  private static final int halfByte = 0x0F;
	  private static final char[] hexDigits = { 
	    '0', '1', '2', '3', '4', '5', '6', '7', 
	    '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
	  };
	 public static String decToHex(int dec) {
	    StringBuilder hexBuilder = new StringBuilder(sizeOfIntInHalfBytes);
	    hexBuilder.setLength(sizeOfIntInHalfBytes);
	    for (int i = sizeOfIntInHalfBytes - 1; i >= 0; --i)
	    {
	      int j = dec & halfByte;
	      hexBuilder.setCharAt(i, hexDigits[j]);
	      dec >>= numberOfBitsInAHalfByte;
	    }
	    return hexBuilder.toString(); 
	  }
	public static String replaceDigit(String value){
		StringBuffer sb = new StringBuffer();
		
		for(int i=0;i<value.length();i++){
			char c = value.charAt(i);
			if(Character.isDigit(c)){
				sb.append(c);
			}
		}
		return sb.toString();
	}
	
	public static String getCustomTime(String time, String format){
		
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);

			try	{
			    wantDate = sdf.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    return sdf.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 

		return null;
	}
	
	public static String getCustomTime(String time, String format1, String format2){
	
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(format1);
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(format2);
	
			try	{
			    wantDate = sdf1.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    return sdf2.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 
	
		return null;
	}
	
	public static String getCustomTime(String time, String format, int value){
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
	
			try	{
				if(time == null)
					wantDate = sdf.parse(CommonUtil.getTime("yyyy-MM-dd"));
				else
					wantDate = sdf.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    cal.add(Calendar.DAY_OF_MONTH, value);
			    return sdf.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 
	
		return null;
	}
	
	public static String[] getWeekDayArr(String time, String format){
		String[] weekArr = new String[7];
		java.util.Date wantDate = null;
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("dd");
	
			try	{
				wantDate = sdf.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);			   
			    for(int i=0;i<7;i++){
			    	if(i == 0)
			    		cal.add(Calendar.DAY_OF_MONTH, 0);
			    	else
			    		cal.add(Calendar.DAY_OF_MONTH, 1);
			    	
			    	weekArr[i] = formater.format(cal.getTime());
			    }
			    return weekArr;
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 
	
		return null;
	}
	public static String getCustomYearTime(String time, String format, int value){
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
	
			try	{
				if(time == null)
					wantDate = sdf.parse(CommonUtil.getTime("yyyy-MM-dd"));
				else
					wantDate = sdf.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    cal.add(Calendar.YEAR, value);
			    return sdf.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 
		return null;
	}
	
	public static String getCustomMinTime(String time, String format1, String format2, int value){
		
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(format1);
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(format2);

			try	{
			    wantDate = sdf1.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    cal.add(Calendar.MINUTE, value);
			    return sdf2.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 

		return null;
	}
	
	public static String getCustomYearTime(String time, String format1, String format2, int value){
		
		java.util.Date wantDate = null;
		
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(format1);
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(format2);

			try	{
			    wantDate = sdf1.parse(time);
			    GregorianCalendar cal = new GregorianCalendar();
			    cal.setTime(wantDate);
			    cal.add(Calendar.YEAR, value);
			    return sdf2.format(cal.getTime());
			}
			catch(Exception ex){ 
			    ex.printStackTrace(); 
			} 

		return null;
	}
	
	public static String getCustomTime(String format, int value) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;
	
		df = new SimpleDateFormat(format);
	
		cal.add(Calendar.DAY_OF_MONTH, value);
		return df.format(cal.getTime());
	}
	
	public static String getCustomMinuteTime(String format, int value) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;
	
		df = new SimpleDateFormat(format);
	
		cal.add(Calendar.MINUTE, value);
		return df.format(cal.getTime());
	}
	
	public static String getCustomTime(String format,int timeType, int value) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;
	
		df = new SimpleDateFormat(format);
	
		cal.add(timeType, value);
		return df.format(cal.getTime());
	}
	
	public static String getYesterTime(String format) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;

		df = new SimpleDateFormat(format);

		cal.add(Calendar.DAY_OF_MONTH, -1);
		return df.format(cal.getTime());
	}
	
	public static String getSixMonth(String format) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;

		df = new SimpleDateFormat(format);

		cal.add(Calendar.MONTH, -6);
		return df.format(cal.getTime());
	}
	
	

	public static String getTomorrowTime(String time, String format) {

		java.util.Date wantDate = null;

		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);

		try {
			if (time == null)
				wantDate = sdf.parse(CommonUtil.getTime("yyyy-MM-dd"));
			else
				wantDate = sdf.parse(time);
			GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(wantDate);
			cal.add(Calendar.DAY_OF_MONTH, +1);
			return sdf.format(cal.getTime());
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

	static public String getTime(String format) {
		Calendar cal = Calendar.getInstance(new Locale("Korean", "Korea"));
		SimpleDateFormat df = null;

		df = new SimpleDateFormat(format);
		/*
		 * switch (iCase) { case 1: df = new SimpleDateFormat("yyyyMMddHHmmss");
		 * break; case 2: df = new SimpleDateFormat("yyyyMMddHHmm"); break; case
		 * 3: df = new SimpleDateFormat("dd"); break; case 4: df = new
		 * SimpleDateFormat("yyyyMMdd"); break; case 5: df = new
		 * SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); break; case 6: df = new
		 * SimpleDateFormat("MM/dd HH:mm:ss"); break; case 7: df = new
		 * SimpleDateFormat("HH"); break; case 8: df = new
		 * SimpleDateFormat("yyyy"); break; case 9: df = new
		 * SimpleDateFormat("MM"); break; case 10: df = new
		 * SimpleDateFormat("yyyy-MM-dd"); break; case 1: df = new
		 * SimpleDateFormat("yyyy-MM-dd- HH:mm:ss"); break; default: break; }
		 */
		return df.format(cal.getTime());
	}

	public static String convertDateTime(XMLGregorianCalendar value) {

		String dateTime = "";

		dateTime = value.getYear() + "-" + value.getMonth() + "-"
				+ value.getDay() + " " + value.getHour() + ":"
				+ value.getMinute() + ":" + value.getSecond();

		return dateTime;
	}
	
	public static long operationDate(String createDate) throws ParseException {

		SimpleDateFormat dateFormatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.KOREA); 
		Date sourceDate1 = dateFormatter.parse(createDate);
		Date sourceDate2 = dateFormatter.parse(CommonUtil.getTime("yyyy-MM-dd HH:mm:ss"));
		
		long c = (sourceDate2.getTime() - sourceDate1.getTime())/ ( 1000 * 60);

		return c;
	}
	
	public static XMLGregorianCalendar getTimestamp() {
		try {
			return DatatypeFactory.newInstance().newXMLGregorianCalendar(
					new GregorianCalendar());
		} catch (DatatypeConfigurationException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String isNull(String val) {

		if (val == null)
			return "0";

		return val;
	}

	public static XMLGregorianCalendar getConvertTimestamp(String time,
			String format) {

		java.util.Date wantDate = null;
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);

		try {
			wantDate = sdf.parse(time);
			GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(wantDate);
			return DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}
}
