package cn.fjlcx.application.gather.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fjlcx.application.gather.bean.OaUser;
import cn.fjlcx.application.gather.dao.OaUserDao;
import cn.fjlcx.application.gather.service.OaUserService;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */
@Service("OaUserService")
public class OaUserServiceImpl implements OaUserService{
	@Autowired
	OaUserDao mOaUserDao;
	public OaUser selectOaUserByLoginName(String loginName) {
		return mOaUserDao.selectOaUserByLoginName(loginName);
	}
}
