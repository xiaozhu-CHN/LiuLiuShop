package com.liuliu.com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liuliu.com.domain.User;
import com.liuliu.com.service.impl.PaymentServiceImpl;
import com.liuliu.com.service.impl.PublicServiceImpl;
import com.liuliu.com.vo.ProductCategoryVO;
import com.liuliu.com.vo.ProductSearchVO;

@Controller("PublicController")
@RequestMapping("/publicpage")
public class PublicController {
	
	@Resource
	private PublicServiceImpl publicServiceImpl;
	@Resource
	private PaymentServiceImpl paymentServiceImpl;
	

	@RequestMapping("adminlogin")
    public String adminlogin(){
        return "publicpage/adminlogin";
    }
	
	@RequestMapping(value="/systemadminlogin", produces="text/html; charset=utf-8")
	@ResponseBody
	public String systemAdminLogin(String sysAdminName, String sysAdminPwd, HttpSession session) {
		if(this.publicServiceImpl.systemAdminlogin(sysAdminName, sysAdminPwd, session)==1) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("user_register")
	public String user_register() {
		return "publicpage/user_register";
	}
	
	@RequestMapping(value="/user_register_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_register_form(User user, String voVerification) {
		if(this.publicServiceImpl.userMessageBinding(user.getUserPhone()+"", voVerification).equals("success")) {
			return this.publicServiceImpl.userRegister(user);
		}else{
			return "error3";
		}
		
	}
	
	@RequestMapping("user_login")
	public String user_login() {
		return "publicpage/user_login";
	}
	
	@RequestMapping(value="/user_login_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_login_form(String userName, String userPwd, HttpSession session) {
		return this.publicServiceImpl.userLogin(userName, userPwd, session);
	}
	
	@RequestMapping("product")
	public String product(int proId, ModelMap map) {
		ProductCategoryVO productCategoryVO =this.publicServiceImpl.selectProduct(proId);
		if(productCategoryVO!=null) {
			map.put("productCategoryVO", productCategoryVO);
			map.put("proPropertyList", this.publicServiceImpl.selectPropertyAll(proId));
			map.put("productImageList", this.publicServiceImpl.selectProductImageAll(proId));
			map.put("reviewVOList", this.publicServiceImpl.productReviewAll(proId));
			return "publicpage/product";
		}else {
			return "publicpage/error/product_error";
		}	
	}
	
	@RequestMapping("prostore_login")
    public String prostore_login(){
        return "publicpage/prostore_login";
    }
	
	@RequestMapping(value="/productstorelogin", produces="text/html; charset=utf-8")
	@ResponseBody
	public String productstorelogin(String productStoreName, String productStorePwd, HttpSession session) {
		if(this.publicServiceImpl.productStorelogin(productStoreName, productStorePwd, session)==1) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("prostore_register")
	public String prostore_register() {
		return "publicpage/prostore_register";
	}
	
	@RequestMapping(value="/prostore_register_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String prostore_register_form(String productStoreName, String productStorePwd, String productStoreCall) {
		return this.publicServiceImpl.productStoreRegister(productStoreName, productStorePwd, productStoreCall);
	}
	
	@RequestMapping(value="/user_phone_verification", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_phone_verification(String voContent) {
		return this.publicServiceImpl.userMessageVerification(voContent);
	}
	
	@RequestMapping("error_500")
	public String error_500(int demo) {
		System.out.println(demo);
		return null;
	}
	
	@RequestMapping("category")
	public String category(String proName, @RequestParam(required = false,defaultValue = "1")Integer page, ModelMap map) {
		PageHelper.startPage(page, 12);
		List<ProductSearchVO> productSearchVOList = this.publicServiceImpl.selectProName(proName);
		PageInfo<ProductSearchVO> pageInfo = new PageInfo<ProductSearchVO>(productSearchVOList);
		map.put("productSearchVOList",productSearchVOList);
		map.put("pageInfo",pageInfo);
		map.put("proName",proName);
		return "publicpage/search";
	}
	
	@RequestMapping("notify_url")
	@ResponseBody
	public void notify_url(HttpServletRequest request) {
		//可以判断是否付款成功然后插入日志。
		this.paymentServiceImpl.alipayNotify(request);
	}
}
