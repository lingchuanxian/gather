package cn.fjlcx.application.gather.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<OaUser> selectOaUserByPager(Map<String, Object> params) {
		return mOaUserDao.selectOaUserByPager(params);
	}

	@Override
	public List<OaUser> selectOaUserAll() {
		return mOaUserDao.selectOaUserAll();
	}

	@Override
	public int deleteOaUserById(int usId) {
		return mOaUserDao.deleteOaUserById(usId);
	}

	@Override
	public OaUser selectOaUserById(int usId) {
		return mOaUserDao.selectOaUserById(usId);
	}
}
