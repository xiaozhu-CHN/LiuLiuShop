
package com.liuliu.com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.Authority;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Email;
import com.liuliu.com.domain.EmailInfo;
import com.liuliu.com.domain.ExpressCompany;
import com.liuliu.com.domain.MessageInfo;
import com.liuliu.com.domain.ProCategory;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.RabbitInfo;
import com.liuliu.com.domain.SystemAdmin;
import com.liuliu.com.vo.ProductVO;

public interface SystemAdminService {
	public String changCall(String sysAdminCall, HttpSession session);
	public String selectName(String sysAdminName);
	public String addAdmin(SystemAdmin systemAdmin, HttpSession session);
	public List<Province> provinceAll();
	public String provinceAdd(String provinceName);
	public String updateProvinceName(Province province);
	public String deleteProvince(int provinceId);
	public List<City> cityByProvinceId(int provinceId);
	public Province findByProvinceName(int provinceId);
	public String cityAdd(String cityName, int provinceId);
	public String cityDel(int cityId);
	public String cityUpdate(City city);
	public List<Area> areaByCityId(int cityId);
	public City findByCityName(int cityId);
	public String areaAdd(String areaName, int cityId);
	public String areaDel(int areaId);
	public String areaUpdate(Area area);
	public String adminPassword(String sysAdminPwdOld, String sysAdminPwdNew, HttpSession session);
	public void adminExit(HttpSession session);
	public List<Authority> authorityAll();
	public String authorityAdd(String authName);
	public String authorityUpdate(Authority authority);
	public String authorityDelete(int authId);
	
	public List<ExpressCompany> expressCompanyAll();
	public String addExpressCompany(String expressName);
	public String updateExpressCompany(ExpressCompany expresscompany);
	public String deleteExpressCompany(int expressCompanyId);
	
	public List<ProCategory> proCategoryAll();
	public String addProCategory(String procaName);
	public String deleteProCategory(int procaId);
	public String updateProCategory(ProCategory procategory);
	
	public List<ProductVO> productAll(int productStoreExamine);
	public String productExamine(int productStoreId, int productStoreExamine);
	
	public Email selectEmail(int emailPower);
	public String updateEmail(Email email);
	
	public List<RabbitInfo> selectRabbitInfoList();
	public List<EmailInfo> selectEmailInfoList();
	public List<MessageInfo> selectMessageInfoList();
}
