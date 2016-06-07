package com.jiayang.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiayang.db.PlanVo;
import com.jiayang.db.entity.Plan;
import com.jiayang.db.service.ItemService;
import com.jiayang.db.service.PlanService;
import com.jiayang.db.service.ToolService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.DBConstants;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *PlanController.java
 */
@Controller
@RequestMapping("/plan")
public class PlanController extends BaseController {
	@Resource
	PlanService planService;
	@Resource
	UserService userService;
	@Resource
	ToolService toolService;
	@Resource
	ItemService itemService;
	
	@RequestMapping(value="planList")
	public String planList(Model m){
		genParams(m);
		return "content/planList";
	}
	/**
	 * 预约信息分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "planPage")
	public @ResponseBody
	PageResult<PlanVo> planListPage(QueryParam<Plan> params, Model m, Plan plan) {
		params.setParam(plan);
		params.setOrderFiled("status");
		params.setOrderType(DBConstants.DML_ORDER_DESC);
		return planService.pageVoQuery(params);
	}
	/**
	 * 预约信息详情
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "planForm")
	public String planForm(Integer id, Model m) {
		if(id!=null){
			Plan plan = planService.findById(id);
			m.addAttribute("plan", plan);
			genParams(m);
		}
		return "form/planForm";
	}
	private void genParams(Model m) {
		User query = new User();
		query.setRoles("0");
		m.addAttribute("users", userService.find(query));
		query.setRoles("1");
		m.addAttribute("emps", userService.find(query));
		m.addAttribute("tools", toolService.findAllEntity());
		m.addAttribute("items", itemService.findAllEntity());
	}
	/**
	 * 预约信息修改
	 * 
	 * @param plan
	 * @return
	 */
	@RequestMapping(value = "planModify")
	public @ResponseBody Plan planModify(Plan plan, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(plan!=null&&plan.getId()!=null){
				planService.updateEntity(plan);
				LogUtil.info(getClass(),"PlanController.planModify(Plan)", "预约信息修改");
			}else{
				planService.saveEntity(plan, sysUser);
				LogUtil.info(getClass(), "PlanController.planModify(Plan)", "预约信息新增");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);
		}

		return plan;
	}

	/**
	 * 预约信息删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "planDelete")
	public @ResponseBody Plan planDelete(Integer id) {
		Plan plan = planService.findById(id);
		planService.deleteEntity(plan);
		return plan;
	}

}
