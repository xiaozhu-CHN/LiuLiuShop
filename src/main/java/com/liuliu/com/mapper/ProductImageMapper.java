package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.ProductImage;

@Mapper
public interface ProductImageMapper {
	public List<ProductImage> selectFindByProId(int proId);
	public Integer insertProductImage(ProductImage productImage);
	public Integer deleteProductImage(int proimgId);
}
