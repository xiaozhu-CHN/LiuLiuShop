package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.Area;
import com.liuliu.com.vo.ProvinceCityAreaVO;

@Mapper
public interface AreaMapper {
	public List<Area> selectByCityId(int cityId);
	public Integer insertArea(@Param("areaName") String areaName,@Param("cityId")int cityId);
	public Integer deleteArea(int areaId);
	public Integer updateArea(Area area);
	public ProvinceCityAreaVO selectProvinceCityAreaVO(int areaId);
}
