package com.liuliu.com.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liuliu.com.domain.SystemAdmin;

@Mapper
public interface SystemAdminMapper {
	public SystemAdmin selectfindByIdPwd(@Param("sysAdminName") String sysAdminName, @Param("sysAdminPwd") String sysAdminPwd);
	public Integer updateFindByAdminCall(@Param("sysAdminCall") String sysAdminCall, @Param("sysAdminId") int sysAdminId);
	public SystemAdmin selectfindByName(String sysAdminName);
	public Integer insertSystemAdmin(SystemAdmin systemAdmin);
	public Integer updateFindByAdminPwd(@Param("sysAdminPwd") String sysAdminPwd, @Param("sysAdminId") int sysAdminId);
}
