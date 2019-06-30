package com.liuliu.com.service.impl;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.liuliu.com.domain.Area;
import com.liuliu.com.domain.City;
import com.liuliu.com.domain.Integral;
import com.liuliu.com.domain.Order;
import com.liuliu.com.domain.Orderitem;
import com.liuliu.com.domain.Province;
import com.liuliu.com.domain.Review;
import com.liuliu.com.domain.ShoppingCartInfo;
import com.liuliu.com.domain.User;
import com.liuliu.com.domain.UserAdressinfo;
import com.liuliu.com.domain.Verification;
import com.liuliu.com.mapper.AreaMapper;
import com.liuliu.com.mapper.CityMapper;
import com.liuliu.com.mapper.FollowProductMapper;
import com.liuliu.com.mapper.IntegralMapper;
import com.liuliu.com.mapper.OrderMapper;
import com.liuliu.com.mapper.OrderitemMapper;
import com.liuliu.com.mapper.ProPropertyMapper;
import com.liuliu.com.mapper.ProvinceMapper;
import com.liuliu.com.mapper.ReviewMapper;
import com.liuliu.com.mapper.ShoppingCartInfoMapper;
import com.liuliu.com.mapper.UserAdressinfoMapper;
import com.liuliu.com.mapper.UserMapper;
import com.liuliu.com.mapper.VerificationMapper;
import com.liuliu.com.rabbit.config.EmailConfig;
import com.liuliu.com.service.UserService;
import com.liuliu.com.util.Code;
import com.liuliu.com.util.DateUtil;
import com.liuliu.com.util.Upload;
import com.liuliu.com.vo.AdressinfoVO;
import com.liuliu.com.vo.CartPropertyProductVO;
import com.liuliu.com.vo.FollowProductVO;
import com.liuliu.com.vo.IntegralVO;
import com.liuliu.com.vo.OrderVO;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ShoppingCartInfoMapper shoppingCartInfoMapper;
	@Autowired
	private ProPropertyMapper proPropertyMapper;
	@Autowired
	private UserAdressinfoMapper userAdressinfoMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Resource
	private PaymentServiceImpl paymentServiceImpl;
	@Autowired
	private IntegralMapper integralMapper;
	@Autowired
	private VerificationMapper verificationMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private OrderitemMapper orderitemMapper;
	@Autowired
	private FollowProductMapper followProductMapper;
	
	
	private final RabbitTemplate rabbitTemplate;
	 
    @Autowired
    public UserServiceImpl(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public ShoppingCartInfoMapper getShoppingCartInfoMapper() {
		return shoppingCartInfoMapper;
	}

	public void setShoppingCartInfoMapper(ShoppingCartInfoMapper shoppingCartInfoMapper) {
		this.shoppingCartInfoMapper = shoppingCartInfoMapper;
	}

	public ProPropertyMapper getProPropertyMapper() {
		return proPropertyMapper;
	}

	public void setProPropertyMapper(ProPropertyMapper proPropertyMapper) {
		this.proPropertyMapper = proPropertyMapper;
	}

	public UserAdressinfoMapper getUserAdressinfoMapper() {
		return userAdressinfoMapper;
	}

	public void setUserAdressinfoMapper(UserAdressinfoMapper userAdressinfoMapper) {
		this.userAdressinfoMapper = userAdressinfoMapper;
	}

	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	public IntegralMapper getIntegralMapper() {
		return integralMapper;
	}

	public void setIntegralMapper(IntegralMapper integralMapper) {
		this.integralMapper = integralMapper;
	}

	public VerificationMapper getVerificationMapper() {
		return verificationMapper;
	}

	public void setVerificationMapper(VerificationMapper verificationMapper) {
		this.verificationMapper = verificationMapper;
	}

	public AreaMapper getAreaMapper() {
		return areaMapper;
	}

	public void setAreaMapper(AreaMapper areaMapper) {
		this.areaMapper = areaMapper;
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

	public ReviewMapper getReviewMapper() {
		return reviewMapper;
	}

	public void setReviewMapper(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	public OrderitemMapper getOrderitemMapper() {
		return orderitemMapper;
	}

	public void setOrderitemMapper(OrderitemMapper orderitemMapper) {
		this.orderitemMapper = orderitemMapper;
	}

	public FollowProductMapper getFollowProductMapper() {
		return followProductMapper;
	}

	public void setFollowProductMapper(FollowProductMapper followProductMapper) {
		this.followProductMapper = followProductMapper;
	}

	@Override
	public String userUploadLogo(MultipartFile file, HttpSession session) {
		// TODO 上传用户头像
		User user = (User) session.getAttribute("user");
		String filePath = "C:\\APP\\java\\spring boot\\eclipse-workspace\\liuliu\\src\\main\\resources\\static\\imgs\\user\\";
		String fileName = Upload.upload(file, filePath, (UUID.randomUUID()+"").replace("-", "")+user.getUserId());
		if(fileName!=null) {
			this.userMapper.updateUserLogo(fileName, user.getUserId());
			user.setUserImg(fileName);
			session.setAttribute("user", user);
			return "修改头像成功！";
		}else {
			return "修改头像失败！";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userUpate(String userCall, Integer userSex, int userId, HttpSession session) {
		// TODO 用户资料修改
		System.out.println("userSex:"+userSex);
		if(this.userMapper.updateUser(userCall, userSex, userId)==1) {
			session.setAttribute("user", this.userMapper.selectFindById(userId));
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userShoppingCartInfoAdd(int proprId, int shNum, HttpSession session) {
		// TODO 用户添加购物车
		User user = (User) session.getAttribute("user");
		ShoppingCartInfo shoppingCartInfo = this.shoppingCartInfoMapper.selectShoppingCartInfo(user.getUserId(), proprId);
		if(shoppingCartInfo==null) {
			if(this.proPropertyMapper.countFindByProprNumbe(proprId, shNum)==1) {
				if(this.shoppingCartInfoMapper.insertShoppingCartInfo(new ShoppingCartInfo(null, user.getUserId(), proprId, shNum))==1) {
					Integer shoppingCartNumber = (Integer) session.getAttribute("shoppingCartNumber");
					session.setAttribute("shoppingCartNumber", shoppingCartNumber+1);
					return "success1";
				}
			}
			return "error";
		}else {
			if(this.proPropertyMapper.countFindByProprNumbe(proprId, shoppingCartInfo.getShNum()+shNum)==1) {
				if(this.shoppingCartInfoMapper.updateShoppingCartInfo(shoppingCartInfo.getShNum()+shNum, shoppingCartInfo.getShId())==1) {
					return "success2";
				}
			}
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<CartPropertyProductVO> userShoppingCartInfo(HttpSession session) {
		// TODO 查询用户的购物车商品
		User user = (User) session.getAttribute("user");
		return this.shoppingCartInfoMapper.selectUserShoppingCartInfo(user.getUserId());
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userShoppingCartShNum(int shId, int shNum, int proprId) {
		// TODO 用户在购物车减少商品属性个数
		if(this.proPropertyMapper.countFindByProprNumbe(proprId, shNum)==1&&shNum>=1) {
			if(this.shoppingCartInfoMapper.updateShoppingCartInfo(shNum, shId)==1) {
				return "success";
			}
		}
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userDeleteShoppingCart(int shId, HttpSession session) {
		// TODO 用户移除购物车商品
		User user = (User) session.getAttribute("user");
		if(this.shoppingCartInfoMapper.deleteUserShoppingCartInfo(user.getUserId(), shId)==1) {
			Integer shoppingCartNumber = (Integer) session.getAttribute("shoppingCartNumber");
			session.setAttribute("shoppingCartNumber", shoppingCartNumber-1);
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<CartPropertyProductVO> userShoppingCartSettlement(String propertyList, HttpSession session) {
		// TODO 用户在购物车单击提交订单
		//将字符串转换
		List<Integer> propertyListInteger = Arrays.asList(propertyList.split(",")).stream().map(Integer::parseInt).collect(Collectors.toList());
		session.setAttribute("propertyList", propertyListInteger);
		return this.shoppingCartInfoMapper.selectShoppingCartSettlement(propertyListInteger);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<AdressinfoVO> userAdressinfoAll(HttpSession session) {
		// TODO 查询用户的地址
		User user = (User) session.getAttribute("user");
		return this.userAdressinfoMapper.selectUserAdressinfoAll(user.getUserId());
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userSettlementSubmit(int usadId,int integralNumber, String oiMessage, HttpSession session) {
		// TODO 用户提交订单
		@SuppressWarnings("unchecked")
		List<Integer> propertyList = (List<Integer>) session.getAttribute("propertyList");
		User user = (User) session.getAttribute("user");
		String[] oiMessageList = oiMessage.split(",");  //留言备注
		String oCode = Code.codeNumber(user.getUserId());  //获取到随机订单号
		BigDecimal oMoneyBig = this.paymentServiceImpl.totalPrice(propertyList); //获取订单总价
		BigDecimal totalAmount = new BigDecimal(0.00); //实际支付金额
		if(integralNumber!=0) {
			BigDecimal integralNumberBig = new BigDecimal(integralNumber).setScale(2,BigDecimal.ROUND_HALF_UP);
			totalAmount = oMoneyBig.subtract(integralNumberBig).setScale(2,BigDecimal.ROUND_HALF_UP);
		}else {
			totalAmount = oMoneyBig;
		}
		if(this.orderMapper.insertOrder(new Order(null,oCode,DateUtil.getNow(),(double)integralNumber,oMoneyBig.doubleValue(),user.getUserId(),usadId))==1) {
			//主订单插入成功。
			if(this.paymentServiceImpl.orderitemListAdd(integralNumber, oCode, oMoneyBig, oiMessageList, propertyList).equals("success")) { //分订单插入成功。
				this.paymentServiceImpl.cancelOrderRabbitMQ(oCode, propertyList); //延迟队列 适当的时候再解开
				String paymentForm = this.paymentServiceImpl.aliPayPayment(oCode, totalAmount, propertyList);//生成支付表单
				if(this.shoppingCartInfoMapper.deleteShoppingCartInfoList(propertyList)==propertyList.size()) { //删除数据库购物车
					Integer shoppingCartNumber = (Integer) session.getAttribute("shoppingCartNumber");
					session.setAttribute("shoppingCartNumber", shoppingCartNumber-propertyList.size()); //减少seesion购物车个数
					return paymentForm;
				}
			}
		}
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userIntegralShopping(int integralNumber, HttpSession session) {
		// TODO 查询用户积分并扣除购物的积分
		User userOld = (User) session.getAttribute("user");
		User user = this.userMapper.selectFindById(userOld.getUserId());
		if(integralNumber*100<=user.getUserIntegral()) {
			int number = (integralNumber - (2*integralNumber))*100;
			if(this.integralMapper.insertUserIntegral(new Integral(null,user.getUserId(),number,1,DateUtil.getNow()))==1) {
				if(this.userMapper.updateUserIntegral(user.getUserIntegral()-(integralNumber*100), user.getUserId())==1) {
					session.setAttribute("user", this.userMapper.selectFindById(user.getUserId()));
					return "success";
				}
			}
		}
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userEmailVerification(String voContent, HttpSession session) {
		// TODO 生成验证码并注入rabbit
		User user = (User) session.getAttribute("user");
		Verification verification1 = this.verificationMapper.selectVoVerification(user.getUserId(), 1);
		if(verification1==null||DateUtil.getDifferSeconds(verification1.getVoTime())>=60) {
			Verification verification = new Verification();
			verification.setVoVerification(Math.round(Math.random() * (9999-1000) +1000)+"");
			verification.setVoTime(DateUtil.getNow());
			verification.setEmailPower(1);
			verification.setVoContent(voContent);
			verification.setUserId(user.getUserId());
			if(this.verificationMapper.insertVerification(verification)==1) {
				this.rabbitTemplate.convertAndSend(EmailConfig.EMAIL_FAST_QUEUE, verification);
				return "success";
			}else {
				return "error";
			}
		}else {
			return "error";
		}
		
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userEmailBinding(String voContent, String voVerification, HttpSession session) {
		// TODO 填入邮箱
		User user = (User) session.getAttribute("user");
		Verification verification1 = this.verificationMapper.selectVoVerification(user.getUserId(), 1);
		if(verification1!=null) {
			if(voContent.equals(verification1.getVoContent())&&voVerification.equals(verification1.getVoVerification())&&DateUtil.getDifferSeconds(verification1.getVoTime())<=1800) {
				if(this.userMapper.updateUserEmail(voContent, user.getUserId())==1) {
					user.setUserEmail(voContent);
					session.setAttribute("user", user);
					return "success";
				}
			}
		}
		return "error";
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<IntegralVO> selectIntegralByUserId(HttpSession session) {
		// TODO 用户查询自己的积分
		User user = (User) session.getAttribute("user");
		List<IntegralVO> integralVOList = this.integralMapper.selectIntegralByUserId(user.getUserId());
		return integralVOList;
	}
	
	 //添加用户地址
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor={Exception.class} )
	public String userAdressInAdd(UserAdressinfo userAdressinfo) {
		this.userAdressinfoMapper.insertUserAdressinfo(userAdressinfo);
		return "success";
	}
		

    //根据用户Id查找用户地址
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<AdressinfoVO> userAdressinfoSelectByUserId(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<AdressinfoVO> adressinfoList = this.userAdressinfoMapper.selectUserAdressinfoByuserId(user.getUserId());
		return adressinfoList;
	}

    //根据用户收货地址Id修改收货地址
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public String userAdressinfoUpdateByUsadId(UserAdressinfo userAdressinfo) {		
		this.userAdressinfoMapper.updateUserAdressinfoByUsadIs(userAdressinfo);
		return "success";
	}

	//根据收货地址Id查找收货地址
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public UserAdressinfo userAdressinfoSelectByUsadId(int usadId) {
		UserAdressinfo userAdressinfo = this.userAdressinfoMapper.selectUserAdressinfoByusadId(usadId);
		return userAdressinfo ;
	}

	//根据收货地址Id删除收货地址
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public void userAdressinfoDeleteByUsadId(int usadId) {
		this.userAdressinfoMapper.deleteUserAdressinfoByusadId(usadId);
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
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<OrderVO> selectOrderitemByUserId(HttpSession session) {
		// TODO 更加userid查询用户订单
		User user = (User) session.getAttribute("user");
		List<OrderVO> OrderVOList = this.orderMapper.selectOrderitemByUserId(user.getUserId());
		return OrderVOList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public String updateOrderOsIdByoiId(int oiId) {
		//用户确认收货
		if(this.orderMapper.updateOrderOsIdByOiId(oiId)==1) {
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public void updateCodeAllOsId(String oCode) {
		// TODO 用户手动取消订单
		this.orderMapper.updateCodeAllOsId(oCode);
		List<Orderitem> orderitemList = this.orderitemMapper.selectOrderitem(oCode);
		for (Orderitem orderitem : orderitemList) {
			if(this.proPropertyMapper.updateProprNumberPlus(orderitem.getProprId(), orderitem.getOiNum())!=1) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
			}
		}
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public String addReview(int oiId, Review review, HttpSession session) {
		// TODO 用户评价
		User user = (User) session.getAttribute("user");
		review.setUserId(user.getUserId());
		review.setReDate(DateUtil.getNow());
		if(this.reviewMapper.insertReview(review)==1) {
			this.orderitemMapper.updataOsId(6, oiId);
			return "success";
		}else {
			return "error";
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<FollowProductVO> selectUserWishlist(HttpSession session) {
		// TODO 用户查询自己的收藏夹
		User user = (User) session.getAttribute("user");
		return this.followProductMapper.selectUserFollowProduct(user.getUserId());
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public void deleteWishlist(int followProductId) {
		// TODO 删除愿望单
		this.followProductMapper.deleteFollowProduct(followProductId);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public String addWishlist(int proId, HttpSession session) {
		// TODO 增加心愿单
		User user = (User) session.getAttribute("user");
		if(this.followProductMapper.countUserFollowProduct(proId, user.getUserId())==1) {
			return "error";
		}else {
			if(this.followProductMapper.insertUserFollowProduct(proId, user.getUserId())==1) {
				return "success";
			}
			return "error";
		}
	}
	
	
}
