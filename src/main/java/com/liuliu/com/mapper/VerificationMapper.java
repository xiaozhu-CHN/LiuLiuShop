package com.liuliu.com.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Verification;

@Mapper
public interface VerificationMapper {
	public Integer insertVerification(Verification verification);
	public Verification selectVoVerification(int userId, int emailPower);
	public Verification selectPhoneVoVerification(String voContent);
}
