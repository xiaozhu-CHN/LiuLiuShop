package com.liuliu.com.rabbit.handler;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import com.liuliu.com.domain.Verification;
import com.liuliu.com.handler.ErrHandler;
import com.liuliu.com.rabbit.config.MessageConfig;
import com.liuliu.com.service.impl.MessageServiceImpl;
import com.liuliu.com.util.DateUtil;
import com.rabbitmq.client.Channel;

@Component
public class MessgeHandler {
	
	@Resource
	private MessageServiceImpl messageServiceImpl;
	
	private static final Logger LOG = LoggerFactory.getLogger(ErrHandler.class);
	
	@RabbitListener(queues = {MessageConfig.MESSAGE_FAST_QUEUE})
    public void emailFastConsumption(Verification verification, Message message, Channel channel) {
        // TODO 如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            // TODO 通知 MQ 消息已被成功消费,可以ACK了
        	messageServiceImpl.sendMessage(verification);
       	 	channel.basicAck(deliveryTag, false);
        } catch (IOException e) {
            try {
                // TODO 处理失败,重新压入MQ
            	LOG.info(DateUtil.getNowDate()+"短信验证码发送异常："+e.getMessage());
                channel.basicRecover();
            } catch (IOException e1) {
            	LOG.info(DateUtil.getNowDate()+"短信验证码重新发送异常："+e.getMessage());
            	e1.printStackTrace();
            }
        }
    }
}
