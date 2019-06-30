package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.ProProperty;

@Mapper
public interface ProPropertyMapper {
	public List<ProProperty> selectFindByProcaId(int proId);
	public Integer countFindByProprNumbe(@Param("proprId")int proprId, @Param("proprNumber")int proprNumber);
	public Integer updateProprNumber(@Param("proprId")int proprId, @Param("proprNumber")int proprNumber);
	public Integer insertProProperty(ProProperty proProperty);
	public ProProperty selectFindByProprId(int proprId);
	public Integer updateProProperty(ProProperty proProperty);
	public Integer deleteProProperty(int proprId);
	public Integer updateProprNumberPlus(@Param("proprId")int proprId, @Param("proprNumber")int proprNumber);
}
