/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : zcurd_base

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-09-18 19:44:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_type` varchar(50) NOT NULL DEFAULT '' COMMENT '类型',
  `dict_key` varchar(50) NOT NULL DEFAULT '' COMMENT '键',
  `dict_value` varchar(100) NOT NULL DEFAULT '' COMMENT '值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'datarule_symbol', '=', '=', '2016-03-01 22:42:05');
INSERT INTO `sys_dict` VALUES ('2', 'datarule_symbol', '>', '>', '2016-03-01 22:42:21');
INSERT INTO `sys_dict` VALUES ('3', 'datarule_symbol', '<', '<', '2016-03-01 22:42:28');
INSERT INTO `sys_dict` VALUES ('4', 'datarule_symbol', '>=', '>=', '2016-03-01 22:42:37');
INSERT INTO `sys_dict` VALUES ('5', 'datarule_symbol', '<=', '<=', '2016-03-01 22:42:45');
INSERT INTO `sys_dict` VALUES ('6', 'db_source', 'zcurd_base', '基本库', '2016-09-18 17:25:49');
INSERT INTO `sys_dict` VALUES ('7', 'db_source', 'zcurd_busi', '业务库', '2016-09-18 17:25:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(100) DEFAULT NULL COMMENT '菜单地址',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属菜单',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `order_num` int(11) DEFAULT NULL COMMENT '顺序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '0', 'glyphicon-cog', '6', '2016-01-06 19:37:31');
INSERT INTO `sys_menu` VALUES ('2', '在线表单', '/zcurdHead/list', '1', 'glyphicon-cloud', '1', '2016-01-07 21:41:21');
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', '/menu/list', '1', 'glyphicon-menu-hamburger', '2', '2016-01-06 19:37:38');
INSERT INTO `sys_menu` VALUES ('4', '字典管理', '/zcurd/7/listPage', '1', 'glyphicon-book', '3', '2016-02-29 11:44:07');
INSERT INTO `sys_menu` VALUES ('5', '用户管理', null, '0', 'glyphicon-user', '5', '2016-01-06 19:37:31');
INSERT INTO `sys_menu` VALUES ('6', '角色管理', '/zcurd/8/listPage', '5', 'glyphicon-user', '1', '2016-01-07 03:32:08');
INSERT INTO `sys_menu` VALUES ('7', '系统用户', '/zcurd/12/listPage', '5', 'glyphicon-king', '2', '2016-02-16 03:59:22');
INSERT INTO `sys_menu` VALUES ('9', '内容管理', null, '0', 'glyphicon-search', '2', '2016-09-12 22:10:51');
INSERT INTO `sys_menu` VALUES ('10', '客户管理', '/zcurd/15/listPage', '9', 'glyphicon-th-list', '1', '2016-09-12 22:11:26');
INSERT INTO `sys_menu` VALUES ('11', '大盘数据', '/zcurd/16/listPage', '9', 'glyphicon-flag', '2', '2016-09-12 22:12:33');
INSERT INTO `sys_menu` VALUES ('12', '小说采集', '/zcurd/17/listPage', '9', 'glyphicon-cd', '0', '2016-09-18 18:55:28');

-- ----------------------------
-- Table structure for sys_menu_btn
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_btn`;
CREATE TABLE `sys_menu_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) DEFAULT NULL COMMENT '所属菜单',
  `btn_name` varchar(100) DEFAULT NULL COMMENT '按钮名称',
  `class_name` varchar(100) DEFAULT NULL COMMENT '页面class名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '后台method名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`menu_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单按钮';

-- ----------------------------
-- Records of sys_menu_btn
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_datarule`;
CREATE TABLE `sys_menu_datarule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `symbol` varchar(50) DEFAULT NULL COMMENT '符号',
  `value` varchar(100) DEFAULT NULL COMMENT 'sql条件值',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu_datarule
-- ----------------------------
INSERT INTO `sys_menu_datarule` VALUES ('1', '4', 'status', '=', '0', '2016-02-26 17:36:41');
INSERT INTO `sys_menu_datarule` VALUES ('2', '4', 'reg_time', '<=', '2016-01-01', '2016-03-01 23:19:34');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(11) DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色管理';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '2016-02-04 21:05:45');
INSERT INTO `sys_role` VALUES ('2', '内容运营', '2016-02-04 21:06:12');
INSERT INTO `sys_role` VALUES ('3', '商家', '2016-09-13 23:00:00');

-- ----------------------------
-- Table structure for sys_role_btn
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_btn`;
CREATE TABLE `sys_role_btn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `btn_id` int(11) DEFAULT NULL COMMENT '按钮id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_btn
-- ----------------------------
INSERT INTO `sys_role_btn` VALUES ('188', '1', '3', '2016-03-01 23:44:17');
INSERT INTO `sys_role_btn` VALUES ('189', '1', '2', '2016-03-01 23:44:17');
INSERT INTO `sys_role_btn` VALUES ('190', '1', '1', '2016-03-01 23:44:17');
INSERT INTO `sys_role_btn` VALUES ('191', '2', '3', '2016-04-05 13:33:04');
INSERT INTO `sys_role_btn` VALUES ('192', '2', '5', '2016-04-05 13:33:04');
INSERT INTO `sys_role_btn` VALUES ('193', '2', '4', '2016-04-05 13:33:04');
INSERT INTO `sys_role_btn` VALUES ('194', '2', '1', '2016-04-05 13:33:04');

-- ----------------------------
-- Table structure for sys_role_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_datarule`;
CREATE TABLE `sys_role_datarule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `datarule_id` int(11) NOT NULL COMMENT '数据规则',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色数据规则';

-- ----------------------------
-- Records of sys_role_datarule
-- ----------------------------
INSERT INTO `sys_role_datarule` VALUES ('11', '1', '2', '2016-03-01 23:44:17');
INSERT INTO `sys_role_datarule` VALUES ('12', '2', '2', '2016-04-05 13:33:04');
INSERT INTO `sys_role_datarule` VALUES ('13', '2', '1', '2016-04-05 13:33:04');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('414', '1', '18', '2016-03-01 23:44:17');
INSERT INTO `sys_role_menu` VALUES ('415', '1', '6', '2016-03-01 23:44:17');
INSERT INTO `sys_role_menu` VALUES ('416', '1', '12', '2016-03-01 23:44:17');
INSERT INTO `sys_role_menu` VALUES ('417', '1', '21', '2016-03-01 23:44:17');
INSERT INTO `sys_role_menu` VALUES ('418', '1', '23', '2016-03-01 23:44:17');
INSERT INTO `sys_role_menu` VALUES ('419', '2', '2', '2016-04-05 13:33:04');
INSERT INTO `sys_role_menu` VALUES ('420', '2', '4', '2016-04-05 13:33:04');
INSERT INTO `sys_role_menu` VALUES ('421', '2', '22', '2016-04-05 13:33:04');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `roles` varchar(100) DEFAULT NULL COMMENT '角色',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123456', '2', '2016-01-08 15:33:05');
INSERT INTO `sys_user` VALUES ('2', 'test', '123456', '2', '2016-01-08 15:35:12');
INSERT INTO `sys_user` VALUES ('6', 'zhong', '123456', '1,2', '2016-02-21 01:19:47');

-- ----------------------------
-- Table structure for zcurd_field
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_field`;
CREATE TABLE `zcurd_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL COMMENT '所属表',
  `field_name` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `column_name` varchar(100) DEFAULT NULL COMMENT '列表列名',
  `column_length` int(11) DEFAULT '120' COMMENT '列宽',
  `data_type` varchar(50) DEFAULT NULL COMMENT '数据类型',
  `input_type` varchar(50) DEFAULT 'easyui-textbox' COMMENT '控件类型',
  `is_show_list` int(11) DEFAULT '1' COMMENT '是否列表显示',
  `is_allow_detail` int(11) DEFAULT '1' COMMENT '是否详情显示',
  `is_allow_add` int(11) DEFAULT '1' COMMENT '是否允许增加',
  `is_allow_update` int(11) DEFAULT '1' COMMENT '是否允许编辑',
  `is_search` int(11) DEFAULT '0' COMMENT '是否搜索',
  `is_allow_null` int(11) DEFAULT '1' COMMENT '是否允许为空',
  `dict_sql` varchar(1000) DEFAULT NULL COMMENT '字典sql',
  `order_num` int(11) DEFAULT '0' COMMENT '顺序',
  `search_type` int(11) DEFAULT '1' COMMENT '搜索类型(1:值,2:范围)',
  `is_sum` int(11) DEFAULT '0' COMMENT '是否汇总',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='在线表单字段';

-- ----------------------------
-- Records of zcurd_field
-- ----------------------------
INSERT INTO `zcurd_field` VALUES ('1', '1', 'create_time', '创建时间', '130', 'timestamp', 'easyui-textbox', '1', '1', '0', '0', '0', '1', '', '7', '1', '0', '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES ('2', '1', 'func_content', '方法内容', '120', 'text', 'textarea', '0', '1', '1', '1', '0', '0', '', '6', '1', '0', '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES ('3', '1', 'btn_name', '按钮名称', '80', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '3', '1', '0', '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES ('4', '1', 'location', '按钮位置', '80', 'int', 'easyui-combobox', '1', '1', '1', '1', '0', '0', 'select 1, \'顶部\' union all select 2, \'行内\'', '4', '1', '0', '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES ('5', '1', 'action', '行为', '80', 'int', 'easyui-combobox', '1', '1', '1', '1', '0', '0', 'select 0, \'自定义\' union all select 1, \'打开子页面\'', '5', '1', '0', '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES ('6', '2', 'create_time', '创建时间', '130', 'timestamp', 'easyui-textbox', '1', '1', '0', '0', '0', '1', '', '5', '1', '0', '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES ('7', '2', 'js_content', 'js内容', '120', 'text', 'textarea', '0', '1', '1', '1', '0', '0', '', '4', '1', '0', '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES ('8', '2', 'page', '页面', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '3', '1', '0', '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES ('9', '2', 'head_id', '所属表单', '120', 'int', 'easyui-combobox', '1', '1', '1', '1', '1', '0', 'select id, form_name from zcurd_head', '2', '1', '0', '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES ('10', '3', 'id', 'id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('11', '3', 'menu_name', '菜单名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('12', '3', 'menu_url', '菜单地址', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('13', '3', 'parent_id', '所属菜单', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('14', '3', 'icon', '图标', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('15', '3', 'order_num', '顺序', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('16', '3', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datetimebox', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-01-29 16:30:26');
INSERT INTO `zcurd_field` VALUES ('17', '4', 'id', 'id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:02');
INSERT INTO `zcurd_field` VALUES ('18', '4', 'menu_id', '所属菜单', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '1', '1', 'select * from (select id, menu_name from sys_menu order by order_num) a', '0', '1', '0', '2016-01-10 19:53:02');
INSERT INTO `zcurd_field` VALUES ('19', '4', 'btn_name', '按钮名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:02');
INSERT INTO `zcurd_field` VALUES ('20', '4', 'class_name', '页面class名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:02');
INSERT INTO `zcurd_field` VALUES ('21', '4', 'method_name', '后台method名称', '120', 'char', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:02');
INSERT INTO `zcurd_field` VALUES ('22', '4', 'icon', '图标', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:03');
INSERT INTO `zcurd_field` VALUES ('23', '4', 'order_num', '顺序', '120', 'int', 'easyui-textbox', '0', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:03');
INSERT INTO `zcurd_field` VALUES ('24', '4', 'create_time', '创建时间', '120', 'timestamp', 'easyui-textbox', '0', '1', '0', '0', '0', '1', '', '0', '1', '0', '2016-01-10 19:53:03');
INSERT INTO `zcurd_field` VALUES ('25', '5', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('26', '5', 'menu_id', '所属菜单', '100', 'int', 'easyui-combobox', '1', '1', '1', '1', '1', '0', 'select id, menu_name from sys_menu', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('27', '5', 'btn_name', '按钮名称', '100', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('28', '5', 'class_name', '页面class名称', '100', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('29', '5', 'method_name', '后台method名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('30', '5', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES ('34', '6', 'value', '字段件值', '80', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '5', '1', '0', '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES ('36', '6', 'symbol', '符号', '80', 'varchar', 'easyui-combobox', '1', '1', '1', '1', '0', '0', 'select dict_key, dict_value from sys_dict', '4', '1', '0', '2016-02-28 03:20:56');
INSERT INTO `zcurd_field` VALUES ('33', '6', 'field_name', '字段名称', '100', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '3', '1', '0', '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES ('31', '6', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '1', '1', '0', '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES ('32', '6', 'menu_id', '菜单', '100', 'int', 'easyui-combobox', '1', '1', '1', '1', '1', '0', 'select id, menu_name from sys_menu', '2', '1', '0', '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES ('37', '7', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES ('38', '7', 'dict_type', '类型', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '0', '', '0', '1', '0', '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES ('39', '7', 'dict_key', '键', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '0', '', '0', '1', '0', '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES ('40', '7', 'dict_value', '值', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '0', '', '0', '1', '0', '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES ('41', '7', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '1', '1', '0', '0', '1', '0', '', '0', '2', '0', '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES ('42', '8', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', null, '0', '1', '0', '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES ('43', '8', 'role_name', '角色名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '0', '1', '0', '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES ('44', '8', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '1', '1', '1', '1', '0', '1', null, '0', '1', '0', '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES ('45', '9', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-02-14 16:35:39');
INSERT INTO `zcurd_field` VALUES ('46', '9', 'role_id', '角色id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 16:35:39');
INSERT INTO `zcurd_field` VALUES ('47', '9', 'btn_id', '按钮id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 16:35:39');
INSERT INTO `zcurd_field` VALUES ('48', '9', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 16:35:39');
INSERT INTO `zcurd_field` VALUES ('49', '10', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', '', '0', '1', '0', '2016-02-14 20:08:47');
INSERT INTO `zcurd_field` VALUES ('50', '10', 'role_id', '角色', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 20:08:47');
INSERT INTO `zcurd_field` VALUES ('51', '10', 'menu_id', '菜单', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 20:08:47');
INSERT INTO `zcurd_field` VALUES ('52', '10', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '1', '1', '1', '1', '0', '1', '', '0', '1', '0', '2016-02-14 20:08:47');
INSERT INTO `zcurd_field` VALUES ('53', '11', 'id', 'id', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', null, '0', '1', '0', '2016-02-28 03:00:03');
INSERT INTO `zcurd_field` VALUES ('54', '11', 'role_id', '角色', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', null, '0', '1', '0', '2016-02-28 03:00:03');
INSERT INTO `zcurd_field` VALUES ('55', '11', 'datarule_id', '数据规则', '120', 'int', 'easyui-numberspinner', '1', '1', '1', '1', '0', '0', null, '0', '1', '0', '2016-02-28 03:00:03');
INSERT INTO `zcurd_field` VALUES ('56', '11', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '1', '1', '1', '1', '0', '1', null, '0', '1', '0', '2016-02-28 03:00:03');
INSERT INTO `zcurd_field` VALUES ('57', '12', 'id', 'id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '1', '1', '0', '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES ('58', '12', 'user_name', '用户名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '2', '1', '0', '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES ('59', '12', 'password', '密码', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '3', '1', '0', '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES ('60', '12', 'create_time', '创建时间', '120', 'timestamp', 'easyui-textbox', '1', '1', '0', '0', '1', '1', '', '5', '2', '0', '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES ('61', '12', 'roles', '角色', '120', 'varchar', 'easyui-combobox', '1', '1', '1', '1', '0', '1', 'select id, role_name from sys_role', '4', '1', '0', '2016-02-23 04:31:08');
INSERT INTO `zcurd_field` VALUES ('195', '15', 'overfueremark', '逾期记录', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '124', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('196', '15', 'cheLoanMoney', 'cheLoanMoney', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '125', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('192', '15', 'mortgageremark', '按揭备注', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '121', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('193', '15', 'repaystatus', '还款情况', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '122', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('194', '15', 'overduecount', '逾期次数', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '123', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('35', '6', 'create_time', '创建时间', '120', 'timestamp', 'easyui-datebox', '0', '0', '0', '0', '0', '0', '', '6', '1', '0', '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES ('190', '15', 'archremark', '资料归档备注', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '119', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('191', '15', 'mortgagestatus', '按揭情况', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '120', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('188', '15', 'archstatus', '资料归档情况', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '117', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('189', '15', 'archtime', '资料归档时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '118', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('186', '15', 'gjrelation', '共借人关系', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '115', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('187', '15', 'approvalopinion', '审批意见', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '116', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('185', '15', 'buyhouseaddress', '客户新买房新地址', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '114', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('183', '15', 'loanMoney', 'loanMoney', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '112', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('184', '15', 'creditLevel', '信用卡等级', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '113', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('182', '15', 'refundtime', '退款时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '111', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('181', '15', 'refundamount', '退款金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '110', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('180', '15', 'consultantphone', '顾问号码', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '109', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('179', '15', 'houseConsultant', '职业顾问', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '108', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('178', '15', 'loanbankaccount', '还款银行卡号', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '107', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('177', '15', 'accountbranch', '开户支行', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '106', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('175', '15', 'urgentlevel', '紧急程度', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '104', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('176', '15', 'applyloandate', '申请放款时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '105', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('174', '15', 'othertime', 'othertime', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '103', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('173', '15', 'otheramount', '加他付款方式', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '102', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('172', '15', 'transfertime', '转账时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '101', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('170', '15', 'cashtime', '现金付款时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '99', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('171', '15', 'transferamount', '转账金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '100', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('169', '15', 'cashamount', '现金金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '98', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('168', '15', 'postime', 'pos刷卡时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '97', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('167', '15', 'posamount', '放款金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '96', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('166', '15', 'recviway', '还款方式1 pos机器 2现金  3转账  4其他', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '95', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('165', '15', 'loantime', '放款时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '94', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('164', '15', 'loanstatus', '放款状态', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '93', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('162', '15', 'signstatus', '签约状态', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '91', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('163', '15', 'signtime', '签约时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '92', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('161', '15', 'repay', 'repay', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '90', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('160', '15', 'period', 'period', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '89', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('158', '15', 'fkid', 'fkid', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '87', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('159', '15', 'personPath', 'personPath', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '88', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('157', '15', 'examindate', '报审时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '86', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('156', '15', 'fundname', 'fundname', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '85', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('154', '15', 'loantimelimit', 'loantimelimit', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '83', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('155', '15', 'fund', 'fund', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '84', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('153', '15', 'zcompanyaddress', 'zcompanyaddress', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '82', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('152', '15', 'gunitaddress', 'gunitaddress', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '81', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('151', '15', 'xsname', 'xsname', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '80', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('150', '15', 'xsid', 'xsid', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '79', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('149', '15', 'relations', 'relations', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '78', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('148', '15', 'creditLoanMoney', 'creditLoanMoney', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '77', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('147', '15', 'zenterpborrow', 'zenterpborrow', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '76', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('146', '15', 'creditNumber', 'creditNumber', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '75', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('145', '15', 'aname', 'aname', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '74', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('144', '15', 'ctime', 'ctime', '120', 'datetime', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '73', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('143', '15', 'adid', 'adid', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '72', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('142', '15', 'contposition', '紧急联系人工作职位', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '71', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('141', '15', 'contworkdep', '紧急联系人工作部门', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '70', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('140', '15', 'contunitaddress', '紧急联系人单位地址', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '69', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('139', '15', 'contunitphone', '紧急联系人单位电话', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '68', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('138', '15', 'contunitname', '紧急联系人单位名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '67', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('136', '15', 'contphone', '紧急联系人住宅电话', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '65', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('137', '15', 'contaddress', '紧急联系人地址', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '66', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('135', '15', 'contmobile', '紧急联系人电话', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '64', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('134', '15', 'contloan', '经济联系人是否知晓贷款', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '63', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('133', '15', 'contrelation', '紧急联系人关系', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '62', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('132', '15', 'contsex', '紧急联系人性别', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '61', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('131', '15', 'contage', '紧急联系人年龄', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '60', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('130', '15', 'contname', '紧急联系人姓名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '59', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('129', '15', 'otherloan', '其他贷款', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '58', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('128', '15', 'creditconsume', '信用卡已消费', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '57', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('127', '15', 'creditlimit', '信用卡最高额度', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '56', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('126', '15', 'bankaccount', '用户银行账户', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '55', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('125', '15', 'age', '年龄', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '54', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('124', '15', 'zsharesratio', '占股比例-自雇', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '53', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('123', '15', 'zmanageplace', '经营场所-自雇', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '52', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('122', '15', 'zenterploan', '企业借款-自雇', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '51', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('121', '15', 'zenterpfund', '企业资产-自雇', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '50', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('120', '15', 'zyearbus', '年营业额-自雇', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '49', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('119', '15', 'zmonincome', '月收入—自雇', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '48', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('118', '15', 'zindustrytype', '行业类型-自雇', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '47', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('116', '15', 'gsalaryway', '工作发放形式-工薪', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '45', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('117', '15', 'zcompanyname', '企业名-自雇', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '46', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('115', '15', 'gworklife', '工作年限-工薪', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '44', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('114', '15', 'gmonincome', '月收入-工薪', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '43', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('113', '15', 'gjoblevel', '工作级别-工薪', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '42', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('112', '15', 'gunitnature', '单位性质-工薪', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '41', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('111', '15', 'gunitname', '单位名称-工薪', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '40', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('110', '15', 'job', '职业', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '39', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('109', '15', 'familyaddress', '家庭地址', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '38', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('108', '15', 'marriagestatus', '婚姻状态', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '37', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('106', '15', 'applyamount', '申请金额', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '35', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('107', '15', 'homestatus', '置业状况', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '36', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('105', '15', 'loanproduct', '贷款产品', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '34', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('104', '15', 'fristpayratio', '首付比例', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '33', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('103', '15', 'buyhouseamount', '购房金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '32', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('102', '15', 'familycount', '家庭人口数量', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '31', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('101', '15', 'salaryway', '工资发放形式', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '30', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('100', '15', 'domloction', '户籍所在地', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '29', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('98', '15', 'higdegree', '最高学位', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '27', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('99', '15', 'health', '健康状况', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '28', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('97', '15', 'pidunit', '发证机关', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '26', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('96', '15', 'pidvaildity', '证件有效期', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '25', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('95', '15', 'pidtype', '证件类型', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '24', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('94', '15', 'nation', '民族', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '23', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('93', '15', 'natiomality', '国籍', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '22', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('211', '16', 'create_time', '创建时间', '120', 'timestamp', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '14', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('208', '16', 'change_ratio', '涨跌幅', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '11', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('209', '16', 'turnover_volume', '成交量', '120', 'bigint', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '12', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('210', '16', 'turnover_money', '成交金额', '120', 'bigint', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '13', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('205', '16', 'opening_price', '开盘价', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '8', '2', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('206', '16', 'pre', '前收盘', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '9', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('207', '16', 'change_amount', '涨跌额', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '10', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('204', '16', 'minimum_price', '最低价', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '7', '2', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('203', '16', 'top_price', '最高价', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '6', '2', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('202', '16', 'closing_price', '收盘价', '120', 'double', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '5', '2', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('201', '16', 'name', '名称', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '4', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('92', '15', 'birthday', '出生年月', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '21', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('91', '15', 'sex', '客户性别', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '20', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('90', '15', 'etime', '贷款结束时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '19', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('89', '15', 'stime', '贷款开始时间', '120', 'date', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '18', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('88', '15', 'price', '贷款金额', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '0', null, '17', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('87', '15', 'ordercode', '订单id', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '16', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('86', '15', 'tempcontent', '修改数据', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '15', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('85', '15', 'score', '按模型计算得分', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '14', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('84', '15', 'mid', '使用模型', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '13', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('83', '15', 'status', '状态', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '12', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('82', '15', 'type', '客户类型', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '11', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('81', '15', 'pname', '项目名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '10', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('80', '15', 'pid', '项目id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '9', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('79', '15', 'cityname', '城市名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '8', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('78', '15', 'cityid', '城市id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '7', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('77', '15', 'mobile', '客户手机号码', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '6', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('76', '15', 'idcard', '客户身份证', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '5', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('75', '15', 'name', '客户姓名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '4', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('74', '15', 'parentid', '主借人id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '3', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('73', '15', 'source', '客户来源', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '2', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('72', '15', 'cid', '主键客户信息表', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '1', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('197', '15', 'houseLoanMoney', 'houseLoanMoney', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '1', null, '126', '1', '0', '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES ('198', '16', 'id', 'id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '1', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('199', '16', 'dt', '日期', '120', 'date', 'easyui-datebox', '1', '1', '1', '1', '1', '1', '', '2', '2', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('200', '16', 'code', '股票代码', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '3', '1', '0', '2016-09-18 17:31:55');
INSERT INTO `zcurd_field` VALUES ('216', '17', 'status', '状态', '100', 'int', 'easyui-combobox', '1', '1', '1', '1', '1', '1', 'select \'0\', \'未采集\' union all select \'1\', \'采集中\' union all select \'2\', \'采集完\'', '5', '1', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('217', '17', 'create_time', '创建时间', '120', 'timestamp', 'easyui-textbox', '1', '1', '1', '1', '1', '0', '', '6', '2', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('218', '17', 'last_update_time', '最后更新时间', '120', 'datetime', 'easyui-textbox', '0', '1', '0', '1', '0', '1', '', '7', '1', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('215', '17', 'url', '阅读地址', '250', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '4', '1', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('214', '17', 'book_name', '书名', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '1', '1', '', '3', '1', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('212', '17', 'id', 'id', '120', 'int', 'easyui-textbox', '1', '1', '1', '1', '0', '0', '', '1', '1', '0', '2016-09-18 17:40:23');
INSERT INTO `zcurd_field` VALUES ('213', '17', 'source', '来源', '120', 'varchar', 'easyui-textbox', '1', '1', '1', '1', '0', '1', '', '2', '1', '0', '2016-09-18 17:40:23');

-- ----------------------------
-- Table structure for zcurd_head
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head`;
CREATE TABLE `zcurd_head` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL COMMENT '数据库表名',
  `form_name` varchar(100) DEFAULT NULL COMMENT '表单名称',
  `id_field` varchar(50) DEFAULT 'id' COMMENT '主键字段',
  `is_auto` int(11) DEFAULT '1' COMMENT '是否自增',
  `form_type` int(11) DEFAULT '1' COMMENT '表单类型（1:单表,2:主从）',
  `dialog_size` varchar(50) NOT NULL DEFAULT '600x400' COMMENT '弹窗大小',
  `db_source` varchar(50) DEFAULT NULL COMMENT '数据源',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='在线表单';

-- ----------------------------
-- Records of zcurd_head
-- ----------------------------
INSERT INTO `zcurd_head` VALUES ('1', 'zcurd_head_btn', '表单扩展按钮', 'id', '1', '1', '600x400', 'zcurd_base', '2016-01-11 21:58:48');
INSERT INTO `zcurd_head` VALUES ('2', 'zcurd_head_js', '表单扩展js', 'id', '1', '1', '600x400', 'zcurd_base', '2016-01-12 15:35:01');
INSERT INTO `zcurd_head` VALUES ('3', 'sys_menu', '菜单管理', 'id', '1', '1', '600x400', 'zcurd_base', '2016-01-29 16:30:26');
INSERT INTO `zcurd_head` VALUES ('4', 'sys_menu_btn', '菜单按钮', 'id', '1', '1', '600x400', 'zcurd_base', '2016-01-10 19:53:02');
INSERT INTO `zcurd_head` VALUES ('5', 'sys_menu_btn', '菜单按钮（权限编辑）', 'id', '1', '1', '600x400', 'zcurd_base', '2016-02-14 16:35:56');
INSERT INTO `zcurd_head` VALUES ('6', 'sys_menu_datarule', '菜单数据（权限编辑）', 'id', '1', '1', '400x300', 'zcurd_base', '2016-02-25 23:55:58');
INSERT INTO `zcurd_head` VALUES ('7', 'sys_dict', '数据字典', 'id', '1', '1', '400x300', 'zcurd_base', '2016-03-01 04:39:14');
INSERT INTO `zcurd_head` VALUES ('8', 'sys_role', '角色管理', 'id', '1', '1', '600x400', 'zcurd_base', '2016-02-12 01:58:39');
INSERT INTO `zcurd_head` VALUES ('9', 'sys_role_btn', '角色按钮', 'id', '1', '1', '600x400', 'zcurd_base', '2016-02-14 16:35:39');
INSERT INTO `zcurd_head` VALUES ('10', 'sys_role_menu', '角色菜单', 'id', '1', '1', '600x400', 'zcurd_base', '2016-02-14 20:08:47');
INSERT INTO `zcurd_head` VALUES ('11', 'sys_role_datarule', '角色数据规则', 'id', '1', '1', '600x400', 'zcurd_base', '2016-02-28 03:00:03');
INSERT INTO `zcurd_head` VALUES ('12', 'sys_user', '用户管理', 'id', '1', '1', '400x300', 'zcurd_base', '2016-01-07 21:31:45');
INSERT INTO `zcurd_head` VALUES ('15', 'customer', '客户管理', 'cid', '1', '1', '600x400', 'zcurd_busi', '2016-09-18 17:31:32');
INSERT INTO `zcurd_head` VALUES ('16', 'stock_history_log', '股票历史数据', 'id', '1', '1', '600x400', 'zcurd_busi', '2016-09-18 17:31:55');
INSERT INTO `zcurd_head` VALUES ('17', 'claw_book_url', '小说管理', 'id', '1', '1', '600x400', 'zcurd_busi', '2016-09-18 17:40:23');

-- ----------------------------
-- Table structure for zcurd_head_btn
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head_btn`;
CREATE TABLE `zcurd_head_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) DEFAULT NULL COMMENT '所属表单',
  `btn_name` varchar(50) DEFAULT NULL COMMENT '按钮名称',
  `location` int(11) DEFAULT '1' COMMENT '按钮位置（1：顶部，2：行内）',
  `action` int(11) DEFAULT '1' COMMENT '行为（0：无，1：打开子页面）',
  `func_content` text COMMENT '方法内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='表单按钮';

-- ----------------------------
-- Records of zcurd_head_btn
-- ----------------------------
INSERT INTO `zcurd_head_btn` VALUES ('1', '8', '权限设置', '2', '1', 'function(index) {\r\n var row = datagrid.datagrid(\"getRows\")[index];\r\n  //var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\r\n var url = basePath + \"/role/editAuthPage?roleId=\" + row.id;\r\n _openSubPage(url);\r\n}', '2016-02-12 21:23:10');
INSERT INTO `zcurd_head_btn` VALUES ('2', '134', '管理', '2', '1', 'function(index) {\n var row = datagrid.datagrid(\"getRows\")[index];\n  var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\n _openSubPage(url);\n}', '2016-01-12 13:28:50');
INSERT INTO `zcurd_head_btn` VALUES ('3', '133', '测试', '2', '0', 'function(){}', '2016-01-13 09:30:35');

-- ----------------------------
-- Table structure for zcurd_head_js
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head_js`;
CREATE TABLE `zcurd_head_js` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) DEFAULT NULL COMMENT '所属表单',
  `page` varchar(50) DEFAULT NULL COMMENT '页面',
  `js_content` text COMMENT 'js内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='表单扩展js';

-- ----------------------------
-- Records of zcurd_head_js
-- ----------------------------
INSERT INTO `zcurd_head_js` VALUES ('1', '134', 'list', 'var operateWidth = 80;\r\nvar subPageWidth = \"50%\";\r\nvar subPageTitle = \"等级详情\";\r\ndgOptions.singleSelect=true;', '2016-01-12 16:25:45');
INSERT INTO `zcurd_head_js` VALUES ('2', '5', 'list', '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n  var btnIds = window.parent.getCurrMenuBtns();\n var rows = datagrid.datagrid(\"getData\").rows;\n if(btnIds && rows.length > 0) {\n   $.each(rows, function(i, item) {\n      $.each(btnIds, function(j, btnId) {\n       if(item.id == btnId) {\n          datagrid.datagrid(\"selectRow\", j);\n        }\n     });\n   });\n }\n}', '2016-02-15 11:13:14');
INSERT INTO `zcurd_head_js` VALUES ('3', '8', 'list', 'var operateWidth = 80;\nvar subPageWidth = \"55%\";\nvar subPageTitle = \"权限设置\";\ndgOptions.singleSelect=true;', '2016-02-16 16:32:31');
INSERT INTO `zcurd_head_js` VALUES ('4', '131', 'update', '$(function() {\n  changeComboboxToMult(\"roles\");\n});', '2016-02-23 23:09:57');
INSERT INTO `zcurd_head_js` VALUES ('5', '131', 'add', '$(function() {\n changeComboboxToMult(\"roles\");\n});', '2016-02-23 23:10:03');
INSERT INTO `zcurd_head_js` VALUES ('6', '152', 'list', '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections2 = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n var dataruleIds = window.parent.getCurrMenuDatarules();\n var rows = datagrid.datagrid(\"getData\").rows;\n if(dataruleIds && rows.length > 0) {\n    $.each(rows, function(i, item) {\n      $.each(dataruleIds, function(j, dataruleId) {\n       if(item.id == dataruleId) {\n         datagrid.datagrid(\"selectRow\", j);\n        }\n     });\n   });\n }\n}', '2016-02-15 11:13:14');
