package com.liuliu.com.rabbit.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.CustomExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.QueueBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 取消订单延迟RabbitMQ
 * @author 
 *
 */
@Configuration
public class CancelOrderConfig {
		//交换机名字
		public static final String Order_EXCHANGE_NAME = "cancel.order.exchange";
		//队列名字
		public static final String Order_QUEUE_NAME = "cancel.order.queue";
		//ROUTING_KRY
		public static final String Order_ROUTING_KRY = "cancel.order";
		
		/**
		 * 声明一个延迟队列
		 * @return
		 */
		@Bean
		Queue delayQueue(){
			return QueueBuilder.durable(Order_QUEUE_NAME).build();
		}
		/**
		 * 声明一个交换机
		 * @return
		 */
		@Bean
		CustomExchange delayExchange(){
			
			Map<String, Object> args = new HashMap<>();
	        args.put("x-delayed-type", "direct");
			return new CustomExchange(Order_EXCHANGE_NAME, "x-delayed-message", true,false, args);
			
		}
		/**
		 * 绑定
		 * @param delayQueue
		 * @param delayExchange
		 * @return
		 */
		@Bean
		Binding queueBinding(Queue delayQueue, CustomExchange delayExchange){
		    return BindingBuilder.bind(delayQueue).to(delayExchange).with(Order_ROUTING_KRY).noargs();
		}
}
