package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.MessageInfo;

@Mapper
public interface MessageInfoMapper {
	public Integer insertMessageInfo(MessageInfo messageInfo);
	public List<MessageInfo> selectMessageInfoList();
}
