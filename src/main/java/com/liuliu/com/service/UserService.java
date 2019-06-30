package com.liuliu.com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.Review;
import com.liuliu.com.domain.UserAdressinfo;
import com.liuliu.com.vo.AdressinfoVO;
import com.liuliu.com.vo.CartPropertyProductVO;
import com.liuliu.com.vo.FollowProductVO;
import com.liuliu.com.vo.IntegralVO;
import com.liuliu.com.vo.OrderVO;

public interface UserService {
	public String userUploadLogo(MultipartFile file, HttpSession session);
	public String userUpate(String userCall, Integer userSex, int userId, HttpSession session);
	public String userShoppingCartInfoAdd(int proprId, int shNum, HttpSession session);
	public List<CartPropertyProductVO> userShoppingCartInfo(HttpSession session);
	public String userShoppingCartShNum(int shId, int shNum, int proprId);
	public String userDeleteShoppingCart(int shId, HttpSession session);
	public List<CartPropertyProductVO> userShoppingCartSettlement(String propertyList, HttpSession session);
	public List<AdressinfoVO> userAdressinfoAll(HttpSession session);
	public String userSettlementSubmit(int usadId, int integralNumber, String oiMessage, HttpSession session);
	public String userIntegralShopping(int integralNumber, HttpSession session);
	public String userEmailVerification(String voContent, HttpSession session);
	public String userEmailBinding(String voContent, String voVerification, HttpSession session);
	public List<IntegralVO> selectIntegralByUserId(HttpSession session);
	public String userAdressInAdd(UserAdressinfo userAdressinfo);
	public List<AdressinfoVO> userAdressinfoSelectByUserId(HttpSession session);
	public String userAdressinfoUpdateByUsadId(UserAdressinfo userAdressinfo);
	public UserAdressinfo userAdressinfoSelectByUsadId(int usadId);
	public void userAdressinfoDeleteByUsadId(int usadId);
	public List<Province> provinceAll(); 
	public List<City> cityAll(int provinceId);
	public List<Area> areaAll(int cityId);
	public List<OrderVO> selectOrderitemByUserId(HttpSession session);
	public String updateOrderOsIdByoiId(int oiId);
	public void updateCodeAllOsId(String oCode);
	public String addReview(int oiId, Review review, HttpSession session);
	public List<FollowProductVO> selectUserWishlist(HttpSession session);
	public void deleteWishlist(int followProductId);
	public String addWishlist(int proId, HttpSession session);
}
