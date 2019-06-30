package com.liuliu.com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.Authority;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Email;
import com.liuliu.com.domain.EmailInfo;
import com.liuliu.com.domain.ExpressCompany;
import com.liuliu.com.domain.MessageInfo;
import com.liuliu.com.domain.ProCategory;
import com.liuliu.com.domain.ProductStore;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.RabbitInfo;
import com.liuliu.com.domain.StoreType;
import com.liuliu.com.domain.SystemAdmin;
import com.liuliu.com.mapper.AreaMapper;
import com.liuliu.com.mapper.AuthorityMapper;
import com.liuliu.com.mapper.CityMapper;
import com.liuliu.com.mapper.EmailInfoMapper;
import com.liuliu.com.mapper.EmailMapper;
import com.liuliu.com.mapper.ExpressCompanyMapper;
import com.liuliu.com.mapper.MessageInfoMapper;
import com.liuliu.com.mapper.ProCategoryMapper;
import com.liuliu.com.mapper.ProductStoreMapper;
import com.liuliu.com.mapper.ProvinceMapper;
import com.liuliu.com.mapper.RabbitInfoMapper;
import com.liuliu.com.mapper.StoreTypeMapper;
import com.liuliu.com.mapper.SystemAdminMapper;
import com.liuliu.com.service.SystemAdminService;
import com.liuliu.com.util.MD5;
import com.liuliu.com.vo.ProductVO;
import com.liuliu.com.vo.ProvinceCityAreaVO;

@Service("SystemAdminServiceImpl")
public class SystemAdminServiceImpl implements SystemAdminService {
	
	@Autowired
	private SystemAdminMapper systemAdminMapper;
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private AuthorityMapper authorityMapper;
	@Autowired
	private ExpressCompanyMapper expressCompanyMapper;
	@Autowired
	private ProCategoryMapper proCategoryMapper;
	@Autowired
	private ProductStoreMapper productStoreMapper;
	@Autowired
	private StoreTypeMapper storeTypeMapper;
	@Autowired
	private EmailMapper emailMapper;
	@Autowired
	private RabbitInfoMapper rabbitInfoMapper;
	@Autowired
	private EmailInfoMapper emailInfoMapper;
	@Autowired
	private MessageInfoMapper messageInfoMapper;
	
	public SystemAdminMapper getSystemAdminMapper() {
		return systemAdminMapper;
	}

	public void setSystemAdminMapper(SystemAdminMapper systemAdminMapper) {
		this.systemAdminMapper = systemAdminMapper;
	}

	public ProvinceMapper getProvinceMapper() {
		return provinceMapper;
	}

	public void setProvinceMapper(ProvinceMapper provinceMapper) {
		this.provinceMapper = provinceMapper;
	}

	public CityMapper getCityMapper() {
		return cityMapper;
	}

	public void setCityMapper(CityMapper cityMapper) {
		this.cityMapper = cityMapper;
	}
	
	public AreaMapper getAreaMapper() {
		return areaMapper;
	}

	public void setAreaMapper(AreaMapper areaMapper) {
		this.areaMapper = areaMapper;
	}

	public AuthorityMapper getAuthorityMapper() {
		return authorityMapper;
	}

	public void setAuthorityMapper(AuthorityMapper authorityMapper) {
		this.authorityMapper = authorityMapper;
	}

	public ExpressCompanyMapper getExpressCompanyMapper() {
		return expressCompanyMapper;
	}

	public void setExpressCompanyMapper(ExpressCompanyMapper expressCompanyMapper) {
		this.expressCompanyMapper = expressCompanyMapper;
	}

	public ProCategoryMapper getProCategoryMapper() {
		return proCategoryMapper;
	}

	public void setProCategoryMapper(ProCategoryMapper proCategoryMapper) {
		this.proCategoryMapper = proCategoryMapper;
	}

	public ProductStoreMapper getProductStoreMapper() {
		return productStoreMapper;
	}

	public void setProductStoreMapper(ProductStoreMapper productStoreMapper) {
		this.productStoreMapper = productStoreMapper;
	}

	public StoreTypeMapper getStoreTypeMapper() {
		return storeTypeMapper;
	}

	public void setStoreTypeMapper(StoreTypeMapper storeTypeMapper) {
		this.storeTypeMapper = storeTypeMapper;
	}

	public EmailMapper getEmailMapper() {
		return emailMapper;
	}

	public void setEmailMapper(EmailMapper emailMapper) {
		this.emailMapper = emailMapper;
	}

	public RabbitInfoMapper getRabbitInfoMapper() {
		return rabbitInfoMapper;
	}

	public void setRabbitInfoMapper(RabbitInfoMapper rabbitInfoMapper) {
		this.rabbitInfoMapper = rabbitInfoMapper;
	}

	public EmailInfoMapper getEmailInfoMapper() {
		return emailInfoMapper;
	}

	public void setEmailInfoMapper(EmailInfoMapper emailInfoMapper) {
		this.emailInfoMapper = emailInfoMapper;
	}

	public MessageInfoMapper getMessageInfoMapper() {
		return messageInfoMapper;
	}

	public void setMessageInfoMapper(MessageInfoMapper messageInfoMapper) {
		this.messageInfoMapper = messageInfoMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String changCall(String sysAdminCall, HttpSession session) {
		// TODO 管理员修改自己的名字
		SystemAdmin systemAdmin=(SystemAdmin) session.getAttribute("systemAdmin");
		if(this.systemAdminMapper.updateFindByAdminCall(sysAdminCall, systemAdmin.getSysAdminId())==1) {
			systemAdmin.setSysAdminCall(sysAdminCall);
			session.setAttribute("systemAdmin", systemAdmin);
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public String selectName(String sysAdminName) {
		// TODO 添加管理员时查询是否有重名用户
		if(this.systemAdminMapper.selectfindByName(sysAdminName)==null) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addAdmin(SystemAdmin systemAdmin, HttpSession session) {
		// TODO 添加权限为1的管理员
		SystemAdmin systemAdmin1 = (SystemAdmin) session.getAttribute("systemAdmin");
		if(systemAdmin1.getAuthId()==2) {
			systemAdmin.setAuthId(1);
			String password = MD5.md5(systemAdmin.getSysAdminPwd());
			systemAdmin.setSysAdminPwd(password);
			if(this.systemAdminMapper.insertSystemAdmin(systemAdmin)==1) {
				return "success";
			}else {
				return "error";
			}
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Province> provinceAll() {
		// TODO 查询所有的省
		return this.provinceMapper.selectAllProvince();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String provinceAdd(String provinceName) {
		// TODO 增加省份
		if(this.provinceMapper.insertProvince(provinceName)==1) {
			return "添加省份："+provinceName+"成功";
		}else {
			return "添加省份："+provinceName+"失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateProvinceName(Province province) {
		// TODO 修改省份名字
		if(this.provinceMapper.updateProvince(province)==1) {
			return "修改省份名字成功！";
		}else {
			return "修改省份名字失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String deleteProvince(int provinceId) {
		// TODO 删除省份
		if(this.provinceMapper.deleteProvince(provinceId)==1) {
			return "删除成功！";
		}else {
			return "删除失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<City> cityByProvinceId(int provinceId) {
		// TODO 查询所有的市
	return this.cityMapper.selectCityByProvinceId(provinceId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Province findByProvinceName(int provinceId) {
		// TODO 根据省的Id查询名字
		return this.provinceMapper.selectByProvinceId(provinceId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String cityAdd(String cityName, int provinceId) {
		// TODO 添加新的城市
		if(this.cityMapper.insertCity(cityName, provinceId)==1) {
			return "添加城市："+cityName+"成功！";
		}else {
			return "添加城市："+cityName+"失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String cityDel(int cityId) {
		// TODO 删除城市
		if(this.cityMapper.deleteCity(cityId)==1) {
			return "删除成功！";
		}else {
			return "删除失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String cityUpdate(City city) {
		// TODO 修改城市名字
		if(this.cityMapper.updateCity(city)==1) {
			return "修改成功！";
		}else {
			return "修改失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Area> areaByCityId(int cityId) {
		// TODO 查询城市的所有县区
		return this.areaMapper.selectByCityId(cityId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public City findByCityName(int cityId) {
		// TODO 根据id查询城市类
		return this.cityMapper.selectCityByCityId(cityId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String areaAdd(String areaName, int cityId) {
		// TODO 增加区/县
		if(this.areaMapper.insertArea(areaName, cityId)==1) {
			return "添加区/县："+areaName+"成功！";
		}else {
			return "添加区/县："+areaName+"失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String areaDel(int areaId) {
		// TODO 删除区/县
		if(this.areaMapper.deleteArea(areaId)==1) {
			return "删除成功！";
		}else {
			return "删除失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String areaUpdate(Area area) {
		// TODO 修改区/县
		if(this.areaMapper.updateArea(area)==1) {
			return "修改成功！";
		}else {
			return "修改失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String adminPassword(String sysAdminPwdOld, String sysAdminPwdNew, HttpSession session) {
		// TODO 修改管理员密码
		SystemAdmin systemAdmin = (SystemAdmin) session.getAttribute("systemAdmin");
		if(this.systemAdminMapper.selectfindByIdPwd(systemAdmin.getSysAdminName(), MD5.md5(sysAdminPwdOld))!=null) {
			if(this.systemAdminMapper.updateFindByAdminPwd(MD5.md5(sysAdminPwdNew), systemAdmin.getSysAdminId())==1) {
				session.invalidate();
				return "success";
			}else {
				return "error";
			}
		}else {
			return "error";
		}
	}

	@Override
	public void adminExit(HttpSession session) {
		// TODO 退出系统
		session.invalidate();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Authority> authorityAll() {
		// TODO 查询所有用户权限的名称
		return this.authorityMapper.selectAuthorityAll();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String authorityAdd(String authName) {
		// TODO 添加权限名称
		if(this.authorityMapper.insertAuthority(authName)==1) {
			return "添加名称"+authName+"成功！";
		}else {
			return "添加名称"+authName+"失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String authorityUpdate(Authority authority) {
		// TODO 修改权限名称
		if(this.authorityMapper.updateAuthority(authority)==1) {
			return "修改成功！";
		}else {
			return "修改失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String authorityDelete(int authId) {
		// TODO 删除权限
		if(this.authorityMapper.deleteAuthority(authId)==1) {
			return "删除成功";
		}else {
			return "删除失败";
		}
		
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ExpressCompany> expressCompanyAll() {
		// TODO 查询所有快递公司
		return this.expressCompanyMapper.selectAllExpressCompany();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addExpressCompany(String expressCompanyName) {
		// TODO 添加快递公司
		if(this.expressCompanyMapper.insertExpressCompany(expressCompanyName)==1) {
			return "添加快递公司："+expressCompanyName+"成功";
		}else {
			return "添加快递公司："+expressCompanyName+"失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateExpressCompany(ExpressCompany expresscompany) {
		// TODO 修改快递公司
		if(this.expressCompanyMapper.updateExpressCompany(expresscompany)==1) {
			return "修改成功";
		}else {
			return "修改失败";
	}
}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String deleteExpressCompany(int expressCompanyId) {
		// TODO 删除快递公司
		if(this.expressCompanyMapper.deleteExpressCompany(expressCompanyId)==1) {
			return "删除成功";
		}else {
			return "删除失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProCategory> proCategoryAll() {
		// TODO 查所有商品类型
		return this.proCategoryMapper.selectAllProCategory();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addProCategory(String procaName) {
		// TODO 添加商品类型
		if(this.proCategoryMapper.insertProCategory(procaName)==1) {
			return "添加:"+procaName+"成功";
		}else {
			return "添加:"+procaName+"失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String deleteProCategory(int procaId) {
		// TODO 删除商品类型
		if(this.proCategoryMapper.deleteProCategory(procaId)==1) {
			return "删除成功";
		}else {
			return "删除失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateProCategory(ProCategory procategory) {
		// TODO 更新商品类型
		if(this.proCategoryMapper.updateProCategory(procategory)==1) {
			return "修改成功";
		}else {
			return "修改失败";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProductVO> productAll(int productStoreExamine) {
		// TODO 全部商家情况
		List<ProductVO> productVOList = new ArrayList<ProductVO>();
		List<ProductStore> productStoreList = new ArrayList<ProductStore>();
		if(productStoreExamine==0) {
			productStoreList = this.productStoreMapper.selectProductStoreAll(null);
		}else {
			productStoreList = this.productStoreMapper.selectProductStoreAll(productStoreExamine);
		}
		for (ProductStore productStore : productStoreList) {
			ProductVO productVO = new ProductVO();
			ProvinceCityAreaVO provinceCityAreaVO = this.areaMapper.selectProvinceCityAreaVO(productStore.getAreaId());
			List<StoreType> storeTypeList = this.storeTypeMapper.selectFinByProductStoreId(productStore.getProductStoreId());
			productVO.setProductStoreId(productStore.getProductStoreId());
			productVO.setProductStoreName(productStore.getProductStoreName());
			productVO.setProductStoreCall(productStore.getProductStoreCall());
			productVO.setProductStoreBank(productStore.getProductStoreBank());
			productVO.setProductStoreLicense(productStore.getProductStoreLicense());
			productVO.setProductStoreAdress(provinceCityAreaVO.getProvinceName() + " " + provinceCityAreaVO.getCityName() + " " +provinceCityAreaVO.getAreaName()+ " " + productStore.getProductStoreAdress());
			productVO.setProductStoreScore(productStore.getProductStoreScore());
			productVO.setProductStoreExamine(productStore.getProductStoreExamine());
			String storeTypeString = "";
			for (StoreType storeType : storeTypeList) {
				storeTypeString += this.proCategoryMapper.selectProcaName(storeType.getProcaId()).getProcaName() + " ";
			}
			productVO.setStoreType(storeTypeString);
			productVOList.add(productVO);
		}
		return productVOList;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String productExamine(int productStoreId, int productStoreExamine) {
		// TODO 修改店铺认证进度
		if(this.productStoreMapper.updateExamine(productStoreId, productStoreExamine)==1) {
			return "店铺ID："+productStoreId+"审核成功！";
		}else {
			return "店铺ID："+productStoreId+"审核失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Email selectEmail(int emailPower) {
		// TODO 查询邮箱配置
		return this.emailMapper.selectEmail(emailPower);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateEmail(Email email) {
		// TODO 修改邮箱配置
		if(this.emailMapper.updateEmail(email)==1) {
			return "修改邮箱配置成功！";
		}else {
			return "修改邮箱配置失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<RabbitInfo> selectRabbitInfoList() {
		// TODO 查询Rabbit记录
		return this.rabbitInfoMapper.selectRabbitInfoList();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<EmailInfo> selectEmailInfoList() {
		// TODO 查询邮箱发送记录
		return this.emailInfoMapper.selectEmailInfoList();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<MessageInfo> selectMessageInfoList() {
		// TODO 查询短信发送记录
		return this.messageInfoMapper.selectMessageInfoList();
	}
	
	
}

