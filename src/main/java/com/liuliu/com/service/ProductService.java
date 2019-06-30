package com.liuliu.com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.liuliu.com.vo.ProductOrderVO;
import com.liuliu.com.vo.ProvinceCityAreaVO;

public interface ProductService {
	public List<Province> provinceAll(); 
	public List<City> cityAll(int provinceId);
	public List<Area> areaAll(int cityId);
	public String productAuthentication(ProductStore productStore, MultipartFile prostoreFile, HttpSession session, Integer[] proca); 
	public ProvinceCityAreaVO provinceCityArea(int areaId);
	public List<ProCategory> allProCategory();
	public List<StoreType> allStoreType(int productStoreId);
	public List<Product> allProduct(int productStoreId);
	public List<ProCategory> proCategoryList();
	public String addProduct(Product product, HttpSession session);
	public String changeProduct(Product product);
	public String changeProductSell(int proId, int proSell);
	public String delProduct(int proId);
	public List<ProductImage> allProductImage(int proId);
	public String addProductImage(MultipartFile proimgLinkOne, MultipartFile proimgLinkTwo, MultipartFile proimgLinkThree, int proId);
	public String delProductImage(int proimgId);
	public List<ProProperty> proPropertyAll(int proId);
	public String addProProperty(ProProperty proProperty, MultipartFile proprImgUpload);
	public ProProperty selectFindByProprId(int proprId);
	public String updateProProperty(ProProperty proProperty, MultipartFile proprImgUpload);
	public String delProProperty(int proprId);
	public String proIntroduce(int proId);
	public String updateProIntroduce(int proId, String proIntroduce);
	public List<ProductOrderVO> selectProductOrderAll(HttpSession session, Integer osId);
	public List<ExpressCompany> selsectExpressCompanyAll();
	public String expressDeliver(Express express);
	public String updateProductPwd(String oldProductStorePwd, String productStorePwd, HttpSession session);
}
