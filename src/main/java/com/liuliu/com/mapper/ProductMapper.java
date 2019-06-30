package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.Product;
import com.liuliu.com.vo.ProductCategoryVO;
import com.liuliu.com.vo.ProductSearchVO;

@Mapper
public interface ProductMapper {
	public ProductCategoryVO selectByProId(int proId);
	public List<Product> selectByProductStoreId(int productStoreId);
	public Integer insertProduct(Product product);
	public Integer updateProduct(Product product);
	public Integer updateProSell(@Param("proId")int proId, @Param("proSell")int proSell);
	public Integer deleteProduct(int proId);
	public String selectProIntroduce(int proId);
	public Integer updateProIntroduce(@Param("proId")int proId, @Param("proIntroduce")String proIntroduce);
	public List<ProductSearchVO> selectProprName(String proName);
}
