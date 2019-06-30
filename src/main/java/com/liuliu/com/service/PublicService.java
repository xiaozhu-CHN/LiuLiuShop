package com.liuliu.com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.liuliu.com.domain.ProProperty;
import com.liuliu.com.domain.ProductImage;
import com.liuliu.com.domain.User;
import com.liuliu.com.vo.ProductCategoryVO;
import com.liuliu.com.vo.ProductSearchVO;
import com.liuliu.com.vo.ReviewVO;

public interface PublicService {
	public int systemAdminlogin(String sysAdminName, String sysAdminPwd, HttpSession session);
	public String userRegister(User user);
	public String userLogin(String userName, String userPwd, HttpSession session);
	public ProductCategoryVO selectProduct(int proId);
	public List<ProProperty> selectPropertyAll(int proId);
	public List<ProductImage> selectProductImageAll(int proId);
	public int productStorelogin(String productStoreName, String productStorePwd, HttpSession session);
	public String productStoreRegister(String productStoreName, String productStorePwd, String productStoreCall);
	public List<ReviewVO> productReviewAll(int proId);
	public String userMessageVerification(String voContent);
	public String userMessageBinding(String userPhone, String voVerification);
	public List<ProductSearchVO> selectProName(String proName);
}

