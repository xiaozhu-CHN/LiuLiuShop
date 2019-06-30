package com.liuliu.com.service.impl;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.liuliu.com.domain.MessageInfo;
import com.liuliu.com.domain.Verification;
import com.liuliu.com.mapper.MessageInfoMapper;
import com.liuliu.com.mapper.VerificationMapper;
import com.liuliu.com.service.MessageService;
import com.liuliu.com.util.DateUtil;

@Service("MessageServiceImpl")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private VerificationMapper verificationMapper;
	@Autowired
	private MessageInfoMapper messageInfoMapper;

	public VerificationMapper getVerificationMapper() {
		return verificationMapper;
	}

	public void setVerificationMapper(VerificationMapper verificationMapper) {
		this.verificationMapper = verificationMapper;
	}

	public MessageInfoMapper getMessageInfoMapper() {
		return messageInfoMapper;
	}

	public void setMessageInfoMapper(MessageInfoMapper messageInfoMapper) {
		this.messageInfoMapper = messageInfoMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void sendMessage(Verification verification) {
		// TODO 短信发送
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("userid", "");
		params.add("account", "");
		params.add("password", "");
		params.add("mobile", verification.getVoContent());
		params.add("content", "【笨猪网】您的验证码为["+verification.getVoVerification()+"]");
		params.add("action", "send");
		params.add("sendTime", "");
		params.add("extno", "");
		RestTemplate client = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        HttpMethod method = HttpMethod.POST;
        // 以表单的方式提交
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        //将请求头部和参数合成一个请求
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
        //执行HTTP请求，将返回的结构使用ResultVO类格式化
        ResponseEntity<String> response = client.exchange("http://39.98.198.70:8868/sms.aspx", method, requestEntity, String.class);
        String xml = response.getBody();
        try {
			Document dom = DocumentHelper.parseText(xml);
			Element root=dom.getRootElement();
			this.messageInfoMapper.insertMessageInfo(new MessageInfo(null, verification.getVoContent(), root.element("returnstatus").getText(), root.element("message").getText(), root.element("taskID").getText(), DateUtil.getNow()));
		} catch (DocumentException e) {
			// TODO 处理异常
			e.printStackTrace();
		}
	}
	
	
}
