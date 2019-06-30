package com.liuliu.com.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.liuliu.com.util.DateUtil;

@ControllerAdvice
public class ErrHandler {
	
	private static final Logger LOG = LoggerFactory.getLogger(ErrHandler.class);
	
	@ExceptionHandler({RuntimeException.class})
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView processException(RuntimeException exception){
		LOG.info(DateUtil.getNowDate()+"自定义异常处理-RuntimeException"+exception.getMessage());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/error/500.html");
		return mav;
	}
	
	@ExceptionHandler({Exception.class})
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView processException(Exception exception){
		LOG.info(DateUtil.getNowDate()+"统一异常处理-Exception"+exception.getMessage());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/error/500.html");
		return mav;
	}

}
