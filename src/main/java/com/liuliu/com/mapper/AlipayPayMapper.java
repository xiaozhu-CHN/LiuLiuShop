package com.liuliu.com.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.AlipayPay;

@Mapper
public interface AlipayPayMapper {
	public Integer insertAlipayPay(AlipayPay alipayPay);
}
