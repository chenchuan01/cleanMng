package com.jiayang.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	static final String VIEW_HOME="home";
	static final String DIR_CONTENT="content/";
	@Resource
	UserService userService;
	@RequestMapping("")
	public String home(){
		return VIEW_HOME;
	}
	@RequestMapping("/myuserInfo.do")
	public String myuserInfo(Model m,HttpSession session){
		User sysUser = SessionUtil.sysUser(session);
		m.addAttribute("user", userService.findById(sysUser.getId()));
		return DIR_CONTENT+"myuserInfo";
	}
	@RequestMapping("/servView")
	public String servView(){
		return "redirect:item/servList.do";
	}
	@RequestMapping("/issueView")
	public String issueView(){
		return "redirect:plan/myissue.do";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/itemMng"})
	public String itemMng(){
		return DIR_CONTENT+"itemList";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/toolMng"})
	public String toolMng(){
		return DIR_CONTENT+"toolList";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/planMng"})
	public String planMng(){
		return "redirect:/plan/planList.do";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/payMng"})
	public String payMng(){
		return "redirect:/plan/payList.do";
	}

	/**
	 * @return
	 */
	@RequestMapping({"/empMng"})
	public String emp(){
		return DIR_CONTENT+"empList";
	}

	/**
	 * @return
	 */
	@RequestMapping({"/userMng"})
	public String userMng(){
		return DIR_CONTENT+"userList";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/configMng"})
	public String configMng(){
		return DIR_CONTENT+"configList";
	}
}
