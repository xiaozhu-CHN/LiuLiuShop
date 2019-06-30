package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Province;

@Mapper
public interface ProvinceMapper {
	public List<Province> selectAllProvince();
	public Integer insertProvince(String provinceName);
	public Integer updateProvince(Province province);
	public Integer deleteProvince(int provinceId);
	public Province selectByProvinceId(int ProvinceId);
}
