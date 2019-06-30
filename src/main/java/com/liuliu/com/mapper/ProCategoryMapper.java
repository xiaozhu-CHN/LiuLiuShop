package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.ProCategory;

@Mapper
public interface ProCategoryMapper {
	public List<ProCategory> selectAllProCategory();
	public Integer insertProCategory(String procaName);
	public Integer deleteProCategory(int procaId);
	public Integer updateProCategory(ProCategory procategory);
	public ProCategory selectProcaName(int procaId);
}
