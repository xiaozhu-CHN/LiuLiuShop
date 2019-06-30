package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.ProductStore;

@Mapper
public interface ProductStoreMapper {
	public ProductStore selectfindByIdPwd(@Param("productStoreName") String productStoreName, @Param("productStorePwd") String productStorePwd);
	public Integer insertProductStore(@Param("productStoreName") String productStoreName, @Param("productStorePwd") String productStorePwd, @Param("productStoreCall")String productStoreCall);
	public Integer countProductStoreName(@Param("productStoreName")String productStoreName, @Param("productStoreCall")String productStoreCall);
	public Integer updateProductStore(ProductStore productStore);
	public ProductStore selectFindById(int productStoreId);
	public List<ProductStore> selectProductStoreAll(@Param("productStoreExamine")Integer productStoreExamine);
	public Integer updateExamine(@Param("productStoreId")int productStoreId, @Param("productStoreExamine")int productStoreExamine);
	public Integer updateProductStorePwd(@Param("productStorePwd")String productStorePwd, @Param("productStoreId")int productStoreId);
}
