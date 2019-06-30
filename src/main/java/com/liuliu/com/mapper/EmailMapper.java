package com.liuliu.com.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Email;

@Mapper
public interface EmailMapper {
	public Email selectEmail(int emailPower);
	public Integer updateEmail(Email email);
}
