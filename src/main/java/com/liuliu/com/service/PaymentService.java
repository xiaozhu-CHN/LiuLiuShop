package com.liuliu.com.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PaymentService {
	public BigDecimal totalPrice(List<Integer> propertyList);
	public String orderitemListAdd(int integralNumber, String oCode, BigDecimal oMoneyBig, String[] oiMessageList,List<Integer> propertyList);
	public String aliPayPayment(String oCode, BigDecimal totalAmount, List<Integer> propertyList);
	public String alipayNotify(HttpServletRequest request);
	public String alipayBill(Map<String, String> params);
	public Map<String, String> convertRequestParamsToMap(HttpServletRequest request);
	public String alipayTradeQuery(String outTradeNo);
	public String cancelOrder(String oCode);
	public void cancelOrderRabbitMQ(String oCode, List<Integer> propertyList);
	public void paymentEmail(String oCode);
	public String aliPayPaymentrRepeat(String oCode);
}
