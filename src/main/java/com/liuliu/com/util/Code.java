package com.liuliu.com.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

public class Code {
	
	//服务器重定向中编码的处理
	public static String code(String text) {
		try {
			return URLEncoder.encode(text,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//服务器确定订单号(时间+userid+随机十位数)
	public static String codeNumber(int userId) {
		//生成十位随机数
		String sources = "0123456789"; // 加上一些字母，就可以生成pc站的验证码了
		Random rand = new Random();
		StringBuffer flag = new StringBuffer();
		for (int j = 0; j < 10; j++) 
		{
			flag.append(sources.charAt(rand.nextInt(9)) + "");
		}
		return DateUtil.getNowNumber()+userId+flag.toString();
	}
}
