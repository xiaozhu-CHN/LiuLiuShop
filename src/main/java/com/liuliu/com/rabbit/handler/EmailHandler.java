package com.liuliu.com.rabbit.handler;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.liuliu.com.domain.Email;
import com.liuliu.com.domain.EmailInfo;
import com.liuliu.com.domain.Verification;
import com.liuliu.com.handler.ErrHandler;
import com.liuliu.com.mapper.EmailMapper;
import com.liuliu.com.rabbit.config.EmailConfig;
import com.liuliu.com.service.impl.EmailServiceImpl;
import com.liuliu.com.util.DateUtil;
import com.rabbitmq.client.Channel;

@Component
public class EmailHandler {
	
	@Autowired
	private EmailMapper emailMapper;
	@Resource
	private EmailServiceImpl emailServiceImpl;
	
	private static final Logger LOG = LoggerFactory.getLogger(ErrHandler.class);
	
	public EmailMapper getEmailMapper() {
		return emailMapper;
	}

	public void setEmailMapper(EmailMapper emailMapper) {
		this.emailMapper = emailMapper;
	}

	@RabbitListener(queues = {EmailConfig.EMAIL_FAST_QUEUE})
    public void emailFastConsumption(Verification verification, Message message, Channel channel) {
        // TODO 如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            Email email = this.emailMapper.selectEmail(1);
            // TODO 通知 MQ 消息已被成功消费,可以ACK了
            if(email!=null) {
           	 emailServiceImpl.emailText(email, verification.getVoContent(), "验证码", "尊敬溜溜商城用户您好，您的验证码为【"+verification.getVoVerification()+"】;半个小时内有效。");
            }
       	 channel.basicAck(deliveryTag, false);
        } catch (IOException e) {
            try {
                // TODO 处理失败,重新压入MQ
                channel.basicRecover();
                LOG.info(DateUtil.getNowDate()+"邮件验证码发送异常："+e.getMessage());
            } catch (IOException e1) {
            	 LOG.info(DateUtil.getNowDate()+"邮件验证码重新发送异常："+e1.getMessage());
            }
        }
    }
	
	@RabbitListener(queues = {EmailConfig.EMAIL_NOTICE_QUEUE})
	public void emailNoticeConsumption(EmailInfo emailInfo, Message message, Channel channel) {
		// TODO 如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
		final long deliveryTag = message.getMessageProperties().getDeliveryTag();
		try {
            Email email = this.emailMapper.selectEmail(1);
            // TODO 通知 MQ 消息已被成功消费,可以ACK了
            if(email!=null) {
            	emailServiceImpl.emailText(email, emailInfo.getEmailInfoTo(), emailInfo.getEmailUsername(), emailInfo.getEmailInfoContent());
            }
       	 	channel.basicAck(deliveryTag, false);
        } catch (IOException e) {
            try {
                // TODO 处理失败,重新压入MQ
            	LOG.info(DateUtil.getNowDate()+"订单邮件发送异常："+e.getMessage());
                channel.basicRecover();
            } catch (IOException e1) {
            	LOG.info(DateUtil.getNowDate()+"订单邮件重新发送异常："+e.getMessage());
            }
        }
	}
}
