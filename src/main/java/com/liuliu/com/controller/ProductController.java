package com.liuliu.com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.liuliu.com.domain.Express;
import com.liuliu.com.domain.ProProperty;
import com.liuliu.com.domain.Product;
import com.liuliu.com.domain.ProductStore;
import com.liuliu.com.service.impl.ProductServiceImpl;
import com.liuliu.com.util.Code;

@Controller("ProductController")
@RequestMapping("/product")
public class ProductController {
	
	@Resource
	private ProductServiceImpl productServiceImpl;
	
	@RequestMapping("index")
    public String index(){
        return "product/index";
    }
	
	@RequestMapping("welcome")
    public String welcome(){
        return "product/welcome";
    }
	
	@RequestMapping("authentication")
	public String authentication(ModelMap map,HttpSession session) {
		ProductStore productStore = (ProductStore) session.getAttribute("productStore");
		map.put("provinceList", this.productServiceImpl.provinceAll());
		map.put("proCategoryList", this.productServiceImpl.allProCategory());
		if(productStore.getProductStoreExamine()!=3) {
			map.put("provinceCityAreaVO", this.productServiceImpl.provinceCityArea(productStore.getAreaId()));
			map.put("storeTypeList", this.productServiceImpl.allStoreType(productStore.getProductStoreId()));
		}
		return "product/store/authentication";
	}
	
	@RequestMapping("city_all")
	@ResponseBody
	public Object city_all(int provinceId) {
		return this.productServiceImpl.cityAll(provinceId);
	}

	@RequestMapping("area_all")
	@ResponseBody
	public Object area_all(int cityId) {
		return this.productServiceImpl.areaAll(cityId);
	}
	
	@RequestMapping(value="/authentication_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String authentication_form(ProductStore productStore, MultipartFile prostoreFile, HttpSession session,Integer[] proca) {
		return this.productServiceImpl.productAuthentication(productStore, prostoreFile, session, proca);
	}
	
	@RequestMapping("product")
	public String product(ModelMap map, String msg, HttpSession session) {
		ProductStore productStore = (ProductStore) session.getAttribute("productStore");
		map.put("msg",msg);
		map.put("productList", this.productServiceImpl.allProduct(productStore.getProductStoreId()));
		map.put("proCategoryList", this.productServiceImpl.proCategoryList());
		map.put("storeTypeList",this.productServiceImpl.allStoreType(productStore.getProductStoreId()));
		return "product/product/product";
	}
	
	@RequestMapping("product_form")
	public String product_form(Product product,HttpSession session) {
		return "redirect:product?msg="+Code.code(this.productServiceImpl.addProduct(product, session));
	}
	
	@RequestMapping("product_form_update")
	public String product_form_update(Product product) {
		return "redirect:product?msg="+Code.code(this.productServiceImpl.changeProduct(product));
	}
	
	@RequestMapping(value="/product_pro_sell", produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_pro_sell(int proId, int proSell) {
		return this.productServiceImpl.changeProductSell(proId, proSell);
	}
	
	@RequestMapping(value="/product_del", produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_del(int proId) {
		return this.productServiceImpl.delProduct(proId);
	}
	
	@RequestMapping("product_image")
	public String product_image(int proId, String msg, ModelMap map) {
		map.put("productImageList", this.productServiceImpl.allProductImage(proId));
		map.put("proId",proId);
		return "product/product/product_proimg";
	}
	
	@RequestMapping(value="/product_image_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_image_form(MultipartFile proimgLinkOne, MultipartFile proimgLinkTwo, MultipartFile proimgLinkThree, int proId) {
		return this.productServiceImpl.addProductImage(proimgLinkOne, proimgLinkTwo, proimgLinkThree, proId);
	}
	
	@RequestMapping(value="/product_image_del", produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_image_del(int proimgId) {
		return this.productServiceImpl.delProductImage(proimgId);
	}
	
	@RequestMapping("pro_property")
	public String pro_property(int proId, String msg, ModelMap map) {
		map.put("proPropertyList", this.productServiceImpl.proPropertyAll(proId));
		map.put("proId",proId);
		return "product/product/pro_property";
	}
	
	@RequestMapping(value="/pro_property_add", produces="text/html; charset=utf-8")
	@ResponseBody
	public String pro_property_add(ProProperty proProperty, MultipartFile proprImgUpload) {
		return this.productServiceImpl.addProProperty(proProperty, proprImgUpload);
	}
	
	@RequestMapping("pro_property_update")
	public String pro_property_update(int proprId, ModelMap map) {
		map.put("proProperty",this.productServiceImpl.selectFindByProprId(proprId));
		return "product/product/pro_property_update";
	}
	
	@RequestMapping(value="/pro_property_update_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String pro_property_update_form(ProProperty proProperty, MultipartFile proprImgUpload) {
		return this.productServiceImpl.updateProProperty(proProperty, proprImgUpload);
	}
	
	@RequestMapping(value="/pro_property_del", produces="text/html; charset=utf-8")
	@ResponseBody
	public String pro_property_del(int proprId) {
		return this.productServiceImpl.delProProperty(proprId);
	}
	
	@RequestMapping("pro_introduce")
	public String pro_introduce(int proId, ModelMap map) {
		map.put("proId",proId);
		map.put("proIntroduce",this.productServiceImpl.proIntroduce(proId));
		return "product/product/pro_introduce";
	}
	
	@RequestMapping(value="/pro_introduce_update", produces="text/html; charset=utf-8")
	@ResponseBody
	public String pro_introduce_update(int proId, String proIntroduce) {
		return this.productServiceImpl.updateProIntroduce(proId, proIntroduce);
	}
	
	@RequestMapping("order_all")
	public String order_all(HttpSession session, ModelMap map) {
		map.put("productOrderVOList", this.productServiceImpl.selectProductOrderAll(session, null));
		return "product/order/order_all";
	}
	
	@RequestMapping("order_shipped")
	public String order_shipped(HttpSession session, ModelMap map) {
		map.put("productOrderVOList", this.productServiceImpl.selectProductOrderAll(session, 2));
		map.put("expressCompanyList", this.productServiceImpl.selsectExpressCompanyAll());
		return "product/order/order_shipped";
	}
	
	@RequestMapping(value="/order_shipped_form", produces="text/html; charset=utf-8")
	@ResponseBody
	public String order_shipped_form(Express express) {
		return this.productServiceImpl.expressDeliver(express);
	}
	
	@RequestMapping("order_received")
	public String order_reecived(HttpSession session, ModelMap map) {
		map.put("productOrderVOList", this.productServiceImpl.selectProductOrderAll(session, 3));
		return "product/order/order_received";
	}
	
	@RequestMapping("order_completed")
	public String order_completed(HttpSession session, ModelMap map) {
		map.put("productOrderVOList", this.productServiceImpl.selectProductOrderAll(session, 4));
		return "product/order/order_completed";
	}
	
	@RequestMapping("order_cancel")
	public String order_cancel(HttpSession session, ModelMap map) {
		map.put("productOrderVOList", this.productServiceImpl.selectProductOrderAll(session, 5));
		return "product/order/order_cancel";
	}
	
	@RequestMapping("product_exit")
	public String product_exit(HttpSession session) {
		session.removeAttribute("productStore");
		return "redirect:/publicpage/prostore_login";
	}
	
	@RequestMapping(value="/product_pwd_update", produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_pwd_update(String oldProductStorePwd,String productStorePwd, HttpSession session) {
		return this.productServiceImpl.updateProductPwd(oldProductStorePwd, productStorePwd, session);
	}
}
