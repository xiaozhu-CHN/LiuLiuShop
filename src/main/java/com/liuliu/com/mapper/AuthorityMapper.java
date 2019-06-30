package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Authority;

@Mapper
public interface AuthorityMapper {
	public List<Authority> selectAuthorityAll();
	public Integer insertAuthority(String authName);
	public Integer updateAuthority(Authority authority);
	public Integer deleteAuthority(int authId);
}
