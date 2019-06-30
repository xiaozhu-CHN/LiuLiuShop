package com.liuliu.com.rabbit.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 邮件RabbitMQ
 * @author 
 *
 */
@Configuration
public class EmailConfig {

	public static final String EMAIL_FAST_QUEUE = "email.fast";
	public static final String EMAIL_NOTICE_QUEUE = "email.notice";
	
	@Bean
	public Queue emailFastQueue() {
	    // 第一个是 QUEUE 的名字,第二个是消息是否需要持久化处理
	    return new Queue(EMAIL_FAST_QUEUE, true);
	}
	
	@Bean
	public Queue emailNoticeQueue() {
	    // 第一个是 QUEUE 的名字,第二个是消息是否需要持久化处理
	    return new Queue(EMAIL_NOTICE_QUEUE, true);
	}
}
