package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.ExpressCompany;

@Mapper
public interface ExpressCompanyMapper {
	public List<ExpressCompany> selectAllExpressCompany();
	public Integer insertExpressCompany(String expressCompanyName);
	public Integer deleteExpressCompany(int expressCompanyId);
	public Integer updateExpressCompany(ExpressCompany expresscompany);
}
