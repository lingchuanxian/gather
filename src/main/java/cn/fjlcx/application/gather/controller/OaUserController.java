package cn.fjlcx.application.gather.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fjlcx.application.gather.bean.OaUser;
import cn.fjlcx.application.gather.service.OaUserService;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */
@Controller
@RequestMapping("/oauser")
public class OaUserController {
	private Logger log = LoggerFactory.getLogger(OaUserController.class);
	@Autowired
	OaUserService mOaUserService;
	@RequestMapping("getUser")
	public void getUser(){
		OaUser oaUser = mOaUserService.selectOaUserByLoginName("admin");
		log.info("oaUser："+oaUser.toString());
	}
}
