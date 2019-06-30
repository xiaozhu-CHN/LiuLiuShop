package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.EmailInfo;

@Mapper
public interface EmailInfoMapper {
	public Integer insertEmailInfo(EmailInfo emailInfo);
	public List<EmailInfo> selectEmailInfoList();
}
