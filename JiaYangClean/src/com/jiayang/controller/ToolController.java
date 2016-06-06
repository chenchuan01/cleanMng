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
	 * ���๤����Ϣ��ҳ
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
	 * ���๤����Ϣ����
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
	 * ���๤����Ϣ�޸�
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
				LogUtil.info(getClass(),"ToolController.toolModify(Tool)", "���๤����Ϣ�޸�");
			}else{
				toolService.saveEntity(tool, sysUser);
				LogUtil.info(getClass(), "ToolController.toolModify(Tool)", "���๤����Ϣ����");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);
		}

		return tool;
	}

	/**
	 * ���๤����Ϣɾ��
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
