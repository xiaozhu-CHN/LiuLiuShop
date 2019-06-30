package com.liuliu.com.util;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

import org.springframework.web.multipart.MultipartFile;

public class Upload {
	/*
	 * file:上传的文件
	 * filePath:上传的路径
	 * fileName:文件的名称
	 */
	public static String upload(MultipartFile file, String filePath, String fileName) {
		if(file.isEmpty()){
			return null;
		}
		try {
			// 获取文件名
			String fileNameNew = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName=fileNameNew.substring(fileNameNew.lastIndexOf("."));
			fileNameNew = fileName + suffixName;
			// 上传后的文件路径名全称
			File dest = new File(URLDecoder.decode(filePath + fileNameNew,"UTF-8"));
			// 检测是否存在目录
			if(!dest.getParentFile().exists()){
				dest.getParentFile().mkdirs();
			}
			file.transferTo(dest);
			return fileNameNew;
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
}
