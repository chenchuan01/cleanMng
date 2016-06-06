package com.jiayang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	static final String VIEW_HOME="home";
	static final String DIR_CONTENT="content/";
	/**
	 * @return
	 */
	@RequestMapping({"","/nav"})
	public String home(){
		return VIEW_HOME;
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
		return DIR_CONTENT+"planList";
	}
	/**
	 * @return
	 */
	@RequestMapping({"/payMng"})
	public String payMng(){
		return DIR_CONTENT+"payList";
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
