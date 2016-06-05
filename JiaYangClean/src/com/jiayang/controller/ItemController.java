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
import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;

/**
 *ItemController.java
 */
@Controller
@RequestMapping("/item")
public class ItemController extends BaseController {
	@Resource
	ItemService itemService;
	
	

	/**
	 * ������Ŀ��Ϣ��ҳ
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
	 * ������Ŀ��Ϣ����
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "itemForm")
	public String itemForm(Integer id, Model m) {
		Item item = itemService.findById(id);
		m.addAttribute("item", item);
		return "custom/itemForm";
	}
	/**
	 * ������Ŀ��Ϣ�޸�
	 * 
	 * @param item
	 * @return
	 */
	@RequestMapping(value = "itemModify")
	public @ResponseBody Item itemModify(Item item, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(item!=null&&item.getId()!=null){
				itemService.updateEntity(item);
				LogUtil.info(getClass(),"ItemController.itemModify(Item)", "������Ŀ��Ϣ�޸�");
			}else{
				itemService.saveEntity(item, sysUser);
				LogUtil.info(getClass(), "ItemController.itemModify(Item)", "������Ŀ��Ϣ����");
			}
			
			
		} catch (AppExpection e) {
			LogUtil.error(getClass(), e);
		}

		return item;
	}

	/**
	 * ������Ŀ��Ϣɾ��
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
