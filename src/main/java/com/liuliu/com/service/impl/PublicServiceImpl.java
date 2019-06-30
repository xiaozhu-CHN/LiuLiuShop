package com.liuliu.com.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liuliu.com.domain.Integral;
import com.liuliu.com.domain.ProProperty;
import com.liuliu.com.domain.ProductImage;
import com.liuliu.com.domain.ProductStore;
import com.liuliu.com.domain.SystemAdmin;
import com.liuliu.com.domain.User;
import com.liuliu.com.domain.Verification;
import com.liuliu.com.mapper.IntegralMapper;
import com.liuliu.com.mapper.ProPropertyMapper;
import com.liuliu.com.mapper.ProductImageMapper;
import com.liuliu.com.mapper.ProductMapper;
import com.liuliu.com.mapper.ProductStoreMapper;
import com.liuliu.com.mapper.ReviewMapper;
import com.liuliu.com.mapper.ShoppingCartInfoMapper;
import com.liuliu.com.mapper.SystemAdminMapper;
import com.liuliu.com.mapper.UserMapper;
import com.liuliu.com.mapper.VerificationMapper;
import com.liuliu.com.rabbit.config.MessageConfig;
import com.liuliu.com.service.PublicService;
import com.liuliu.com.util.DateUtil;
import com.liuliu.com.util.MD5;
import com.liuliu.com.vo.ProductCategoryVO;
import com.liuliu.com.vo.ProductSearchVO;
import com.liuliu.com.vo.ReviewVO;

@Service("PublicServiceImpl")
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private SystemAdminMapper systemAdminMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ProPropertyMapper proPropertyMapper;
	@Autowired
	private ProductImageMapper productImageMapper;
	@Autowired
	private ShoppingCartInfoMapper shoppingCartInfoMapper;
	@Autowired
	private ProductStoreMapper productStoreMapper;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private VerificationMapper verificationMapper;
	@Autowired
	private IntegralMapper integralMapper;
	
	private final RabbitTemplate rabbitTemplate;
	
	@Autowired
    public PublicServiceImpl(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }
	
	public SystemAdminMapper getSystemAdminMapper() {
		return systemAdminMapper;
	}

	public void setSystemAdminMapper(SystemAdminMapper systemAdminMapper) {
		this.systemAdminMapper = systemAdminMapper;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	public ProPropertyMapper getProPropertyMapper() {
		return proPropertyMapper;
	}

	public void setProPropertyMapper(ProPropertyMapper proPropertyMapper) {
		this.proPropertyMapper = proPropertyMapper;
	}

	public ProductImageMapper getProductImageMapper() {
		return productImageMapper;
	}

	public ShoppingCartInfoMapper getShoppingCartInfoMapper() {
		return shoppingCartInfoMapper;
	}

	public void setShoppingCartInfoMapper(ShoppingCartInfoMapper shoppingCartInfoMapper) {
		this.shoppingCartInfoMapper = shoppingCartInfoMapper;
	}

	public void setProductImageMapper(ProductImageMapper productImageMapper) {
		this.productImageMapper = productImageMapper;
	}

	public ProductStoreMapper getProductStoreMapper() {
		return productStoreMapper;
	}

	public void setProductStoreMapper(ProductStoreMapper productStoreMapper) {
		this.productStoreMapper = productStoreMapper;
	}
	
	public ReviewMapper getReviewMapper() {
		return reviewMapper;
	}

	public void setReviewMapper(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}
	
	public VerificationMapper getVerificationMapper() {
		return verificationMapper;
	}

	public void setVerificationMapper(VerificationMapper verificationMapper) {
		this.verificationMapper = verificationMapper;
	}

	public IntegralMapper getIntegralMapper() {
		return integralMapper;
	}

	public void setIntegralMapper(IntegralMapper integralMapper) {
		this.integralMapper = integralMapper;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public int systemAdminlogin(String sysAdminName, String sysAdminPwd, HttpSession session) {
		// TODO 管理员登陆的方法
		SystemAdmin systemAdmin = this.systemAdminMapper.selectfindByIdPwd(sysAdminName, MD5.md5(sysAdminPwd));
		if(systemAdmin!=null) {
			session.setAttribute("systemAdmin", systemAdmin);
			return 1;
		}
		return 2;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userRegister(User user) {
		// TODO 用户注册
		if(this.userMapper.selectfindByName(user.getUserName())==null) {
			String userPwd = MD5.md5(user.getUserPwd());
			user.setUserPwd(userPwd);
			user.setUserImg("default.png");
			user.setAuthId(1);
			user.setUserIntegral(2000);
			if(this.userMapper.insertUser(user)==1) {
				User user1 = this.userMapper.selectfindByName(user.getUserName());
				this.integralMapper.insertUserIntegral(new Integral(null, user1.getUserId(), 2000, 2, DateUtil.getNow()));
				return "success";
			}else {
				return "error2";
			}
		}else {
			return "error1";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public String userLogin(String userName, String userPwd, HttpSession session) {
		// TODO 用户登陆
		User user = this.userMapper.selectfindByNamePwd(userName, MD5.md5(userPwd));
		if(user!=null) {
			session.setAttribute("user", user);
			session.setAttribute("shoppingCartNumber", this.shoppingCartInfoMapper.countShoppingCartProprNumber(user.getUserId()));
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public ProductCategoryVO selectProduct(int proId) {
		// TODO 商品页
		ProductCategoryVO productCategoryVO = this.productMapper.selectByProId(proId);
		if(productCategoryVO!=null) {
			if(productCategoryVO.getProSell()==2) {
				return productCategoryVO;
			}
		}
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProProperty> selectPropertyAll(int proId) {
		// TODO 查询商品的所有属性
		return this.proPropertyMapper.selectFindByProcaId(proId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProductImage> selectProductImageAll(int proId) {
		// TODO 查询商品的所有展示大图
		return this.productImageMapper.selectFindByProId(proId);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public int productStorelogin(String productStoreName, String productStorePwd, HttpSession session) {
		// TODO 商家登陆
		ProductStore productStore = this.productStoreMapper.selectfindByIdPwd(productStoreName, MD5.md5(productStorePwd));
		if(productStore!=null) {
			session.setAttribute("productStore", productStore);
			return 1;
		}else {
			return 2;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String productStoreRegister(String productStoreName, String productStorePwd, String productStoreCall) {
		// TODO 商家注册
		if(this.productStoreMapper.countProductStoreName(productStoreName, productStoreCall)==0) {
			if(this.productStoreMapper.insertProductStore(productStoreName, MD5.md5(productStorePwd), productStoreCall)==1) {
				return "success";
			}else {
				return "error1";
			}
		}else {
			return "error";
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ReviewVO> productReviewAll(int proId) {
		// TODO 查询商品的评价
		return this.reviewMapper.selectReviewFindByProId(proId);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userMessageVerification(String voContent) {
		// TODO 用户手机验证码
		Verification verification1 = this.verificationMapper.selectPhoneVoVerification(voContent);
		if(verification1==null||DateUtil.getDifferSeconds(verification1.getVoTime())>=60) {
			String voVerification = Math.round(Math.random() * (9999-1000) +1000)+"";
			Verification verification = new Verification();
			verification.setVoVerification(voVerification);
			verification.setVoTime(DateUtil.getNow());
			verification.setEmailPower(2);
			verification.setVoContent(voContent);
			verification.setUserId(6);
			if(this.verificationMapper.insertVerification(verification)==1) {
				this.rabbitTemplate.convertAndSend(MessageConfig.MESSAGE_FAST_QUEUE, verification);
				return "success";
			}
		}
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public String userMessageBinding(String userPhone, String voVerification) {
		// TODO 验证用户手机的验证码
		Verification verification1 = this.verificationMapper.selectPhoneVoVerification(userPhone);
		if(verification1!=null) {
			if(verification1.getVoVerification().equals(voVerification)&&DateUtil.getDifferSeconds(verification1.getVoTime())<=600) {
				return "success";
			}
		}
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ProductSearchVO> selectProName(String proName) {
		// TODO 搜索商品
		return this.productMapper.selectProprName(proName);
	}
	
}
