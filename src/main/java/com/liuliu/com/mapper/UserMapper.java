package com.liuliu.com.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.User;

@Mapper
public interface UserMapper {
	public User selectfindByName(String userName);
	public Integer insertUser(User user);
	public User selectfindByNamePwd(@Param("userName") String userName, @Param("userPwd") String userPwd);
	public Integer updateUserLogo(@Param("userImg")String userImg, @Param("userId")int userId);
	public Integer updateUser(@Param("userCall")String userCall, @Param("userSex")Integer userSex,  @Param("userId")int userId);
	public User selectFindById(int userId);
	public Integer updateUserIntegral(@Param("userIntegral")int userIntegral, @Param("userId")int userId);
	public Integer updateUserEmail(@Param("userEmail")String userEmail, @Param("userId")int userId);
}
