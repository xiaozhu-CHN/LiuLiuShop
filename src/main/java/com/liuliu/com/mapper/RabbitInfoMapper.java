package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.RabbitInfo;

@Mapper
public interface RabbitInfoMapper {
	public Integer insertRabbitInfo(RabbitInfo rabbitInfo);
	public List<RabbitInfo> selectRabbitInfoList();
}
