package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.StoreType;

@Mapper
public interface StoreTypeMapper {
	public Integer insertStoreType(@Param("productStoreId")int productStoreId, @Param("procaId")int procaId);
	public List<StoreType> selectFinByProductStoreId(int productStoreId);
}
