package com.liuliu.com.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.City;

@Mapper
public interface CityMapper {
	public List<City> selectCityByProvinceId(int provinceId);
	public Integer insertCity(@Param("cityName") String cityName,@Param("provinceId")int provinceId);
	public Integer deleteCity(int cityId);
	public Integer updateCity(City city);
	public City selectCityByCityId(int cityId);
}
