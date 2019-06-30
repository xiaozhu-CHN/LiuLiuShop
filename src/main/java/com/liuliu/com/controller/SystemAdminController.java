package com.liuliu.com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.Authority;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Email;
import com.liuliu.com.domain.ExpressCompany;
import com.liuliu.com.domain.ProCategory;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.SystemAdmin;
import com.liuliu.com.service.impl.SystemAdminServiceImpl;
import com.liuliu.com.util.Code;

@Controller("SystemAdminController")
@RequestMapping("/admin")
public class SystemAdminController {
	
	@Resource
	private SystemAdminServiceImpl systemAdminServiceImpl;
	
	@RequestMapping("index")
    public String adminindex(){
        return "admin/index";
    }
	
	@RequestMapping("welcome")
    public String welcome(){
        return "admin/welcome";
    }
	
	@RequestMapping(value="/chang_call", produces="text/html; charset=utf-8")
	@ResponseBody
	public String chang_call(String sysAdminCall,HttpSession session) {
		return this.systemAdminServiceImpl.changCall(sysAdminCall,session);	
	}
	
	@RequestMapping("system_admin_add")
	public String system_admin_add() {
		return "admin/systemadmin/system_admin_add";
	}
	
	@RequestMapping(value="/select_name", produces="text/html; charset=utf-8")
	@ResponseBody
	public String select_name(String sysAdminName) {
		return this.systemAdminServiceImpl.selectName(sysAdminName);
	}
	
	@RequestMapping(value="/add_admin", produces="text/html; charset=utf-8")
	@ResponseBody
	public String add_admin(SystemAdmin systemAdmin,HttpSession session) {
		return this.systemAdminServiceImpl.addAdmin(systemAdmin, session);
	}
	
	@RequestMapping("province")
	public String province(String msg, ModelMap map) {
		map.put("provinceList", this.systemAdminServiceImpl.provinceAll());
		map.put("msg", msg);
		return "admin/address/province";
	}
	
	@RequestMapping("province_add")
	public String province_add(String provinceName) {
		return "redirect:province?msg="+Code.code(this.systemAdminServiceImpl.provinceAdd(provinceName));
	}
	
	@RequestMapping("province_update_name")
	public String province_update_name(Province province) {
		return "redirect:province?msg="+Code.code(this.systemAdminServiceImpl.updateProvinceName(province));
	}
	
	@RequestMapping("province_delete")
	public String province_delete(int provinceId) {
		return "redirect:province?msg="+Code.code(this.systemAdminServiceImpl.deleteProvince(provinceId));
	}
	
	@RequestMapping("city")
	public String city(String msg, int provinceId, ModelMap map) {
		map.put("cityList", this.systemAdminServiceImpl.cityByProvinceId(provinceId));
		map.put("province", this.systemAdminServiceImpl.findByProvinceName(provinceId));
		map.put("msg",msg);
		return "admin/address/city";
	}
	
	@RequestMapping("city_add")
	public String city_add(String cityName, int provinceId) {
		return "redirect:city?msg="+Code.code(this.systemAdminServiceImpl.cityAdd(cityName, provinceId))+"&provinceId="+provinceId;
	}
	
	@RequestMapping("city_del")
	public String city_del(int cityId, int provinceId) {
		return "redirect:city?msg="+Code.code(this.systemAdminServiceImpl.cityDel(cityId))+"&provinceId="+provinceId;
	}
	
	@RequestMapping("city_update")
	public String city_update(City city) {
		return "redirect:city?msg="+Code.code(this.systemAdminServiceImpl.cityUpdate(city))+"&provinceId="+city.getProvinceId();
	}
	
	@RequestMapping("area")
	public String area(String msg, int cityId, ModelMap map) {
		map.put("areaList", this.systemAdminServiceImpl.areaByCityId(cityId));
		map.put("city", this.systemAdminServiceImpl.findByCityName(cityId));
		map.put("msg", msg);
		return "admin/address/area";
	}
	
	@RequestMapping("area_add")
	public String area_add(String areaName, int cityId) {
		return "redirect:area?msg="+Code.code(this.systemAdminServiceImpl.areaAdd(areaName, cityId))+"&cityId="+cityId;
	}
	
	@RequestMapping("area_del")
	public String area_del(int areaId, int cityId) {
		return "redirect:area?msg="+Code.code(this.systemAdminServiceImpl.areaDel(areaId))+"&cityId="+cityId;
	}
	
	@RequestMapping("area_update_name")
	public String area_update_name(Area area) {
		return "redirect:area?msg="+Code.code(this.systemAdminServiceImpl.areaUpdate(area))+"&cityId="+area.getCityId();
	}
	
	@RequestMapping(value="/admin_updata_password", produces="text/html; charset=utf-8")
	@ResponseBody
	public String admin_updata_password(String sysAdminPwdOld, String sysAdminPwdNew, HttpSession session) {
		return this.systemAdminServiceImpl.adminPassword(sysAdminPwdOld, sysAdminPwdNew, session);
	}
	
	
	@RequestMapping("authority")
	public String authority(String msg, ModelMap map) {
		map.put("authorityList", this.systemAdminServiceImpl.authorityAll());
		map.put("msg", msg);
		return "admin/systemadmin/authority";
	}
	
	@RequestMapping("authority_add")
	public String authority_add(String authName) {
		return "redirect:authority?msg="+Code.code(this.systemAdminServiceImpl.authorityAdd(authName));
	}
	
	@RequestMapping("authority_update")
	public String authority_update(Authority authority) {
		return "redirect:authority?msg="+Code.code(this.systemAdminServiceImpl.authorityUpdate(authority));
	}
	
	@RequestMapping("authority_delete")
	public String authority_delete(int authId) {
		return "redirect:authority?msg="+Code.code(this.systemAdminServiceImpl.authorityDelete(authId));
	}
	
	@RequestMapping("expressCompany")
	public String expressCompany(String msg, ModelMap map) {
		map.put("expressCompanyList", this.systemAdminServiceImpl.expressCompanyAll());
		map.put("msg", msg);
		return "admin/systemadmin/expressCompany";
	}
	
	@RequestMapping("expressCompany_add")
	public String expressCompany_add(String expressCompanyName) {
		return "redirect:expressCompany?msg="+Code.code(this.systemAdminServiceImpl.addExpressCompany(expressCompanyName));
	}
	
	@RequestMapping("expressCompany_del")
	public String expressCompany_del(int expressCompanyId) {
		return "redirect:expressCompany?msg="+Code.code(this.systemAdminServiceImpl.deleteExpressCompany(expressCompanyId));
	}
	
	@RequestMapping("expressCompany_update")
	public String expressCompany_update(ExpressCompany expressCompany) {
		return "redirect:expressCompany?msg="+Code.code(this.systemAdminServiceImpl.updateExpressCompany(expressCompany));
	}

	@RequestMapping("proCategory")
	public String proCategory(String msg,ModelMap map) {
		map.put("proCategoryList",this.systemAdminServiceImpl.proCategoryAll());
		map.put("msg",msg);
		return "admin/systemadmin/proCategory";
	}
	
	@RequestMapping("proCategory_add")
	public String proCategory_add(String procaName) {
		return "redirect:proCategory?msg="+Code.code(this.systemAdminServiceImpl.addProCategory(procaName));
	}
	
	@RequestMapping("proCategory_delete")
	public String proCategory_delete(int procaId) {
		return "redirect:proCategory?msg="+Code.code(this.systemAdminServiceImpl.deleteProCategory(procaId));
	}
	
	@RequestMapping("proCategory_update")
	public String proCategory_update(ProCategory proCategory) {
		return "redirect:proCategory?msg="+Code.code(this.systemAdminServiceImpl.updateProCategory(proCategory));
	}
	
	@RequestMapping("product")
	public String product(int productStoreExamine, String msg, ModelMap map) {
		map.put("productVOList", this.systemAdminServiceImpl.productAll(productStoreExamine));
		map.put("msg",msg);
		return "admin/systemadmin/product";
	}
	
	@RequestMapping("product_examine")
	public String product_examine(int productStoreExamine, int productStoreId) {
		return "redirect:product?msg="+Code.code(this.systemAdminServiceImpl.productExamine(productStoreId, productStoreExamine))+"&productStoreExamine=1";
	}
	
	@RequestMapping("admin_exit")
	public String admin_exit(HttpSession session) {
		session.removeAttribute("systemAdmin");
		return "redirect:/publicpage/adminlogin";
	}
	
	@RequestMapping("base")
	public String base(ModelMap map) {
		map.put("email",this.systemAdminServiceImpl.selectEmail(1));
		return "admin/systemadmin/base";
	}
	
	@RequestMapping("email_update")
	public String email_update(Email email, ModelMap map) {
		map.put("msg",this.systemAdminServiceImpl.updateEmail(email));
		map.put("email",this.systemAdminServiceImpl.selectEmail(1));
		return "admin/systemadmin/base";
	}
	
	@RequestMapping("rabbit_info")
	public String rabbit_info(ModelMap map) {
		map.put("rabbitInfoList", this.systemAdminServiceImpl.selectRabbitInfoList());
		return "admin/info/rabbit_info";
	}
	
	@RequestMapping("email_info")
	public String email_info(ModelMap map) {
		map.put("emailInfoList", this.systemAdminServiceImpl.selectEmailInfoList());
		return "admin/info/email_info";
	}
	
	@RequestMapping("message_info")
	public String message_info(ModelMap map) {
		map.put("messageInfoList", this.systemAdminServiceImpl.selectMessageInfoList());
		return "admin/info/message_info";
	}
}
