package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.Integral;
import com.liuliu.com.vo.IntegralVO;

@Mapper
public interface IntegralMapper {
	public Integer insertUserIntegral(Integral integral);
	public List<IntegralVO> selectIntegralByUserId(@Param("userId")int userId);
}
