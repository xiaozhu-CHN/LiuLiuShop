package com.liuliu.com.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.core.RabbitTemplate.ConfirmCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.liuliu.com.domain.AlipayPay;
import com.liuliu.com.domain.EmailInfo;
import com.liuliu.com.domain.Order;
import com.liuliu.com.domain.Orderitem;
import com.liuliu.com.handler.ErrHandler;
import com.liuliu.com.mapper.AlipayPayMapper;
import com.liuliu.com.mapper.OrderMapper;
import com.liuliu.com.mapper.OrderitemMapper;
import com.liuliu.com.mapper.ProPropertyMapper;
import com.liuliu.com.mapper.ShoppingCartInfoMapper;
import com.liuliu.com.rabbit.config.CancelOrderConfig;
import com.liuliu.com.rabbit.config.EmailConfig;
import com.liuliu.com.service.PaymentService;
import com.liuliu.com.util.AlipayConfig;
import com.liuliu.com.util.DateUtil;
import com.liuliu.com.vo.CartPropertyProductVO;

@Service("PaymentServiceImpl")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private ShoppingCartInfoMapper shoppingCartInfoMapper;
	@Autowired
	private OrderitemMapper orderitemMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private AlipayPayMapper alipayPayMapper;
	@Autowired
	private ProPropertyMapper proPropertyMapper;
	private final RabbitTemplate rabbitTemplate;
	private final AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	private final RabbitTemplate rabbitTemplates;
	private static final Logger LOG = LoggerFactory.getLogger(ErrHandler.class);
	
	/**
	 * 构造方法
	 * @param 
	 */
    @Autowired
    public PaymentServiceImpl(CachingConnectionFactory connectionFactory, RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = new RabbitTemplate(connectionFactory);
        this.rabbitTemplates = rabbitTemplate;
    }
	/**
	 * 生产者回调函数：confirm确认消息投递成功
	 */
	final ConfirmCallback confirmCallback = new RabbitTemplate.ConfirmCallback() {
		
		@Override
		public void confirm(CorrelationData correlationData, boolean ack, String cause) {
			
			String messageId = correlationData.getId();
			if (ack) {
				 LOG.info(DateUtil.getNowDate()+"消息投递成功："+messageId);
				//可以写入日志啥的
				
			}else{
				LOG.info(DateUtil.getNowDate()+"消息投递成功："+messageId);
			}
			
		}
	};
	
	public ShoppingCartInfoMapper getShoppingCartInfoMapper() {
		return shoppingCartInfoMapper;
	}

	public void setShoppingCartInfoMapper(ShoppingCartInfoMapper shoppingCartInfoMapper) {
		this.shoppingCartInfoMapper = shoppingCartInfoMapper;
	}
	
	public OrderitemMapper getOrderitemMapper() {
		return orderitemMapper;
	}

	public void setOrderitemMapper(OrderitemMapper orderitemMapper) {
		this.orderitemMapper = orderitemMapper;
	}

	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	public AlipayPayMapper getAlipayPayMapper() {
		return alipayPayMapper;
	}

	public void setAlipayPayMapper(AlipayPayMapper alipayPayMapper) {
		this.alipayPayMapper = alipayPayMapper;
	}

	public ProPropertyMapper getProPropertyMapper() {
		return proPropertyMapper;
	}

	public void setProPropertyMapper(ProPropertyMapper proPropertyMapper) {
		this.proPropertyMapper = proPropertyMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public BigDecimal totalPrice(List<Integer> propertyList) {
		// TODO 计算商品总价格
		List<CartPropertyProductVO> cartPropertyProductVOList = this.shoppingCartInfoMapper.selectShoppingCartSettlement(propertyList); 
		BigDecimal oMoneyBig = new BigDecimal(0.00);
		for (CartPropertyProductVO cartPropertyProductVO : cartPropertyProductVOList) {
			BigDecimal x1 = new BigDecimal(Double.valueOf(cartPropertyProductVO.getProprPromotePrice())).setScale(2,BigDecimal.ROUND_HALF_UP);
			BigDecimal y1 = new BigDecimal(cartPropertyProductVO.getShNum());
			oMoneyBig = oMoneyBig.add(x1.multiply(y1)).setScale(2,BigDecimal.ROUND_HALF_UP);
		}
		return oMoneyBig;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String orderitemListAdd(int integralNumber, String oCode, BigDecimal oMoneyBig, String[] oiMessageList, List<Integer> propertyList) {
		// TODO 循环添加商品属性
		List<CartPropertyProductVO> cartPropertyProductVOList = this.shoppingCartInfoMapper.selectShoppingCartSettlement(propertyList); 
		for(int i =0;i<cartPropertyProductVOList.size();i++) {
			CartPropertyProductVO cartPropertyProductVO = cartPropertyProductVOList.get(i);
			Orderitem orderitem = new Orderitem();
			orderitem.setProprId(cartPropertyProductVO.getProprId());
			orderitem.setOCode(oCode);
			if(this.proPropertyMapper.countFindByProprNumbe(cartPropertyProductVO.getProprId(), cartPropertyProductVO.getShNum())==1) {
				orderitem.setOiNum(cartPropertyProductVO.getShNum());
				this.proPropertyMapper.updateProprNumber(cartPropertyProductVO.getProprId(), cartPropertyProductVO.getShNum());
			}else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
				return "error";
			}
			BigDecimal x1 = new BigDecimal(Double.valueOf(cartPropertyProductVO.getProprPromotePrice()));
			BigDecimal y1 = new BigDecimal(cartPropertyProductVO.getShNum());
			BigDecimal oiMoney = x1.multiply(y1).setScale(2,BigDecimal.ROUND_HALF_UP);
			orderitem.setOiMoney(oiMoney.doubleValue());
			if(integralNumber!=0) {
				BigDecimal integralNumberBig = new BigDecimal(integralNumber);
				BigDecimal oiDiscountMoney = integralNumberBig.multiply(oiMoney.divide(oMoneyBig,1, BigDecimal.ROUND_HALF_UP)).setScale(2,BigDecimal.ROUND_HALF_UP);
				orderitem.setOiDiscountMoney(oiDiscountMoney.doubleValue());
			}else {
				orderitem.setOiDiscountMoney(0.00);
			}
			orderitem.setOsId(1);
			if(!oiMessageList[i].equals("null")) {
				orderitem.setOiMessage(oiMessageList[i]);
			}
			
			if(this.orderitemMapper.insertOrderitem(orderitem)!=1) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
				return "error";
			}
		}
		return "success";
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public String aliPayPayment(String oCode, BigDecimal totalAmount, List<Integer> propertyList) {
		// TODO 请求支付宝支付
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = oCode;
		//付款金额，必填
		String total_amount = totalAmount.setScale(2,BigDecimal.ROUND_HALF_UP).toString();
		//订单名称，必填
		String subject = "溜溜商城购物";
		//商品描述，可空
		List<CartPropertyProductVO> cartPropertyProductVOList = this.shoppingCartInfoMapper.selectShoppingCartSettlement(propertyList); 
		String body = "";
		if(cartPropertyProductVOList.size()==1) {
			body = cartPropertyProductVOList.get(0).getProName()+"一件商品。";
		}else {
			int number = 0;
			for(int i =0;i<cartPropertyProductVOList.size();i++) {
				number +=cartPropertyProductVOList.get(i).getShNum();
			}
			body = cartPropertyProductVOList.get(0).getProName()+"等"+number+"件商品。";
		}
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求
		try {
			return alipayClient.pageExecute(alipayRequest).getBody();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	 // 将request中的参数转换成Map
	public Map<String, String> convertRequestParamsToMap(HttpServletRequest request) {
        Map<String, String> retMap = new HashMap<String, String>();

        Set<Entry<String, String[]>> entrySet = request.getParameterMap().entrySet();

        for (Entry<String, String[]> entry : entrySet) {
            String name = entry.getKey();
            String[] values = entry.getValue();
            int valLen = values.length;
            if (valLen == 1) {
                retMap.put(name, values[0]);
            } else if (valLen > 1) {
                StringBuilder sb = new StringBuilder();
                for (String val : values) {
                    sb.append(",").append(val);
                }
                retMap.put(name, sb.toString().substring(1));
            } else {
                retMap.put(name, "");
            }
        }
        return retMap;
    }

	@Override
	public String alipayNotify(HttpServletRequest request) {
		// TODO 处理支付宝异步返回
		Map<String, String> params = this.convertRequestParamsToMap(request); // 将异步通知中收到的待验证所有参数都存放到map中
        // 调用SDK验证签名
		try {
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key,
					AlipayConfig.charset, AlipayConfig.sign_type);
			 if (signVerified) {
		        	Order order = this.orderMapper.selectOrderBasisOCode(params.get("out_trade_no"));
		        	if(order!=null) {
		        		BigDecimal oDiscountMoneyBig = new BigDecimal(Double.valueOf(order.getODiscountMoney())).setScale(2,BigDecimal.ROUND_HALF_UP);
		        		BigDecimal oMoneyBig = new BigDecimal(Double.valueOf(order.getOMoney())).setScale(2,BigDecimal.ROUND_HALF_UP);
		        		BigDecimal totalAmountBig = oMoneyBig.subtract(oDiscountMoneyBig).setScale(2,BigDecimal.ROUND_HALF_UP);
		        		BigDecimal aliTotalAmountBig=new BigDecimal(params.get("total_amount")).setScale(2,BigDecimal.ROUND_HALF_UP); 
		        		if(totalAmountBig.compareTo(aliTotalAmountBig)==0) {
		        			if(params.get("seller_id").equals(AlipayConfig.seller_id)) {
		        				if(params.get("app_id").equals(AlipayConfig.app_id)) {
		        					if(alipayBill(params).equals("success")) {
		        						//发送订单支付成功邮件
		        						paymentEmail(params.get("out_trade_no"));
		        						return "success";
		        					}
		        				}
		        			}
		        		}
		        	}
		        }
		} catch (AlipayApiException e) {
			// TODO 抛出异常
			e.printStackTrace();
		}
		return "error";    
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String alipayBill(Map<String, String> params) {
		// TODO 支付宝账单处理插入和商品已付款标记
		BigDecimal totalAmountBig = new BigDecimal(params.get("total_amount")).setScale(2,BigDecimal.ROUND_HALF_UP);
		if(this.alipayPayMapper.insertAlipayPay(new AlipayPay(null, params.get("trade_status"), params.get("trade_no"), params.get("out_trade_no"), params.get("seller_id"), totalAmountBig.doubleValue(), DateUtil.getTimeDate(params.get("gmt_payment"))))==1) {
			List<Orderitem> orderitemList = this.orderitemMapper.selectFindByOiId(params.get("out_trade_no"));
			for (Orderitem orderitem : orderitemList) {
				if(this.orderitemMapper.updataOsId(2,orderitem.getOiId())!=1) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
					return "error";
				}
			}
		}
		return "success";
	}

	@Override
	public String alipayTradeQuery(String outTradeNo) {
		// TODO 根据传入的订单号判断是否没有付款 没有付款的就取消订单。
		AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
		alipayRequest.setBizContent("{" +
				"\"out_trade_no\":\""+outTradeNo+"\"," +
				"      \"query_options\":[" +
				"        \"[\\\"TRADE_SETTE_INFO\\\"]\"" +
				"      ]" +
				"  }");
		try {
			AlipayTradeQueryResponse alipayResponse = alipayClient.execute(alipayRequest);
			if(alipayResponse.isSuccess()){
				if(alipayResponse.getTradeStatus().equals("WAIT_BUYER_PAY")||alipayResponse.getTradeStatus().equals("TRADE_CLOSED")) {
					return "success";
				}else {
					LOG.info(DateUtil.getNowDate()+"查询支付宝订单是否支付异常：");
				}
			} else {
			//这里插入日志，有可能是订单号不正确或者已经支付成功
				
				LOG.info(DateUtil.getNowDate()+"请求查询支付宝订单异常：");
				return "success";
			}
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOG.info(DateUtil.getNowDate()+"调用支付宝查询订单支付状态接口异常："+ e.getMessage());
		}
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String cancelOrder(String oCode) {
		// TODO 循环取消子订单
		if(this.orderMapper.updateCodeAllOsId(oCode)>=1) {
			List<Orderitem> orderitemList = this.orderitemMapper.selectOrderitem(oCode);
			for (Orderitem orderitem : orderitemList) {
				if(this.proPropertyMapper.updateProprNumberPlus(orderitem.getProprId(), orderitem.getOiNum())!=1) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
				}
			}
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public void cancelOrderRabbitMQ(String oCode, List<Integer> propertyList) {
		// TODO 超时取消订单的RabbitMQ队列 --生产者
		int number = this.shoppingCartInfoMapper.selectMinProprCancelTime(propertyList);
		this.rabbitTemplate.setConfirmCallback(confirmCallback);
        this.rabbitTemplate.setReturnCallback((message, replyCode, replyText, exchange, routingKey) -> System.out.println(DateUtil.getNowTime()));
		rabbitTemplate.convertAndSend(CancelOrderConfig.Order_EXCHANGE_NAME,CancelOrderConfig.Order_ROUTING_KRY, oCode,(message)->{
			 message.getMessageProperties().setHeader("x-delay", number);//设置延迟时间
	         return message;
		},new CorrelationData(oCode));
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public void paymentEmail(String oCode) {
		// TODO 订单支付成功发送邮件
		String userEmail = this.orderMapper.selectUserEmail(oCode);
		if(userEmail!=null&&userEmail.equals("")) {
			EmailInfo emailInfo = new EmailInfo();
			emailInfo.setEmailInfoTo(userEmail);
			emailInfo.setEmailUsername("付款成功");
			emailInfo.setEmailInfoContent("您在溜溜商城的订单："+oCode+"已成功付款。感谢您的购物，祝您生活愉快！");
			this.rabbitTemplates.convertAndSend(EmailConfig.EMAIL_NOTICE_QUEUE, emailInfo);
		}
	}

	@Override
	public String aliPayPaymentrRepeat(String oCode) {
		// TODO 用户请求再次付款
		Order order = this.orderMapper.selectOrderBasisOCode(oCode);
		BigDecimal x1 = new BigDecimal(Double.valueOf(order.getOMoney()));
		BigDecimal y1 = new BigDecimal(Double.valueOf(order.getODiscountMoney()));
		BigDecimal total_amount_big = x1.subtract(y1);
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = oCode;
		//付款金额，必填
		String total_amount = total_amount_big.setScale(2,BigDecimal.ROUND_HALF_UP).toString();
		//订单名称，必填
		String subject = "溜溜商城购物";
		//商品描述，可空
		String body = "";
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求
		try {
			return alipayClient.pageExecute(alipayRequest).getBody();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
    
}
