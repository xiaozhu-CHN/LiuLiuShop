package com.liuliu.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liuliu.com.domain.Review;
import com.liuliu.com.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	public List<ReviewVO> selectReviewFindByProId(int proId);
	public Integer insertReview(Review review);
}
