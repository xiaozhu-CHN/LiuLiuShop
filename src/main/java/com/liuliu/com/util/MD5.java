package com.liuliu.com.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
*
* @描述：MD5加密
*/
public class MD5 {
	public static String md5(String password) {
		// TODO md5加密算法
		String passwords = password+"liuliu";
		return DigestUtils.md5Hex(passwords);
	}
}
