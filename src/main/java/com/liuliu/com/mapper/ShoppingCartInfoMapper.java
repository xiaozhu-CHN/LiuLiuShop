package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.ShoppingCartInfo;
import com.liuliu.com.vo.CartPropertyProductVO;

@Mapper
public interface ShoppingCartInfoMapper {
	public Integer insertShoppingCartInfo(ShoppingCartInfo shoppingCartInfo);
	public ShoppingCartInfo selectShoppingCartInfo(@Param("userId")int userId, @Param("proprId")int proprId);
	public Integer updateShoppingCartInfo(@Param("shNum")int shNum, @Param("shId")int shId);
	public List<CartPropertyProductVO> selectUserShoppingCartInfo(int userId);
	public Integer deleteUserShoppingCartInfo(@Param("userId")int userId,@Param("shId")int shId);
	public Integer countShoppingCartProprNumber(int userId);
	public List<CartPropertyProductVO> selectShoppingCartSettlement(List<Integer> propertyList);
	public Integer deleteShoppingCartInfoList(List<Integer> shIdList);
	public Integer selectMinProprCancelTime(List<Integer> shIdList);
}
