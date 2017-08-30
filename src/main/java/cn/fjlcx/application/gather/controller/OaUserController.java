package cn.fjlcx.application.gather.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.fjlcx.application.gather.bean.OaUser;
import cn.fjlcx.application.gather.service.OaUserService;

/**
 * class description here
 * author ling_cx
 * date 2017/8/29.
 */
@Controller
@RequestMapping("admin/oauser")
public class OaUserController {
	private Logger log = LoggerFactory.getLogger(OaUserController.class);
	@Autowired
	OaUserService mOaUserService;

	@RequestMapping("list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(defaultValue = "0") Integer pageNo, @RequestParam(defaultValue = "20") Integer limit){
		log.info("查询：pageNo=="+pageNo+"--limit=="+limit);
		PageHelper.startPage(pageNo, limit);
		List<OaUser> list = mOaUserService.selectOaUserAll();
		PageInfo pageInfo = new PageInfo(list);
		Map<String, Object> params = new HashMap<>();
		params.put("total",pageInfo.getTotal());
		params.put("rows",pageInfo.getList());
		return params;
	}
}
