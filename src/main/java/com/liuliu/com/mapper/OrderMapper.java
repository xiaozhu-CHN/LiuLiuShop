package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.Order;
import com.liuliu.com.vo.OrderVO;

@Mapper
public interface OrderMapper {
	public Integer insertOrder(Order order);
	public Order selectOrderBasisOCode(String oCode);
	public String selectUserEmail(String oCode);
	public List<OrderVO> selectOrderitemByUserId(@Param("userId")int userId);
	public Integer updateOrderOsIdByOiId(int oiId);
	public Integer updateCodeAllOsId(String oCode);
}
