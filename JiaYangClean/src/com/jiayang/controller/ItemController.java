package com.jiayang.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiayang.db.entity.Item;
import com.jiayang.db.service.ItemService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.util.LogUtil;

/**
 *ItemController.java
 */
@Controller
@RequestMapping("/item")
public class ItemController extends BaseController {
	@Resource
	ItemService itemService;
	
	
	@RequestMapping(value="servList")
	public String servList(Model m){
		m.addAttribute("items", itemService.findAllEntity());
		return "content/servList";
	}
	/**
	 * 服务项目信息分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "itemPage")
	public @ResponseBody
	PageResult<Item> itemListPage(QueryParam<Item> params, Model m, Item item) {
		params.setParam(item);
		PageResult<Item> result = itemService.pageQuery(params);
		return result;
	}
	/**
	 * 服务项目信息详情
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "itemForm")
	public String itemForm(Integer id, Model m) {
		if(id!=null){
			Item item = itemService.findById(id);
			m.addAttribute("item", item);
		}
		
		return "form/itemForm";
	}
	/**
	 * 服务项目信息修改
	 * 
	 * @param item
	 * @return
	 */
	@RequestMapping(value = "itemModify")
	public @ResponseBody Item itemModify(Item item, HttpSession session) {
		try {
			if(item!=null&&item.getId()!=null){
				itemService.updateEntity(item);
				LogUtil.info(getClass(),"ItemController.itemModify(Item)", "服务项目信息修改");
			}else{
				itemService.saveEntity(item);
				LogUtil.info(getClass(), "ItemController.itemModify(Item)", "服务项目信息新增");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);
		}

		return item;
	}

	/**
	 * 服务项目信息删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "itemDelete")
	public @ResponseBody Item itemDelete(Integer id) {
		Item item = itemService.findById(id);
		itemService.deleteEntity(item);
		return item;
	}

}
