package cn.fjlcx.application.gather.service;

import cn.fjlcx.application.gather.bean.OaUser;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */

public interface OaUserService {
	OaUser selectOaUserByLoginName(String loginName);
}
