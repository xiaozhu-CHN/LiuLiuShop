package com.liuliu.com.rabbit.handler;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.liuliu.com.domain.RabbitInfo;
import com.liuliu.com.handler.ErrHandler;
import com.liuliu.com.mapper.RabbitInfoMapper;
import com.liuliu.com.rabbit.config.CancelOrderConfig;
import com.liuliu.com.service.PaymentService;
import com.liuliu.com.util.DateUtil;
import com.rabbitmq.client.Channel;

@Component
public class CancelOrderHandler {

	@Resource
	private PaymentService paymentService;
	
	@Autowired
	private RabbitInfoMapper rabbitInfoMapper;
	
	public RabbitInfoMapper getRabbitInfoMapper() {
		return rabbitInfoMapper;
	}

	public void setRabbitInfoMapper(RabbitInfoMapper rabbitInfoMapper) {
		this.rabbitInfoMapper = rabbitInfoMapper;
	}
	
	private static final Logger LOG = LoggerFactory.getLogger(ErrHandler.class);

	@RabbitListener(queues = CancelOrderConfig.Order_QUEUE_NAME)
	@RabbitHandler
	public void receive( String oCode,Message message,Channel channel) {

		 try {
			 
				if(this.paymentService.alipayTradeQuery(oCode).equals("success")) {
					if(this.paymentService.cancelOrder(oCode).equals("success")) {
						//插入数据库RabbitMQ记录
						this.rabbitInfoMapper.insertRabbitInfo(new RabbitInfo(null,oCode,DateUtil.getNow()));
					}
				}
	            // TODO 通知 MQ 消息已被成功消费,可以ACK了
	            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
	        } catch (IOException e) {
	            // TODO 如果报错了,那么我们可以进行容错处理,比如转移当前消息进入其它队列
	        	LOG.info(DateUtil.getNowDate()+"延迟取消订单异常："+e.getMessage());
	        }
	}
}
