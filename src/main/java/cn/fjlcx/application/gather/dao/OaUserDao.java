package cn.fjlcx.application.gather.dao;

import java.util.List;
import java.util.Map;

import cn.fjlcx.application.gather.bean.OaUser;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */

public interface OaUserDao {
	OaUser selectOaUserByLoginName(String loginName);
	List<OaUser> selectOaUserByPager(Map<String,Object> params);
	List<OaUser> selectOaUserAll();
}
