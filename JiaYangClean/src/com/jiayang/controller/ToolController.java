package com.jiayang.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiayang.db.entity.Tool;
import com.jiayang.db.service.ToolService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;

/**
 *ToolController.java
 */
@Controller
@RequestMapping("/tool")
public class ToolController extends BaseController {
	@Resource
	ToolService toolService;
	
	

	/**
	 * 保洁工具信息分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "toolPage")
	public @ResponseBody
	PageResult<Tool> toolListPage(QueryParam<Tool> params, Model m, Tool tool) {
		params.setParam(tool);
		PageResult<Tool> result = toolService.pageQuery(params);
		return result;
	}
	/**
	 * 保洁工具信息详情
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "toolForm")
	public String toolForm(Integer id, Model m) {
		if(id!=null){
			Tool tool = toolService.findById(id);
			m.addAttribute("tool", tool);
		}
		return "form/toolForm";
	}
	/**
	 * 保洁工具信息修改
	 * 
	 * @param tool
	 * @return
	 */
	@RequestMapping(value = "toolModify")
	public @ResponseBody Tool toolModify(Tool tool, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(tool!=null&&tool.getId()!=null){
				toolService.updateEntity(tool);
				LogUtil.info(getClass(),"ToolController.toolModify(Tool)", "保洁工具信息修改");
			}else{
				toolService.saveEntity(tool, sysUser);
				LogUtil.info(getClass(), "ToolController.toolModify(Tool)", "保洁工具信息新增");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);
		}

		return tool;
	}

	/**
	 * 保洁工具信息删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "toolDelete")
	public @ResponseBody Tool toolDelete(Integer id) {
		Tool tool = toolService.findById(id);
		toolService.deleteEntity(tool);
		return tool;
	}

}
