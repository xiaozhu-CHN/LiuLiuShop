package com.liuliu.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.liuliu.com.domain.Ueditor;
import com.liuliu.com.util.DateUtil;
import com.liuliu.com.util.MD5;
import com.liuliu.com.util.PublicMsg;
import com.liuliu.com.util.Upload;

@Controller("UeditorController")
@RequestMapping("/ueditor")
public class UeditorController {
	
	@RequestMapping(value="/ueditor")
    @ResponseBody
    public String ueditor(HttpServletRequest request) {

        return PublicMsg.UEDITOR_CONFIG;
    }
	
	@RequestMapping(value="/imgUpload")
	@ResponseBody
    public Ueditor imgUpload(MultipartFile upfile) {
        Ueditor ueditor = new Ueditor();
        String filename = Upload.upload(upfile, "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\introduce\\", MD5.md5(DateUtil.getNowNumber()+Math.round(Math.random() * 1000000)));
        ueditor.setState("SUCCESS");
        ueditor.setUrl("/imgs/introduce/"+filename);
        ueditor.setOriginal(filename);
        ueditor.setTitle(filename);
        return ueditor;
    }
}
