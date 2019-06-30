package com.liuliu.com.rabbit.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 短信RabbitMQ
 * @author 
 *
 */
@Configuration
public class MessageConfig {
	public static final String MESSAGE_FAST_QUEUE = "message.fast";
	
	@Bean
	public Queue messageFastQueue() {
	    // 第一个是 QUEUE 的名字,第二个是消息是否需要持久化处理
	    return new Queue(MESSAGE_FAST_QUEUE, true);
	}
}
