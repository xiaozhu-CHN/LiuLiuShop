package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.UserAdressinfo;
import com.liuliu.com.vo.AdressinfoVO;

@Mapper
public interface UserAdressinfoMapper {
	public List<AdressinfoVO> selectUserAdressinfoAll(int userId);
	public Integer insertUserAdressinfo(UserAdressinfo userAdressinfo);
	public List<AdressinfoVO> selectUserAdressinfoByuserId(@Param("userId")int userId);
	public Integer updateUserAdressinfoByUsadIs(UserAdressinfo userAdressinfo);
	public UserAdressinfo selectUserAdressinfoByusadId(@Param("usadId")int usadId);
	public void deleteUserAdressinfoByusadId(int usadId);
}
