package com.liuliu.com.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Express;

@Mapper
public interface ExpressMapper {
	public Integer insertExpress(Express express);
}
