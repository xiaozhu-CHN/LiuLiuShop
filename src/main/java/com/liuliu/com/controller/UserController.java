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
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liuliu.com.domain.Review;
import com.liuliu.com.domain.User;
import com.liuliu.com.domain.UserAdressinfo;
import com.liuliu.com.service.impl.PaymentServiceImpl;
import com.liuliu.com.service.impl.UserServiceImpl;
import com.liuliu.com.util.Code;
import com.liuliu.com.vo.AdressinfoVO;
import com.liuliu.com.vo.IntegralVO;
import com.liuliu.com.vo.OrderVO;

@Controller("UserController")
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private PaymentServiceImpl paymentServiceImpl;
	
	@RequestMapping("user_update")
	public String user_update(String msg, ModelMap map) {
		map.put("msg", msg);
		return "user/user_update";
	}
	
	@RequestMapping("user_upload_logo")
	public String user_upload_logo(@RequestParam("userfile") MultipartFile file, HttpSession session) {
		return "redirect:user_update?msg="+Code.code(this.userServiceImpl.userUploadLogo(file, session));
	}
	
	@RequestMapping(value="/user_update_change", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_update_change(String userCall, Integer userSex, int userId, HttpSession session) {
		return this.userServiceImpl.userUpate(userCall, userSex, userId, session);
	}
	
	@RequestMapping(value="/user_shopping_cart_add", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_shopping_cart_add(int proprId, int shNum, HttpSession session) {
		return this.userServiceImpl.userShoppingCartInfoAdd(proprId, shNum, session);
	}
	
	@RequestMapping("user_shopping_cart")
	public String user_shopping_cart(ModelMap map, HttpSession session) {
		map.put("cartPropertyProductVOList", this.userServiceImpl.userShoppingCartInfo(session));
		return "user/shopping_cart_info";
	}
	
	@RequestMapping(value="/user_shopping_cart_sh_num", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_shopping_cart_sh_num(int shId, int shNum, int proprId) {
		return this.userServiceImpl.userShoppingCartShNum(shId, shNum, proprId);
	}
	
	@RequestMapping(value="/user_shopping_cart_delete", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_shopping_cart_delete(int shId, HttpSession session) {
		return this.userServiceImpl.userDeleteShoppingCart(shId, session);
	}
	
	@RequestMapping("user_settlement")
	public String user_settlement(String propertyList, HttpSession session, ModelMap map) {
		map.put("cartPropertyProductVOList", this.userServiceImpl.userShoppingCartSettlement(propertyList, session));
		map.put("adressinfoVOList", this.userServiceImpl.userAdressinfoAll(session));
		return "user/settlement";
	}
	
	@RequestMapping("user_settlement_payment")
	public String user_settlement_payment(int usadId,int integralNumber, String oiMessage, ModelMap map,  HttpSession session) {
		if(integralNumber!=0) {
			if(this.userServiceImpl.userIntegralShopping(integralNumber, session).equals("error")) {
				return "user/payment/error";	
			}
		}
		String paymentForm = this.userServiceImpl.userSettlementSubmit(usadId, integralNumber, oiMessage, session);
		if(paymentForm!=null){
			map.put("paymentForm",paymentForm);
			return "user/payment/payment";
		}else {
			return "user/payment/error";
		}
	}
	
	
	@RequestMapping("return_url")
	public String return_url(HttpServletRequest request) {
		return "user/payment/success";
	}
	
	@RequestMapping("user_email")
	public String user_email() {
		return "user/user_email";
	}
	
	@RequestMapping(value="/user_email_verification", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_email_verification(String voContent, HttpSession session) {
		return this.userServiceImpl.userEmailVerification(voContent, session);
	}
	
	@RequestMapping(value="/user_email_binding", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_email_binding(String voContent, String voVerification, HttpSession session) {
		return this.userServiceImpl.userEmailBinding(voContent, voVerification, session);
	}
	
	@RequestMapping("selectIntegralByUserId")
	public String selectIntegralByUserId(ModelMap map,HttpSession session) {
		List<IntegralVO> integral = this.userServiceImpl.selectIntegralByUserId(session);
		map.put("integral",integral);
		return "user/integral";
	}
	
	@RequestMapping("toaddaddress")
	public String toaddaddress(ModelMap map) {
		map.put("provinceList", this.userServiceImpl.provinceAll());
		return "user/address/addAddress";
	}
	
	@RequestMapping("toupdateaddress")
	public String toupdateaddress() {
		return "user/address/updateAdress";
	}
	
	@RequestMapping("toAddress")
	public String toAddress(String msg, ModelMap map, HttpSession session) {
		map.put("msg",msg);
		List<AdressinfoVO> userAdressinfoVO = this.userServiceImpl.userAdressinfoSelectByUserId(session);
		map.put("userAdressinfoVO", userAdressinfoVO);
		return "user/address/address";
	}
	
	@RequestMapping("userAdressinfoAdd")
	public String userAdressinfoAdd(UserAdressinfo userAdressinfo, HttpSession session) {
		User user = (User) session.getAttribute("user");
		userAdressinfo.setUserId(user.getUserId());
		return "redirect:toAddress?msg="+ Code.code(this.userServiceImpl.userAdressInAdd(userAdressinfo));
	}
	
	@RequestMapping("userAdressinfoFindByUsadId")
	public String userAdressinfoFindByUsadId(ModelMap map,int usadId) {
		UserAdressinfo userAdressinfo = this.userServiceImpl.userAdressinfoSelectByUsadId(usadId);
		map.put("provinceList", this.userServiceImpl.provinceAll());
		map.put("userAdressinfo", userAdressinfo);
		return "user/address/updateAdress";			
	}
	
	@RequestMapping("userAdressinfoUpdateByUsadId")
	public String userAdressinfoUpdateByUsadId(UserAdressinfo userAdressinfo) {		
		return this.userServiceImpl.userAdressinfoUpdateByUsadId(userAdressinfo);
	}
	
	@RequestMapping("userAdressinfoDeleteByUsadId")
	public String userAdressinfoDeleteByUsadId(int usadId) {		
		this.userServiceImpl.userAdressinfoDeleteByUsadId(usadId);
		return "redirect:toAddress";
	}
	
	@RequestMapping("city_all")
	@ResponseBody
	public Object city_all(int provinceId) {
		return this.userServiceImpl.cityAll(provinceId);
	}

	@RequestMapping("area_all")
	@ResponseBody
	public Object area_all(int cityId) {
		return this.userServiceImpl.areaAll(cityId);
	}
	
	@RequestMapping("selectOrderByUserId")
	public String selectOrderByUserId(ModelMap map,HttpServletRequest request,@RequestParam(required = false,defaultValue = "1") Integer page) {
		PageHelper.startPage(page, 5);
		List<OrderVO> orderitem = this.userServiceImpl.selectOrderitemByUserId(request.getSession());
		PageInfo<OrderVO> pageInfo = new PageInfo<OrderVO>(orderitem);
		map.put("orderitemlist",orderitem);
		map.put("pageInfo",pageInfo);
		return "user/order";		
	}
	
	@RequestMapping("updateOrderosIdByoiId")
	public String updateOrderosIdByoiId(int oiId,Integer page) {		
		this.userServiceImpl.updateOrderOsIdByoiId(oiId);
		return "redirect:selectOrderByUserId?page="+page;
	}
	
	@RequestMapping("update_order_osid")
	public String update_order_osid(String oCode,Integer page) {
		this.userServiceImpl.updateCodeAllOsId(oCode);
		return "redirect:selectOrderByUserId?page="+page;
	}
	
	@RequestMapping("user_settlement_payment_repeat")
	public String user_settlement_payment_repeat(String oCode, ModelMap map) {
		String paymentForm = this.paymentServiceImpl.aliPayPaymentrRepeat(oCode);
		if(paymentForm!=null){
			map.put("paymentForm",paymentForm);
			return "user/payment/payment";
		}else {
			return "user/payment/error";
		}
	}
	
	@RequestMapping("user_review")
	public String user_review(int oiId, int proId, String proprImg, Double proprPromotePrice, String proName, ModelMap map) {
		map.put("proId",proId);
		map.put("proprImg",proprImg);
		map.put("proprPromotePrice",proprPromotePrice);
		map.put("proName",proName);
		map.put("oiId",oiId);
		return "user/user_review";
	}
	
	@RequestMapping(value="/review_add", produces="text/html; charset=utf-8")
	@ResponseBody
	public String review_add(int oiId, Review review, HttpSession session) {	
		return this.userServiceImpl.addReview(oiId, review, session);
	}
	
	@RequestMapping("user_wishlist")
	public String user_wishlist(HttpSession session, ModelMap map) {
		map.put("followProductVOList", this.userServiceImpl.selectUserWishlist(session));
		return "user/user_wishlist";
	}
	
	@RequestMapping("user_wishlist_del")
	public String user_wishlist_del(int followProductId) {
		this.userServiceImpl.deleteWishlist(followProductId);
		return "redirect:user_wishlist";
	}
	
	@RequestMapping(value="/user_wishlist_add", produces="text/html; charset=utf-8")
	@ResponseBody
	public String user_wishlist_add(int proId, HttpSession session) {
		return this.userServiceImpl.addWishlist(proId, session);
	}
	
	@RequestMapping("user_exit")
	public String user_exit(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("shoppingCartNumber");
		session.removeAttribute("propertyList");
		return "redirect:/";
	}
	
}
