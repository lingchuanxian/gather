package cn.fjlcx.application.gather.controller;


import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.fjlcx.application.gather.bean.OaUser;
import cn.fjlcx.application.gather.global.Result;
import cn.fjlcx.application.gather.global.ResultGenerator;
import cn.fjlcx.application.gather.service.OaUserService;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */
@Controller
public class CommonController {
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	@Resource
	OaUserService mOaUserService;
	@Resource
	HttpSession session;

	private Producer captchaProducer = null;

	@Autowired
	public void setCaptchaProducer(Producer captchaProducer){
		this.captchaProducer = captchaProducer;
	}

	@RequestMapping(value = "dologin",method = RequestMethod.POST)
	@ResponseBody
	public Result dologin(@RequestParam String username, @RequestParam String password, @RequestParam String code){
		logger.info("username:"+username+";password:"+password+";code:"+code);
		String orCode = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
			return  ResultGenerator.genFailResult("用户名或密码不能为空");
		}else if(!code.equals(orCode)){
			return  ResultGenerator.genFailResult("您输入的验证码有误");
		}
		//验证
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject currentUser = SecurityUtils.getSubject();
		try {
			logger.info("对用户[" + username + "]进行登录验证..验证开始");
			currentUser.login(token);
			logger.info("对用户[" + username + "]进行登录验证..验证通过");
		}catch(UnknownAccountException uae){
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
			return  ResultGenerator.genFailResult("未知账户");
		}catch(IncorrectCredentialsException ice){
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
			return  ResultGenerator.genFailResult("密码不正确");
		}catch(LockedAccountException lae){
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
			return  ResultGenerator.genFailResult("账户已锁定");
		}catch(ExcessiveAttemptsException eae){
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误次数大于5次,账户已锁定");
			return  ResultGenerator.genFailResult("用户名或密码错误次数大于5次,账户已锁定");
		}catch (DisabledAccountException sae){
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,帐号已经禁止登录");
			return  ResultGenerator.genFailResult("帐号已经禁止登录");
		}catch(AuthenticationException ae){
			//通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
			//ae.printStackTrace();
			return  ResultGenerator.genFailResult("用户名或密码不正确");
		}
		if(currentUser.isAuthenticated()){
			logger.info("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
			Session session = currentUser.getSession();
			OaUser oaUser = mOaUserService.selectOaUserByLoginName(username);
			session.setAttribute("currentUser",oaUser);
			return  ResultGenerator.genSuccessResult().setMessage("登录成功");
		}else{
			token.clear();
			return  ResultGenerator.genFailResult("登录失败");
		}
	}

	@RequestMapping("logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout();
		}
		return "redirect:login.shtml";
	}

	@RequestMapping("imageCode")
	public void getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");
		String capText = captchaProducer.createText();
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		logger.info("code："+capText);
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
	}

	@RequiresAuthentication
	@RequestMapping("admin/index")
	public String index(){
		return "authc/index";
	}

	@RequestMapping("genPassword")
	public void genPassword(String password,String loginName){
		logger.info("password:"+password+"<--->loginName:"+loginName);
		SimpleHash sh = new SimpleHash("MD5",password, ByteSource.Util.bytes(loginName),1024);
		logger.info(sh.toString());
	}

}
