package com.liuliu.com;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.liuliu.com.domain.Email;
import com.liuliu.com.service.impl.EmailServiceImpl;


@RunWith(SpringRunner.class)
@SpringBootTest
public class LiuliuApplicationTests {
	
	@Resource
	private EmailServiceImpl emailServiceImpl;
	
	@Test
	public void contextLoads() {
		Email email = new Email();
		email.setEmailCall("溜溜商城<liuliu@benzhu.xyz>");
		email.setEmailHost("smtp.exmail.qq.com");
		email.setEmailPort(465);
		email.setEmailUsername("liuliu@benzhu.xyz");
		email.setEmailPassword("Liu666,,");
		emailServiceImpl.emailText(email, "1351095072@qq.com", "验证码", "尊敬的用户您好，您的验证为【6666】");
	}

	
}
