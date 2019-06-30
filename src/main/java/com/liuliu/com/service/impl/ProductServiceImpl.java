package com.liuliu.com.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Express;
import com.liuliu.com.domain.ExpressCompany;
import com.liuliu.com.domain.ProCategory;
import com.liuliu.com.domain.ProProperty;
import com.liuliu.com.domain.Product;
import com.liuliu.com.domain.ProductImage;
import com.liuliu.com.domain.ProductStore;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.StoreType;
import com.liuliu.com.mapper.AreaMapper;
import com.liuliu.com.mapper.CityMapper;
import com.liuliu.com.mapper.ExpressCompanyMapper;
import com.liuliu.com.mapper.ExpressMapper;
import com.liuliu.com.mapper.OrderitemMapper;
import com.liuliu.com.mapper.ProCategoryMapper;
import com.liuliu.com.mapper.ProPropertyMapper;
import com.liuliu.com.mapper.ProductImageMapper;
import com.liuliu.com.mapper.ProductMapper;
import com.liuliu.com.mapper.ProductStoreMapper;
import com.liuliu.com.mapper.ProvinceMapper;
import com.liuliu.com.mapper.StoreTypeMapper;
import com.liuliu.com.service.ProductService;
import com.liuliu.com.util.DateUtil;
import com.liuliu.com.util.MD5;
import com.liuliu.com.util.Upload;
import com.liuliu.com.vo.ProductOrderVO;
import com.liuliu.com.vo.ProvinceCityAreaVO;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private ProductStoreMapper productStoreMapper;
	@Autowired
	private ProCategoryMapper proCategoryMapper;
	@Autowired
	private StoreTypeMapper storeTypeMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ProductImageMapper productImageMapper;
	@Autowired
	private ProPropertyMapper proPropertyMapper;
	@Autowired
	private OrderitemMapper orderitemMapper;
	@Autowired
	private ExpressCompanyMapper expressCompanyMapper;
	@Autowired
	private ExpressMapper expressMapper;
	
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

	public ProductStoreMapper getProductStoreMapper() {
		return productStoreMapper;
	}

	public void setProductStoreMapper(ProductStoreMapper productStoreMapper) {
		this.productStoreMapper = productStoreMapper;
	}

	public ProCategoryMapper getProCategoryMapper() {
		return proCategoryMapper;
	}

	public void setProCategoryMapper(ProCategoryMapper proCategoryMapper) {
		this.proCategoryMapper = proCategoryMapper;
	}

	public StoreTypeMapper getStoreTypeMapper() {
		return storeTypeMapper;
	}

	public void setStoreTypeMapper(StoreTypeMapper storeTypeMapper) {
		this.storeTypeMapper = storeTypeMapper;
	}

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	public ProductImageMapper getProductImageMapper() {
		return productImageMapper;
	}

	public void setProductImageMapper(ProductImageMapper productImageMapper) {
		this.productImageMapper = productImageMapper;
	}

	public ProPropertyMapper getProPropertyMapper() {
		return proPropertyMapper;
	}

	public void setProPropertyMapper(ProPropertyMapper proPropertyMapper) {
		this.proPropertyMapper = proPropertyMapper;
	}

	public OrderitemMapper getOrderitemMapper() {
		return orderitemMapper;
	}

	public void setOrderitemMapper(OrderitemMapper orderitemMapper) {
		this.orderitemMapper = orderitemMapper;
	}

	public ExpressCompanyMapper getExpressCompanyMapper() {
		return expressCompanyMapper;
	}

	public void setExpressCompanyMapper(ExpressCompanyMapper expressCompanyMapper) {
		this.expressCompanyMapper = expressCompanyMapper;
	}

	public ExpressMapper getExpressMapper() {
		return expressMapper;
	}

	public void setExpressMapper(ExpressMapper expressMapper) {
		this.expressMapper = expressMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Province> provinceAll() {
		// TODO 查询所有的省
		return this.provinceMapper.selectAllProvince();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<City> cityAll(int provinceId) {
		// TODO 查询所有的市
		return this.cityMapper.selectCityByProvinceId(provinceId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Area> areaAll(int cityId) {
		// TODO 查询所有的区/县
		return this.areaMapper.selectByCityId(cityId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String productAuthentication(ProductStore productStore, MultipartFile prostoreFile, HttpSession session, Integer[] proca) {
		// TODO 商家提交认证
		ProductStore productStoreold = (ProductStore) session.getAttribute("productStore");
		String productStoreLicense = Upload.upload(prostoreFile, "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\product\\", MD5.md5(DateUtil.getNowNumber()+productStoreold.getProductStoreName()));
		productStore.setProductStoreLicense(productStoreLicense);
		productStore.setProductStoreId(productStoreold.getProductStoreId());
		for(int i=0;i<proca.length;i++) {
			if(this.storeTypeMapper.insertStoreType(productStoreold.getProductStoreId(), proca[i])!=1) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
			}
		}
		if(this.productStoreMapper.updateProductStore(productStore)==1) {
			session.setAttribute("productStore", this.productStoreMapper.selectFindById(productStoreold.getProductStoreId()));
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public ProvinceCityAreaVO provinceCityArea(int areaId) {
		// TODO 查询区的市和省
		return this.areaMapper.selectProvinceCityAreaVO(areaId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProCategory> allProCategory() {
		// TODO 查询所有的商品类型
		return this.proCategoryMapper.selectAllProCategory();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<StoreType> allStoreType(int productStoreId) {
		// TODO 查询商家的所有的类型
		return this.storeTypeMapper.selectFinByProductStoreId(productStoreId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Product> allProduct(int productStoreId) {
		// TODO 查询商家的所有商品
		return this.productMapper.selectByProductStoreId(productStoreId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProCategory> proCategoryList() {
		// TODO 查询所有类型
		return this.proCategoryMapper.selectAllProCategory();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addProduct(Product product, HttpSession session) {
		// TODO 增加商品
		ProductStore productStore = (ProductStore) session.getAttribute("productStore");
		product.setProductStoreId(productStore.getProductStoreId());
		product.setProCreatedate(DateUtil.getNow());
		product.setProSell(1);
		product.setProScore(5);
		if(this.productMapper.insertProduct(product)==1) {
			return "新增商品"+product.getProName()+"成功！";
		}else {
			return "新增商品"+product.getProName()+"失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String changeProduct(Product product) {
		// TODO 修改商品
		if(this.productMapper.updateProduct(product)==1) {
			return "修改商品ID："+product.getProId()+"成功！";
		}else {
			return "修改商品ID："+product.getProId()+"失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String changeProductSell(int proId, int proSell) {
		// TODO 修改商品上下架状态
		if(this.productMapper.updateProSell(proId, proSell)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String delProduct(int proId) {
		// TODO 删除商品
		if(this.productMapper.deleteProduct(proId)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProductImage> allProductImage(int proId) {
		// TODO 查询商品图片
		return this.productImageMapper.selectFindByProId(proId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addProductImage(MultipartFile proimgLinkOne, MultipartFile proimgLinkTwo,
			MultipartFile proimgLinkThree, int proId) {
		// TODO 增加商品图片
		String filePath = "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\proimg\\";
		String proimgLinkOneName = Upload.upload(proimgLinkOne, filePath, MD5.md5(DateUtil.getNowNumber()+proId+"one"));
		String proimgLinkTwoName = Upload.upload(proimgLinkTwo, filePath, MD5.md5(DateUtil.getNowNumber()+proId+"two"));
		String proimgLinkThreeName = Upload.upload(proimgLinkThree, filePath, MD5.md5(DateUtil.getNowNumber()+proId+"three"));
		ProductImage productImage = new ProductImage();
		productImage.setProId(proId);
		productImage.setProimgLinkOne(proimgLinkOneName);
		productImage.setProimgLinkTwo(proimgLinkTwoName);
		productImage.setProimgLinkThree(proimgLinkThreeName);
		if(this.productImageMapper.insertProductImage(productImage)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String delProductImage(int proimgId) {
		// TODO 删除商品图片
		if(this.productImageMapper.deleteProductImage(proimgId)==1) {
			return "success";
		}else {
			return "errpr";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProProperty> proPropertyAll(int proId) {
		// TODO 商品属性查询
		return this.proPropertyMapper.selectFindByProcaId(proId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String addProProperty(ProProperty proProperty, MultipartFile proprImgUpload) {
		// TODO 添加商品属性
		String proprImg = Upload.upload(proprImgUpload, "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\property\\", MD5.md5(DateUtil.getNowNumber()+proProperty.getProId()));
		proProperty.setProprImg(proprImg);
		if(this.proPropertyMapper.insertProProperty(proProperty)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public ProProperty selectFindByProprId(int proprId) {
		// TODO 查询单个商品属性
		return this.proPropertyMapper.selectFindByProprId(proprId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateProProperty(ProProperty proProperty, MultipartFile proprImgUpload) {
		// TODO 单个商品属性修改
		if(proprImgUpload!=null) {
			String proprImg = Upload.upload(proprImgUpload, "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\property\\", MD5.md5(DateUtil.getNowNumber()+proProperty.getProId()));
			proProperty.setProprImg(proprImg);
		}
		if(this.proPropertyMapper.updateProProperty(proProperty)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String delProProperty(int proprId) {
		// TODO 删除商品属性
		if(this.proPropertyMapper.deleteProProperty(proprId)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public String proIntroduce(int proId) {
		// TODO 查询商品的简介
		return this.productMapper.selectProIntroduce(proId);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateProIntroduce(int proId, String proIntroduce) {
		// TODO 修改商品简介
		if(this.productMapper.updateProIntroduce(proId, proIntroduce)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProductOrderVO> selectProductOrderAll(HttpSession session, Integer osId) {
		// TODO 商家查询所有的订单
		ProductStore productStore = (ProductStore) session.getAttribute("productStore");
		return this.orderitemMapper.selectProductOrder(productStore.getProductStoreId(), osId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ExpressCompany> selsectExpressCompanyAll() {
		// TODO 查询所有的物流公司
		return this.expressCompanyMapper.selectAllExpressCompany();
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String expressDeliver(Express express) {
		// TODO 商家发货
		express.setExpressDeliverydate(DateUtil.getNow());
		if(this.expressMapper.insertExpress(express)==1) {
			if(this.orderitemMapper.updataOsId(3, express.getOiId())==1) {
				return "success";
			}
		}
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String updateProductPwd(String oldProductStorePwd, String productStorePwd, HttpSession session) {
		// TODO 商家修改密码
		ProductStore productStore = (ProductStore) session.getAttribute("productStore");
		if(this.productStoreMapper.selectfindByIdPwd(productStore.getProductStoreName(), MD5.md5(oldProductStorePwd))!=null) {
			if(this.productStoreMapper.updateProductStorePwd(MD5.md5(productStorePwd), productStore.getProductStoreId())==1) {
				session.removeAttribute("productStore");
				return "success";
			}
		}
		return "error";
	}
	
	
}
