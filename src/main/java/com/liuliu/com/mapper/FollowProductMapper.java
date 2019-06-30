package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.vo.FollowProductVO;

@Mapper
public interface FollowProductMapper {
	public List<FollowProductVO> selectUserFollowProduct(int userId);
	public Integer deleteFollowProduct(int followProductId);
	public Integer countUserFollowProduct(@Param("proId") int proId, @Param("userId") int userId);
	public Integer insertUserFollowProduct(@Param("proId") int proId, @Param("userId") int userId);
}
