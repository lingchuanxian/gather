package cn.fjlcx.application.gather.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping("admin/oauser")
@RequiresRoles("ADMIN")
public class OaUserController {
	private Logger log = LoggerFactory.getLogger(OaUserController.class);
	@Autowired
	OaUserService mOaUserService;

	@RequestMapping("/list")
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

	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	@ResponseBody
	public Result delete(@RequestParam String ids){
		int val = 0;
		String[] id = ids.split(",");
		for (int i = 0;i < id.length;i++){
			val = mOaUserService.deleteOaUserById(Integer.parseInt(id[i]));
		}
		if(val == 1){
			return ResultGenerator.genSuccessResult().setMessage("删除成功");
		}else{
			return ResultGenerator.genFailResult("删除失败");
		}
	}

	@RequestMapping(value = "/show",method = RequestMethod.GET)
	public String selectById(@RequestParam Integer id, Model model){
		OaUser mOaUser = mOaUserService.selectOaUserById(id);
		model.addAttribute("oauser",mOaUser);
		return "/authc/user/show";
	}

	@RequestMapping(value = "/checkExist",method = RequestMethod.POST)
	@ResponseBody
	public int checkExist(@RequestParam String username){
		log.info("username:"+username);
		OaUser oaUser = mOaUserService.selectOaUserByLoginName(username);
		if(oaUser != null){
			return 1;
		}else{
			return 0;
		}
	}
}
