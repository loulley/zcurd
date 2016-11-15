package com.zcurd.common;

import com.busi.controller.ClawBookUrlController;
import com.busi.controller.StockHistoryLogController;
import com.busi.model.ClawBookUrl;
import com.busi.model.StockHistoryLog;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.FreeMarkerRender;
import com.zcurd.common.handler.ZcurdHandler;
import com.zcurd.common.interceptor.AuthInterceptor;
import com.zcurd.controller.CommonController;
import com.zcurd.controller.LoginController;
import com.zcurd.controller.MainController;
import com.zcurd.controller.MenuController;
import com.zcurd.controller.RoleController;
import com.zcurd.controller.SysOplogController;
import com.zcurd.controller.SysUserController;
import com.zcurd.controller.ZcurdController;
import com.zcurd.controller.ZcurdHeadController;
import com.zcurd.model.Menu;
import com.zcurd.model.MenuBtn;
import com.zcurd.model.MenuDatarule;
import com.zcurd.model.SysMenuBtn;
import com.zcurd.model.SysOplog;
import com.zcurd.model.SysUser;
import com.zcurd.model.ZcurdField;
import com.zcurd.model.ZcurdHead;
import com.zcurd.model.ZcurdHeadBtn;
import com.zcurd.model.ZcurdHeadJs;

import freemarker.template.TemplateModelException;

/**
 * API引导式配置
 */
public class ZcurdConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		// 加载少量必要配置，随后可用PropKit.get(...)获取值
		PropKit.use("a_little_config.txt");
		me.setDevMode(PropKit.getBoolean("devMode", false));
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/login", LoginController.class, "/zcurd/login");
		me.add("/zcurd", ZcurdController.class, "/zcurd/zcurd");
		me.add("/zcurdHead", ZcurdHeadController.class, "/zcurd");
		me.add("/menu", MenuController.class, "/zcurd/menu");
		me.add("/main", MainController.class, "/zcurd");
		me.add("/role", RoleController.class, "/zcurd/role");
		me.add("/common", CommonController.class, "/zcurd");
		me.add("/oplog", SysOplogController.class, "/zcurd/sysOplog");
		me.add("/user", SysUserController.class, "/zcurd/sysUser");
		
		me.add("/stockHistoryLog", StockHistoryLogController.class, "/busi/stockHistoryLog");
		me.add("/clawBookUrl", ClawBookUrlController.class, "/busi/clawBookUrl");
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("base_jdbcUrl"), PropKit.get("base_user"), PropKit.get("base_password").trim());
		me.add(c3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin("zcurd_base", c3p0Plugin);
		arp.setShowSql(true);
		me.add(arp);
		arp.addMapping("zcurd_head", ZcurdHead.class);
		arp.addMapping("zcurd_field", ZcurdField.class);
		arp.addMapping("zcurd_head_btn", ZcurdHeadBtn.class);
		arp.addMapping("zcurd_head_js", ZcurdHeadJs.class);
		arp.addMapping("sys_menu", Menu.class);
		arp.addMapping("sys_menu_btn", MenuBtn.class);
		arp.addMapping("sys_menu_datarule", MenuDatarule.class);
		arp.addMapping("sys_user", SysUser.class);
		arp.addMapping("sys_menu_btn", SysMenuBtn.class);
		arp.addMapping("sys_oplog", SysOplog.class);
		
		//业务数据库
		C3p0Plugin c3p0PluginAir = new C3p0Plugin(PropKit.get("busi_jdbcUrl"), PropKit.get("busi_user"), PropKit.get("busi_password").trim());
		me.add(c3p0PluginAir);
		ActiveRecordPlugin arpAir = new ActiveRecordPlugin("zcurd_busi", c3p0PluginAir);
		arpAir.setShowSql(true);
		
		arpAir.addMapping("stock_history_log", StockHistoryLog.class);
		arpAir.addMapping("claw_book_url", ClawBookUrl.class);
		
		me.add(arpAir);
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		me.add(new SessionInViewInterceptor());
		me.add(new AuthInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new ZcurdHandler());
		
	}
	
	@Override
	public void afterJFinalStart() {
		 try {
			FreeMarkerRender.getConfiguration().setSharedVariable("basePath", JFinal.me().getContextPath());
		} catch (TemplateModelException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 5);
	}
}
