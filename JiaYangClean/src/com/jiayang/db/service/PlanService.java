package com.jiayang.db.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jiayang.db.PlanVo;
import com.jiayang.db.entity.Plan;
import com.jiayang.db.entity.Tool;
import com.sys.base.BaseService;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.util.StringUtil;
import com.sys.db.service.UserService;

/**
 *PlanService.java
 */
@Component
public class PlanService extends BaseService<Plan> {
	
	@Resource
	UserService userService;
	@Resource
	ToolService toolService;
	@Resource
	ItemService itemService;
	
	public PlanVo genVoFormEntity(Plan plan){
		PlanVo vo = new PlanVo(plan);
		if(plan!=null){
			if(plan.getUserId()!=null){
				vo.setUser(userService.findById(plan.getUserId()));
			}
			if(plan.getCleanerId()!=null){
				vo.setCleaner(userService.findById(plan.getCleanerId()));
			}
			if(plan.getItemId()!=null){
				vo.setItem(itemService.findById(plan.getItemId()));
			}
			if(StringUtil.isNotNull(plan.getTools())){
				String[] toolIds = plan.getTools().split(";");
				List<Tool> toolList = new ArrayList<Tool>();
				for (int i = 0; i < toolIds.length; i++) {
					if(StringUtil.isNotNull(toolIds[i])){
						toolList.add(toolService.findById(Integer.valueOf(toolIds[i])));
					}
				}
				vo.setTools(toolList);
			}
		}
		return vo;
	}
	public Plan addTool(Plan plan,String toolId){
		StringBuilder sb = new StringBuilder(plan.getTools());
		sb.append(toolId);
		sb.append(";");
		plan.setTools(sb.toString());
		return plan;
	}
	public Plan subTool(Plan plan,String toolId){
		if(StringUtil.isNotNull(plan.getTools())&&StringUtil.isNotNull(toolId)){
			String[] ids = plan.getTools().split(";");
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < ids.length; i++) {
				if(!toolId.equalsIgnoreCase(ids[i])){
					sb.append(ids[i]);
					sb.append(";");
				}
			}
			plan.setTools(sb.toString());
		}
		return plan;
	}
	
	public PageResult<PlanVo> pageVoQuery(QueryParam<Plan> params){
		PageResult<Plan> planPage = pageQuery(params);
		PageResult<PlanVo> voPage = new PageResult<PlanVo>(planPage);
		List<PlanVo> voContent = new ArrayList<PlanVo>();
		PlanVo vo = null;
		for (Plan plan : planPage.getContent()) {
			vo = genVoFormEntity(plan);
			voContent.add(vo);
		}
		voPage.setContent(voContent);
		return voPage;
	}
}
