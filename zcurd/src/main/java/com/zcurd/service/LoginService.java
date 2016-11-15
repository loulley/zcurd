package com.zcurd.service;

import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zcurd.common.StringUtil;
import com.zcurd.common.util.UrlUtil;
import com.zcurd.model.Menu;
import com.zcurd.model.MenuBtn;
import com.zcurd.model.MenuDatarule;
import com.zcurd.model.SysUser;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 登陆、权限业务
 * @author 钟世云 2016.2.5
 */
public class LoginService {
	private List<Menu> allMenuList;
	private List<Menu> userMenuList;
	
	/**
	 * 获得用户菜单
	 */
	public List<Menu> getUserMenu(SysUser user) {
		allMenuList = Menu.me.findAll();
		userMenuList = Menu.me.findByUser(user);
		
		//获取每一个菜单的父菜单链
		Set<Menu> chainSet = new HashSet<Menu>();
		for (Menu menu : userMenuList) {
			chainSet.add(menu);
			getPChain(allMenuList, menu, chainSet);
		}
		//排序
		List<Menu> chainList = new ArrayList<Menu>(chainSet);
		Collections.sort(chainList, new Comparator<Menu>() {
			@Override
			public int compare(Menu o1, Menu o2) {
				if(o1.get("order_num") == null || o2.get("order_num") == null 
						|| o1.getInt("order_num") < o2.getInt("order_num") ) {
					return -1;
				}
				return 0;
			}
		});
		formatSubMenu(chainList);
		
		List<Menu> result = new ArrayList<Menu>();
		for (Menu menu : chainList) {
			result.add(menu);
		}
		return result;
	}
	
	/**
	 * 获得无权限访问的url（页面权限）
	 */
	public List<String> getNoAuthUrl() {
		List<String> urlList = new ArrayList<String>();
		for (Menu menu1 : allMenuList) {
			boolean flag = true;
			for (Menu menu2 : userMenuList) {
				if(menu1.getInt("id") == menu2.getInt("id")) {
					flag = false;
					break;
				}
			}
			if(flag && StringUtil.isNotEmpty(menu1.getStr("menu_url"))) {
				urlList.add(menu1.getStr("menu_url"));
			}
		}
		return urlList;
	}
	
	/**
	 * 按钮权限
	 */
	public Map<String, Object> getNoAuthBtnUrl(SysUser user) {
		Map<Integer, Menu> userMenuMap = new HashMap<Integer, Menu>();
		for (Menu menu : userMenuList) {
			userMenuMap.put(menu.getInt("id"), menu);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> btnUrlList = new ArrayList<String>();
		List<MenuBtn> userBtnList = getDifference(MenuBtn.me.findAll(), MenuBtn.me.findByUser(user));
		
		Map<String, String> pageBtnMap = new HashMap<String, String>();
		for (MenuBtn menuBtn : userBtnList) {
			String methodName = menuBtn.getStr("method_name");
			Menu menu = userMenuMap.get(menuBtn.getInt("menu_id"));
			if(menu == null) {	//有按钮权限，无菜单权限
				continue;
			}
			String menuUrl = menu.getStr("menu_url");
			if(StringUtil.isNotEmpty(methodName) && StringUtil.isNotEmpty(menuUrl)) {
				for (String method : methodName.split(",")) {
					btnUrlList.add(UrlUtil.formatBaseUrl(menuUrl) + "/" + method.replaceAll("//+", "/"));
				}
				//页面按钮
				String btnName = pageBtnMap.get(menuUrl);
				if(StringUtil.isEmpty(btnName)) {
					btnName = menuBtn.getStr("class_name");
				}else {
					btnName = btnName + "," + menuBtn.getStr("class_name");
				}
				pageBtnMap.put(menuUrl, btnName);
			}
		}
		result.put("btnUrlList", btnUrlList);
		result.put("pageBtnMap", pageBtnMap);
		return result;
	}
	
	/**
	 * 数据权限
	 */
	public Map<String, List<MenuDatarule>> getNoAuthDatarule(SysUser user) {
		Map<Integer, Menu> userMenuMap = new HashMap<Integer, Menu>();
		for (Menu menu : userMenuList) {
			userMenuMap.put(menu.getInt("id"), menu);
		}
		
		Map<String, List<MenuDatarule>> pageDataruleMap = new HashMap<String, List<MenuDatarule>>();
		List<MenuDatarule> userDataruleList = MenuDatarule.me.findByUser(user);
		
		//处理字段值中的变量
		for (MenuDatarule menuDatarule : userDataruleList) {
			String value = menuDatarule.get("value");
			if(value.indexOf("${") != -1) {
				Configuration cfg = new Configuration(Configuration.VERSION_2_3_0);
				StringTemplateLoader stringLoader = new StringTemplateLoader();
				stringLoader.putTemplate("myTemplate", value);
				cfg.setTemplateLoader(stringLoader);
				try {
					Template temp = cfg.getTemplate("myTemplate", "utf-8");
					Map<String, Object> root = new HashMap<String, Object>();
					root.put("user", user);
					//TODO 变量处理，此处可以加其它数据
					Writer out = new StringWriter(2048);
					temp.process(root, out);
					menuDatarule.set("value", out.toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		for (MenuDatarule menuDatarule : userDataruleList) {
			String menuUrl = userMenuMap.get(menuDatarule.getInt("menu_id")).getStr("menu_url");
			if(StringUtil.isNotEmpty(menuUrl)) {
				menuUrl = UrlUtil.formatBaseUrl(menuUrl);
				List<MenuDatarule> dataruleList = pageDataruleMap.get(menuUrl);
				if(dataruleList == null) {
					dataruleList = new ArrayList<MenuDatarule>();
				}
				dataruleList.add(menuDatarule);
				pageDataruleMap.put(menuUrl, dataruleList);
			}
		}
		return pageDataruleMap;
	}
	
	
	/**
	 * 获得菜单的所有父菜单
	 */
	public void getPChain(Collection<Menu> list, Menu menu, Set<Menu> chainlist) {
		for (Menu m : list) {
			if(menu.getInt("parent_id") == m.getInt("id")) {
				chainlist.add(m);
				getPChain(list, m, chainlist);
			}
		}
	}
	
	/**
	 * 按上下级格式化数据菜单数据
	 */
	private void formatSubMenu(Collection<Menu> list) {
		for (Menu menu1 : list) {
			for (Menu menu2 : list) {
				if(menu1.getInt("id") == menu2.getInt("parent_id")) {
					menu1.getSubMenuList().add(menu2);
				}
			}
		}
	}
	
	/**
	 * 获得两个list之元素之差(list1 - list2)
	 */
	private List<MenuBtn> getDifference(List<MenuBtn> list1, List<MenuBtn> list2) {
		List<MenuBtn> result = new ArrayList<MenuBtn>();
		for (MenuBtn menuBtn1 : list1) {
			boolean flag = true;
			for (MenuBtn menuBtn2 : list2) {
				if(menuBtn1.getInt("id") == menuBtn2.getInt("id")) {
					flag = false;
					break;
				}
			}
			if(flag) {
				result.add(menuBtn1);
			}
		}
		return result;
	}

}
