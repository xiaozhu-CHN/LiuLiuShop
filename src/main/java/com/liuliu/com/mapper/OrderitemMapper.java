package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.Orderitem;
import com.liuliu.com.vo.ProductOrderVO;

@Mapper
public interface OrderitemMapper {
	public Integer insertOrderitem(Orderitem orderitem);
	public List<Orderitem> selectFindByOiId(String oCode);
	public Integer updataOsId(@Param("osId")int osId, @Param("oiId")int oiId);
	public List<ProductOrderVO> selectProductOrder(@Param("productStoreId")int productStoreId, @Param("osId")Integer osId);
	public List<Orderitem> selectOrderitem(String oCode);
}
