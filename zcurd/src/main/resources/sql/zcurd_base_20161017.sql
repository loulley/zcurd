# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.17-log)
# Database: zcurd_base
# Generation Time: 2016-10-16 16:02:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sys_dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_type` varchar(50) NOT NULL DEFAULT '' COMMENT '类型',
  `dict_key` varchar(50) NOT NULL DEFAULT '' COMMENT '键',
  `dict_value` varchar(100) NOT NULL DEFAULT '' COMMENT '值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;

INSERT INTO `sys_dict` (`id`, `dict_type`, `dict_key`, `dict_value`, `create_time`)
VALUES
	(1,'datarule_symbol','=','=','2016-03-01 22:42:05'),
	(2,'datarule_symbol','>','>','2016-03-01 22:42:21'),
	(3,'datarule_symbol','<','<','2016-03-01 22:42:28'),
	(6,'db_source','zcurd_base','基本库','2016-09-18 17:25:49'),
	(7,'db_source','zcurd_busi','业务库','2016-09-18 17:25:54');

/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_url`, `parent_id`, `icon`, `order_num`, `create_time`)
VALUES
	(1,'系统管理',NULL,0,'glyphicon-cog',6,'2016-01-06 19:37:31'),
	(2,'在线表单','/zcurdHead/list',1,'glyphicon-cloud',1,'2016-01-07 21:41:21'),
	(3,'菜单管理','/menu/list',1,'glyphicon-menu-hamburger',2,'2016-01-06 19:37:38'),
	(4,'字典管理','/zcurd/7/listPage',1,'glyphicon-book',3,'2016-02-29 11:44:07'),
	(5,'用户管理',NULL,0,'glyphicon-user',5,'2016-01-06 19:37:31'),
	(6,'角色管理','/zcurd/8/listPage',5,'glyphicon-user',1,'2016-01-07 03:32:08'),
	(7,'系统用户','/zcurd/12/listPage',5,'glyphicon-king',2,'2016-02-16 03:59:22'),
	(9,'内容管理',NULL,0,'glyphicon-search',2,'2016-09-12 22:10:51'),
	(10,'客户管理','/zcurd/15/listPage',9,'glyphicon-th-list',1,'2016-09-12 22:11:26'),
	(11,'大盘数据','/zcurd/16/listPage',9,'glyphicon-flag',2,'2016-09-12 22:12:33'),
	(12,'小说采集','/zcurd/17/listPage',9,'glyphicon-cd',0,'2016-09-18 18:55:28'),
	(13,'操作日志','/oplog/listPage',1,'glyphicon-time',4,'2016-10-16 10:08:02');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu_btn
# ------------------------------------------------------------

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

LOCK TABLES `sys_menu_btn` WRITE;
/*!40000 ALTER TABLE `sys_menu_btn` DISABLE KEYS */;

INSERT INTO `sys_menu_btn` (`id`, `menu_id`, `btn_name`, `class_name`, `method_name`, `create_time`)
VALUES
	(3,12,'增加','addBtn','add,addPage','2016-10-16 13:55:52'),
	(4,12,'修改','updateBtn','update,updatePage','2016-10-16 13:55:52'),
	(5,12,'删除','delBtn','delete','2016-10-16 13:55:52'),
	(6,12,'导出','exportBtn','exportCsv','2016-10-16 13:55:52'),
	(7,10,'增加','addBtn','add,addPage','2016-10-16 14:11:44'),
	(8,10,'修改','updateBtn','update,updatePage','2016-10-16 14:11:44'),
	(9,10,'删除','delBtn','delete','2016-10-16 14:11:44'),
	(10,10,'导出','exportBtn','exportCsv','2016-10-16 14:11:44'),
	(11,11,'增加','addBtn','add,addPage','2016-10-16 14:14:28'),
	(12,11,'修改','updateBtn','update,updatePage','2016-10-16 14:14:28'),
	(13,11,'删除','delBtn','delete','2016-10-16 14:14:28'),
	(14,11,'导出','exportBtn','exportCsv','2016-10-16 14:14:28');

/*!40000 ALTER TABLE `sys_menu_btn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu_datarule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu_datarule`;

CREATE TABLE `sys_menu_datarule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `symbol` varchar(50) DEFAULT NULL COMMENT '符号',
  `value` varchar(100) DEFAULT NULL COMMENT 'sql条件值',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_menu_datarule` WRITE;
/*!40000 ALTER TABLE `sys_menu_datarule` DISABLE KEYS */;

INSERT INTO `sys_menu_datarule` (`id`, `menu_id`, `field_name`, `symbol`, `value`, `create_time`)
VALUES
	(1,4,'status','=','0','2016-02-26 17:36:41'),
	(2,4,'reg_time','<=','2016-01-01','2016-03-01 23:19:34'),
	(3,12,'status','=','1','2016-09-27 00:16:00');

/*!40000 ALTER TABLE `sys_menu_datarule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_oplog`;

CREATE TABLE `sys_oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `op_content` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统操作日志';



# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(11) DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色管理';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `role_name`, `create_time`)
VALUES
	(1,'系统管理员','2016-02-04 21:05:45'),
	(2,'内容运营','2016-02-04 21:06:12'),
	(4,'readonly','2016-10-16 14:22:10');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_btn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_btn`;

CREATE TABLE `sys_role_btn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `btn_id` int(11) DEFAULT NULL COMMENT '按钮id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role_btn` WRITE;
/*!40000 ALTER TABLE `sys_role_btn` DISABLE KEYS */;

INSERT INTO `sys_role_btn` (`id`, `role_id`, `btn_id`, `create_time`)
VALUES
	(197,2,10,'2016-10-16 15:01:56'),
	(198,2,9,'2016-10-16 15:01:56'),
	(199,2,8,'2016-10-16 15:01:56'),
	(200,2,7,'2016-10-16 15:01:56'),
	(201,2,14,'2016-10-16 15:01:56'),
	(202,2,13,'2016-10-16 15:01:56'),
	(203,2,12,'2016-10-16 15:01:56'),
	(204,2,11,'2016-10-16 15:01:56'),
	(205,2,6,'2016-10-16 15:01:56'),
	(206,2,5,'2016-10-16 15:01:56'),
	(207,2,4,'2016-10-16 15:01:56'),
	(208,2,3,'2016-10-16 15:01:56'),
	(209,1,10,'2016-10-16 15:03:36'),
	(210,1,9,'2016-10-16 15:03:36'),
	(211,1,8,'2016-10-16 15:03:36'),
	(212,1,7,'2016-10-16 15:03:36'),
	(213,1,14,'2016-10-16 15:03:36'),
	(214,1,13,'2016-10-16 15:03:36'),
	(215,1,12,'2016-10-16 15:03:36'),
	(216,1,11,'2016-10-16 15:03:36'),
	(217,1,6,'2016-10-16 15:03:36'),
	(218,1,5,'2016-10-16 15:03:36'),
	(219,1,4,'2016-10-16 15:03:36'),
	(220,1,3,'2016-10-16 15:03:36');

/*!40000 ALTER TABLE `sys_role_btn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_datarule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_datarule`;

CREATE TABLE `sys_role_datarule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `datarule_id` int(11) NOT NULL COMMENT '数据规则',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据规则';

LOCK TABLES `sys_role_datarule` WRITE;
/*!40000 ALTER TABLE `sys_role_datarule` DISABLE KEYS */;

INSERT INTO `sys_role_datarule` (`id`, `role_id`, `datarule_id`, `create_time`)
VALUES
	(17,4,3,'2016-10-16 14:25:34'),
	(18,3,3,'2016-10-16 15:01:17'),
	(19,2,2,'2016-10-16 15:01:56'),
	(20,2,1,'2016-10-16 15:01:56'),
	(21,1,2,'2016-10-16 15:03:36'),
	(22,1,3,'2016-10-16 15:03:36');

/*!40000 ALTER TABLE `sys_role_datarule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`)
VALUES
	(457,4,12,'2016-10-16 14:25:34'),
	(458,4,10,'2016-10-16 14:25:34'),
	(459,4,11,'2016-10-16 14:25:34'),
	(460,2,12,'2016-10-16 15:01:56'),
	(461,2,10,'2016-10-16 15:01:56'),
	(462,2,11,'2016-10-16 15:01:56'),
	(463,1,12,'2016-10-16 15:03:36'),
	(464,1,10,'2016-10-16 15:03:36'),
	(465,1,11,'2016-10-16 15:03:36'),
	(466,1,6,'2016-10-16 15:03:36'),
	(467,1,7,'2016-10-16 15:03:36'),
	(468,1,2,'2016-10-16 15:03:36'),
	(469,1,3,'2016-10-16 15:03:36'),
	(470,1,4,'2016-10-16 15:03:36'),
	(471,1,13,'2016-10-16 15:03:36');

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `roles` varchar(100) DEFAULT NULL COMMENT '角色',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `user_name`, `password`, `roles`, `create_time`)
VALUES
	(1,'admin','123456',NULL,'2016-01-08 15:33:05'),
	(2,'test','123456','2','2016-01-08 15:35:12'),
	(6,'zhong','123456','2','2016-02-21 01:19:47'),
	(7,'readonly','123456','4','2016-10-16 14:22:46');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zcurd_field
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线表单字段';

LOCK TABLES `zcurd_field` WRITE;
/*!40000 ALTER TABLE `zcurd_field` DISABLE KEYS */;

INSERT INTO `zcurd_field` (`id`, `head_id`, `field_name`, `column_name`, `column_length`, `data_type`, `input_type`, `is_show_list`, `is_allow_detail`, `is_allow_add`, `is_allow_update`, `is_search`, `is_allow_null`, `dict_sql`, `order_num`, `search_type`, `is_sum`, `create_time`)
VALUES
	(1,1,'create_time','创建时间',130,'timestamp','easyui-textbox',1,1,0,0,0,1,'',7,1,0,'2016-01-11 21:58:48'),
	(2,1,'func_content','方法内容',120,'text','textarea',0,1,1,1,0,0,'',6,1,0,'2016-01-11 21:58:48'),
	(4,1,'location','按钮位置',80,'int','easyui-combobox',1,1,1,1,0,0,'select 1, \'顶部\' union all select 2, \'行内\'',4,1,0,'2016-01-11 21:58:48'),
	(5,1,'action','行为',80,'int','easyui-combobox',1,1,1,1,0,0,'select 0, \'自定义\' union all select 1, \'打开子页面\'',5,1,0,'2016-01-11 21:58:48'),
	(6,2,'create_time','创建时间',130,'timestamp','easyui-textbox',1,1,0,0,0,1,'',5,1,0,'2016-01-12 15:35:01'),
	(7,2,'js_content','js内容',120,'text','textarea',0,1,1,1,0,0,'',4,1,0,'2016-01-12 15:35:01'),
	(8,2,'page','页面',120,'varchar','easyui-textbox',1,1,1,1,0,0,'',3,1,0,'2016-01-12 15:35:01'),
	(9,2,'head_id','所属表单',120,'int','easyui-combobox',1,1,1,1,1,0,'select id, form_name from zcurd_head',2,1,0,'2016-01-12 15:35:01'),
	(26,5,'menu_id','所属菜单',100,'int','easyui-combobox',1,1,1,1,1,0,'select id, menu_name from sys_menu',1,1,0,'2016-02-14 16:35:56'),
	(28,5,'class_name','页面class名称',100,'varchar','easyui-textbox',1,1,1,1,0,0,'',3,1,0,'2016-02-14 16:35:56'),
	(27,5,'btn_name','按钮名称',100,'varchar','easyui-textbox',1,1,1,1,0,0,'',2,1,0,'2016-02-14 16:35:56'),
	(34,6,'value','字段件值',80,'varchar','easyui-textbox',1,1,1,1,0,0,'',5,1,0,'2016-02-25 23:55:58'),
	(36,6,'symbol','符号',80,'varchar','easyui-combobox',1,1,1,1,0,0,'select dict_key, dict_value from sys_dict where dict_type=\'datarule_symbol\'',4,1,0,'2016-02-28 03:20:56'),
	(33,6,'field_name','字段名称',100,'varchar','easyui-textbox',1,1,1,1,0,0,'',3,1,0,'2016-02-25 23:55:58'),
	(32,6,'menu_id','菜单',100,'int','easyui-combobox',1,1,1,1,1,0,'select id, menu_name from sys_menu',2,1,0,'2016-02-25 23:55:58'),
	(42,8,'id','id',120,'int','easyui-numberspinner',1,1,1,1,0,0,'',0,1,0,'2016-02-12 01:58:39'),
	(43,8,'role_name','角色名称',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',0,1,0,'2016-02-12 01:58:39'),
	(44,8,'create_time','创建时间',120,'timestamp','easyui-datebox',1,1,0,0,0,1,'',0,1,0,'2016-02-12 01:58:39'),
	(30,5,'create_time','创建时间',120,'timestamp','easyui-datebox',0,0,0,0,0,0,'',5,1,0,'2016-02-14 16:35:56'),
	(37,7,'id','id',120,'int','easyui-numberspinner',1,1,1,1,0,0,'',0,1,0,'2016-03-01 04:39:14'),
	(41,7,'create_time','创建时间',120,'timestamp','easyui-datebox',1,1,0,0,1,0,'',4,2,0,'2016-03-01 04:39:14'),
	(40,7,'dict_value','值',120,'varchar','easyui-textbox',1,1,1,1,1,0,'',2,1,0,'2016-03-01 04:39:14'),
	(39,7,'dict_key','键',120,'varchar','easyui-textbox',1,1,1,1,1,0,'',3,1,0,'2016-03-01 04:39:14'),
	(38,7,'dict_type','类型',120,'varchar','easyui-combobox',1,1,1,1,1,0,'select distinct dict_type as \'key\', dict_type as \'value\' from sys_dict',1,1,0,'2016-03-01 04:39:14'),
	(61,12,'roles','角色',120,'varchar','easyui-combobox',1,1,1,1,0,1,'select id, role_name from sys_role',4,1,0,'2016-02-23 04:31:08'),
	(60,12,'create_time','创建时间',120,'timestamp','easyui-textbox',1,1,0,0,1,1,'',5,2,0,'2016-01-07 21:31:45'),
	(59,12,'password','密码',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',3,1,0,'2016-01-07 21:31:45'),
	(57,12,'id','id',120,'int','easyui-textbox',1,1,1,1,0,1,'',1,1,0,'2016-01-07 21:31:45'),
	(58,12,'user_name','用户名',120,'varchar','easyui-textbox',1,1,1,1,1,1,'',2,1,0,'2016-01-07 21:31:45'),
	(195,15,'overfueremark','逾期记录',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,124,1,0,'2016-09-18 17:31:32'),
	(196,15,'cheLoanMoney','cheLoanMoney',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,125,1,0,'2016-09-18 17:31:32'),
	(192,15,'mortgageremark','按揭备注',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,121,1,0,'2016-09-18 17:31:32'),
	(193,15,'repaystatus','还款情况',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,122,1,0,'2016-09-18 17:31:32'),
	(194,15,'overduecount','逾期次数',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,123,1,0,'2016-09-18 17:31:32'),
	(31,6,'id','id',120,'int','easyui-numberspinner',1,1,1,1,0,0,'',1,1,0,'2016-02-25 23:55:58'),
	(190,15,'archremark','资料归档备注',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,119,1,0,'2016-09-18 17:31:32'),
	(191,15,'mortgagestatus','按揭情况',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,120,1,0,'2016-09-18 17:31:32'),
	(188,15,'archstatus','资料归档情况',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,117,1,0,'2016-09-18 17:31:32'),
	(189,15,'archtime','资料归档时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,118,1,0,'2016-09-18 17:31:32'),
	(186,15,'gjrelation','共借人关系',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,115,1,0,'2016-09-18 17:31:32'),
	(187,15,'approvalopinion','审批意见',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,116,1,0,'2016-09-18 17:31:32'),
	(185,15,'buyhouseaddress','客户新买房新地址',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,114,1,0,'2016-09-18 17:31:32'),
	(183,15,'loanMoney','loanMoney',120,'double','easyui-textbox',1,1,1,1,0,1,NULL,112,1,0,'2016-09-18 17:31:32'),
	(184,15,'creditLevel','信用卡等级',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,113,1,0,'2016-09-18 17:31:32'),
	(182,15,'refundtime','退款时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,111,1,0,'2016-09-18 17:31:32'),
	(181,15,'refundamount','退款金额',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,110,1,0,'2016-09-18 17:31:32'),
	(180,15,'consultantphone','顾问号码',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,109,1,0,'2016-09-18 17:31:32'),
	(179,15,'houseConsultant','职业顾问',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,108,1,0,'2016-09-18 17:31:32'),
	(178,15,'loanbankaccount','还款银行卡号',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,107,1,0,'2016-09-18 17:31:32'),
	(177,15,'accountbranch','开户支行',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,106,1,0,'2016-09-18 17:31:32'),
	(175,15,'urgentlevel','紧急程度',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,104,1,0,'2016-09-18 17:31:32'),
	(176,15,'applyloandate','申请放款时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,105,1,0,'2016-09-18 17:31:32'),
	(174,15,'othertime','othertime',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,103,1,0,'2016-09-18 17:31:32'),
	(173,15,'otheramount','加他付款方式',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,102,1,0,'2016-09-18 17:31:32'),
	(172,15,'transfertime','转账时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,101,1,0,'2016-09-18 17:31:32'),
	(170,15,'cashtime','现金付款时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,99,1,0,'2016-09-18 17:31:32'),
	(171,15,'transferamount','转账金额',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,100,1,0,'2016-09-18 17:31:32'),
	(169,15,'cashamount','现金金额',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,98,1,0,'2016-09-18 17:31:32'),
	(168,15,'postime','pos刷卡时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,97,1,0,'2016-09-18 17:31:32'),
	(167,15,'posamount','放款金额',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,96,1,0,'2016-09-18 17:31:32'),
	(166,15,'recviway','还款方式1 pos机器 2现金  3转账  4其他',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,95,1,0,'2016-09-18 17:31:32'),
	(165,15,'loantime','放款时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,94,1,0,'2016-09-18 17:31:32'),
	(164,15,'loanstatus','放款状态',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,93,1,0,'2016-09-18 17:31:32'),
	(162,15,'signstatus','签约状态',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,91,1,0,'2016-09-18 17:31:32'),
	(163,15,'signtime','签约时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,92,1,0,'2016-09-18 17:31:32'),
	(161,15,'repay','repay',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,90,1,0,'2016-09-18 17:31:32'),
	(160,15,'period','period',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,89,1,0,'2016-09-18 17:31:32'),
	(158,15,'fkid','fkid',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,87,1,0,'2016-09-18 17:31:32'),
	(159,15,'personPath','personPath',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,88,1,0,'2016-09-18 17:31:32'),
	(157,15,'examindate','报审时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,86,1,0,'2016-09-18 17:31:32'),
	(156,15,'fundname','fundname',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,85,1,0,'2016-09-18 17:31:32'),
	(154,15,'loantimelimit','loantimelimit',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,83,1,0,'2016-09-18 17:31:32'),
	(155,15,'fund','fund',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,84,1,0,'2016-09-18 17:31:32'),
	(153,15,'zcompanyaddress','zcompanyaddress',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,82,1,0,'2016-09-18 17:31:32'),
	(152,15,'gunitaddress','gunitaddress',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,81,1,0,'2016-09-18 17:31:32'),
	(151,15,'xsname','xsname',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,80,1,0,'2016-09-18 17:31:32'),
	(150,15,'xsid','xsid',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,79,1,0,'2016-09-18 17:31:32'),
	(149,15,'relations','relations',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,78,1,0,'2016-09-18 17:31:32'),
	(148,15,'creditLoanMoney','creditLoanMoney',120,'double','easyui-textbox',1,1,1,1,0,1,NULL,77,1,0,'2016-09-18 17:31:32'),
	(147,15,'zenterpborrow','zenterpborrow',120,'double','easyui-textbox',1,1,1,1,0,1,NULL,76,1,0,'2016-09-18 17:31:32'),
	(146,15,'creditNumber','creditNumber',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,75,1,0,'2016-09-18 17:31:32'),
	(145,15,'aname','aname',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,74,1,0,'2016-09-18 17:31:32'),
	(144,15,'ctime','ctime',120,'datetime','easyui-textbox',1,1,1,1,0,1,NULL,73,1,0,'2016-09-18 17:31:32'),
	(143,15,'adid','adid',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,72,1,0,'2016-09-18 17:31:32'),
	(142,15,'contposition','紧急联系人工作职位',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,71,1,0,'2016-09-18 17:31:32'),
	(141,15,'contworkdep','紧急联系人工作部门',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,70,1,0,'2016-09-18 17:31:32'),
	(140,15,'contunitaddress','紧急联系人单位地址',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,69,1,0,'2016-09-18 17:31:32'),
	(139,15,'contunitphone','紧急联系人单位电话',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,68,1,0,'2016-09-18 17:31:32'),
	(138,15,'contunitname','紧急联系人单位名称',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,67,1,0,'2016-09-18 17:31:32'),
	(136,15,'contphone','紧急联系人住宅电话',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,65,1,0,'2016-09-18 17:31:32'),
	(137,15,'contaddress','紧急联系人地址',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,66,1,0,'2016-09-18 17:31:32'),
	(135,15,'contmobile','紧急联系人电话',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,64,1,0,'2016-09-18 17:31:32'),
	(134,15,'contloan','经济联系人是否知晓贷款',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,63,1,0,'2016-09-18 17:31:32'),
	(133,15,'contrelation','紧急联系人关系',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,62,1,0,'2016-09-18 17:31:32'),
	(132,15,'contsex','紧急联系人性别',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,61,1,0,'2016-09-18 17:31:32'),
	(131,15,'contage','紧急联系人年龄',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,60,1,0,'2016-09-18 17:31:32'),
	(130,15,'contname','紧急联系人姓名',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,59,1,0,'2016-09-18 17:31:32'),
	(129,15,'otherloan','其他贷款',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,58,1,0,'2016-09-18 17:31:32'),
	(128,15,'creditconsume','信用卡已消费',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,57,1,0,'2016-09-18 17:31:32'),
	(127,15,'creditlimit','信用卡最高额度',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,56,1,0,'2016-09-18 17:31:32'),
	(126,15,'bankaccount','用户银行账户',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,55,1,0,'2016-09-18 17:31:32'),
	(125,15,'age','年龄',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,54,1,0,'2016-09-18 17:31:32'),
	(124,15,'zsharesratio','占股比例-自雇',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,53,1,0,'2016-09-18 17:31:32'),
	(123,15,'zmanageplace','经营场所-自雇',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,52,1,0,'2016-09-18 17:31:32'),
	(122,15,'zenterploan','企业借款-自雇',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,51,1,0,'2016-09-18 17:31:32'),
	(121,15,'zenterpfund','企业资产-自雇',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,50,1,0,'2016-09-18 17:31:32'),
	(120,15,'zyearbus','年营业额-自雇',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,49,1,0,'2016-09-18 17:31:32'),
	(119,15,'zmonincome','月收入—自雇',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,48,1,0,'2016-09-18 17:31:32'),
	(118,15,'zindustrytype','行业类型-自雇',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,47,1,0,'2016-09-18 17:31:32'),
	(116,15,'gsalaryway','工作发放形式-工薪',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,45,1,0,'2016-09-18 17:31:32'),
	(117,15,'zcompanyname','企业名-自雇',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,46,1,0,'2016-09-18 17:31:32'),
	(115,15,'gworklife','工作年限-工薪',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,44,1,0,'2016-09-18 17:31:32'),
	(114,15,'gmonincome','月收入-工薪',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,43,1,0,'2016-09-18 17:31:32'),
	(113,15,'gjoblevel','工作级别-工薪',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,42,1,0,'2016-09-18 17:31:32'),
	(112,15,'gunitnature','单位性质-工薪',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,41,1,0,'2016-09-18 17:31:32'),
	(111,15,'gunitname','单位名称-工薪',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,40,1,0,'2016-09-18 17:31:32'),
	(110,15,'job','职业',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,39,1,0,'2016-09-18 17:31:32'),
	(109,15,'familyaddress','家庭地址',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,38,1,0,'2016-09-18 17:31:32'),
	(108,15,'marriagestatus','婚姻状态',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,37,1,0,'2016-09-18 17:31:32'),
	(106,15,'applyamount','申请金额',120,'double','easyui-textbox',1,1,1,1,0,1,NULL,35,1,0,'2016-09-18 17:31:32'),
	(107,15,'homestatus','置业状况',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,36,1,0,'2016-09-18 17:31:32'),
	(105,15,'loanproduct','贷款产品',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,34,1,0,'2016-09-18 17:31:32'),
	(104,15,'fristpayratio','首付比例',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,33,1,0,'2016-09-18 17:31:32'),
	(103,15,'buyhouseamount','购房金额',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,32,1,0,'2016-09-18 17:31:32'),
	(102,15,'familycount','家庭人口数量',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,31,1,0,'2016-09-18 17:31:32'),
	(101,15,'salaryway','工资发放形式',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,30,1,0,'2016-09-18 17:31:32'),
	(100,15,'domloction','户籍所在地',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,29,1,0,'2016-09-18 17:31:32'),
	(98,15,'higdegree','最高学位',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,27,1,0,'2016-09-18 17:31:32'),
	(99,15,'health','健康状况',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,28,1,0,'2016-09-18 17:31:32'),
	(97,15,'pidunit','发证机关',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,26,1,0,'2016-09-18 17:31:32'),
	(96,15,'pidvaildity','证件有效期',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,25,1,0,'2016-09-18 17:31:32'),
	(95,15,'pidtype','证件类型',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,24,1,0,'2016-09-18 17:31:32'),
	(94,15,'nation','民族',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,23,1,0,'2016-09-18 17:31:32'),
	(93,15,'natiomality','国籍',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,22,1,0,'2016-09-18 17:31:32'),
	(211,16,'create_time','创建时间',120,'timestamp','easyui-textbox',1,1,1,1,0,0,'',14,1,0,'2016-09-18 17:31:55'),
	(208,16,'change_ratio','涨跌幅',120,'double','easyui-textbox',1,1,1,1,0,1,'',11,1,0,'2016-09-18 17:31:55'),
	(209,16,'turnover_volume','成交量',120,'bigint','easyui-textbox',1,1,1,1,0,1,'',12,1,0,'2016-09-18 17:31:55'),
	(210,16,'turnover_money','成交金额',120,'bigint','easyui-textbox',1,1,1,1,0,1,'',13,1,0,'2016-09-18 17:31:55'),
	(205,16,'opening_price','开盘价',120,'double','easyui-textbox',1,1,1,1,0,1,'',8,2,0,'2016-09-18 17:31:55'),
	(206,16,'pre','前收盘',120,'double','easyui-textbox',1,1,1,1,0,1,'',9,1,0,'2016-09-18 17:31:55'),
	(207,16,'change_amount','涨跌额',120,'double','easyui-textbox',1,1,1,1,0,1,'',10,1,0,'2016-09-18 17:31:55'),
	(204,16,'minimum_price','最低价',120,'double','easyui-textbox',1,1,1,1,1,1,'',7,2,0,'2016-09-18 17:31:55'),
	(203,16,'top_price','最高价',120,'double','easyui-textbox',1,1,1,1,1,1,'',6,2,0,'2016-09-18 17:31:55'),
	(202,16,'closing_price','收盘价',120,'double','easyui-textbox',1,1,1,1,1,1,'',5,2,0,'2016-09-18 17:31:55'),
	(201,16,'name','名称',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',4,1,0,'2016-09-18 17:31:55'),
	(92,15,'birthday','出生年月',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,21,1,0,'2016-09-18 17:31:32'),
	(91,15,'sex','客户性别',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,20,1,0,'2016-09-18 17:31:32'),
	(90,15,'etime','贷款结束时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,19,1,0,'2016-09-18 17:31:32'),
	(89,15,'stime','贷款开始时间',120,'date','easyui-textbox',1,1,1,1,0,1,NULL,18,1,0,'2016-09-18 17:31:32'),
	(88,15,'price','贷款金额',120,'int','easyui-textbox',1,1,1,1,0,0,NULL,17,1,0,'2016-09-18 17:31:32'),
	(87,15,'ordercode','订单id',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,16,1,0,'2016-09-18 17:31:32'),
	(86,15,'tempcontent','修改数据',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,15,1,0,'2016-09-18 17:31:32'),
	(85,15,'score','按模型计算得分',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,14,1,0,'2016-09-18 17:31:32'),
	(84,15,'mid','使用模型',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,13,1,0,'2016-09-18 17:31:32'),
	(83,15,'status','状态',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,12,1,0,'2016-09-18 17:31:32'),
	(82,15,'type','客户类型',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,11,1,0,'2016-09-18 17:31:32'),
	(81,15,'pname','项目名',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,10,1,0,'2016-09-18 17:31:32'),
	(80,15,'pid','项目id',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,9,1,0,'2016-09-18 17:31:32'),
	(79,15,'cityname','城市名',120,'varchar','easyui-textbox',1,1,1,1,0,1,NULL,8,1,0,'2016-09-18 17:31:32'),
	(78,15,'cityid','城市id',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,7,1,0,'2016-09-18 17:31:32'),
	(77,15,'mobile','客户手机号码',120,'varchar','easyui-textbox',1,1,1,1,1,1,'',6,1,0,'2016-09-18 17:31:32'),
	(76,15,'idcard','客户身份证',120,'varchar','easyui-textbox',1,1,1,1,1,1,'',5,1,0,'2016-09-18 17:31:32'),
	(75,15,'name','客户姓名',120,'varchar','easyui-textbox',1,1,1,1,1,1,'',4,1,0,'2016-09-18 17:31:32'),
	(74,15,'parentid','主借人id',120,'int','easyui-textbox',1,1,1,1,1,1,'',3,1,0,'2016-09-18 17:31:32'),
	(73,15,'source','客户来源',120,'int','easyui-textbox',1,1,1,1,1,1,'',2,1,0,'2016-09-18 17:31:32'),
	(72,15,'cid','主键客户信息表',120,'int','easyui-textbox',1,1,1,1,0,0,'',1,1,0,'2016-09-18 17:31:32'),
	(197,15,'houseLoanMoney','houseLoanMoney',120,'int','easyui-textbox',1,1,1,1,0,1,NULL,126,1,0,'2016-09-18 17:31:32'),
	(198,16,'id','id',120,'int','easyui-textbox',1,1,1,1,0,0,'',1,1,0,'2016-09-18 17:31:55'),
	(199,16,'dt','日期',120,'date','easyui-datebox',1,1,1,1,1,1,'',2,2,0,'2016-09-18 17:31:55'),
	(200,16,'code','股票代码',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',3,1,0,'2016-09-18 17:31:55'),
	(217,17,'create_time','创建时间',120,'timestamp','easyui-textbox',1,1,1,1,1,0,'',6,2,0,'2016-09-18 17:40:23'),
	(216,17,'status','状态',100,'int','easyui-combobox',1,1,1,1,1,1,'[dbSource=zcurd_busi]select \'0\', \'未采集\' union all select \'1\', \'采集中\' union all select \'2\', \'采集完\'',5,1,0,'2016-09-18 17:40:23'),
	(215,17,'url','阅读地址',250,'varchar','easyui-textbox',1,1,1,1,0,1,'',4,1,0,'2016-09-18 17:40:23'),
	(214,17,'book_name','书名',120,'varchar','easyui-textbox',1,1,1,1,1,1,'',3,1,0,'2016-09-18 17:40:23'),
	(213,17,'source','来源',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',2,1,0,'2016-09-18 17:40:23'),
	(212,17,'id','id',120,'int','easyui-textbox',1,1,1,1,0,0,'',1,1,0,'2016-09-18 17:40:23'),
	(218,17,'last_update_time','最后更新时间',120,'datetime','easyui-textbox',0,1,0,1,0,1,'',7,1,0,'2016-09-18 17:40:23'),
	(3,1,'btn_name','按钮名称',80,'varchar','easyui-textbox',1,1,1,1,0,0,'',3,1,0,'2016-01-11 21:58:48'),
	(10000,1,'head_id','所属表单',100,'int','easyui-combobox',1,1,1,1,1,0,'select id, form_name from zcurd_head',2,1,0,'2016-09-27 00:06:53'),
	(35,6,'create_time','创建时间',120,'timestamp','easyui-datebox',0,0,0,0,0,0,'',6,1,0,'2016-02-25 23:55:58'),
	(25,5,'id','id',120,'int','easyui-numberspinner',1,1,1,1,0,0,'',0,1,0,'2016-02-14 16:35:56'),
	(29,5,'method_name','后台method名称',120,'varchar','easyui-textbox',1,1,1,1,0,1,'',4,1,0,'2016-02-14 16:35:56');

/*!40000 ALTER TABLE `zcurd_field` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zcurd_head
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线表单';

LOCK TABLES `zcurd_head` WRITE;
/*!40000 ALTER TABLE `zcurd_head` DISABLE KEYS */;

INSERT INTO `zcurd_head` (`id`, `table_name`, `form_name`, `id_field`, `is_auto`, `form_type`, `dialog_size`, `db_source`, `create_time`)
VALUES
	(1,'zcurd_head_btn','表单扩展按钮','id',1,1,'600x400','zcurd_base','2016-01-11 21:58:48'),
	(2,'zcurd_head_js','表单扩展js','id',1,1,'600x400','zcurd_base','2016-01-12 15:35:01'),
	(5,'sys_menu_btn','菜单按钮（权限编辑）','id',1,1,'400x300','zcurd_base','2016-02-14 16:35:56'),
	(6,'sys_menu_datarule','菜单数据（权限编辑）','id',1,1,'400x300','zcurd_base','2016-02-25 23:55:58'),
	(7,'sys_dict','数据字典','id',1,1,'400x300','zcurd_base','2016-03-01 04:39:14'),
	(8,'sys_role','角色管理','id',1,1,'600x400','zcurd_base','2016-02-12 01:58:39'),
	(12,'sys_user','用户管理','id',1,1,'400x300','zcurd_base','2016-01-07 21:31:45'),
	(15,'customer','客户管理','cid',1,1,'600x400','zcurd_busi','2016-09-18 17:31:32'),
	(16,'stock_history_log','股票历史数据','id',1,1,'600x400','zcurd_busi','2016-09-18 17:31:55'),
	(17,'claw_book_url','小说管理','id',1,1,'600x400','zcurd_busi','2016-09-18 17:40:23');

/*!40000 ALTER TABLE `zcurd_head` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zcurd_head_btn
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单按钮';

LOCK TABLES `zcurd_head_btn` WRITE;
/*!40000 ALTER TABLE `zcurd_head_btn` DISABLE KEYS */;

INSERT INTO `zcurd_head_btn` (`id`, `head_id`, `btn_name`, `location`, `action`, `func_content`, `create_time`)
VALUES
	(1,8,'权限设置',2,1,'function(index) {\r\n var row = datagrid.datagrid(\"getRows\")[index];\r\n  //var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\r\n var url = basePath + \"/role/editAuthPage?roleId=\" + row.id;\r\n _openSubPage(url);\r\n}','2016-02-12 21:23:10'),
	(2,134,'管理',2,1,'function(index) {\n var row = datagrid.datagrid(\"getRows\")[index];\n  var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\n _openSubPage(url);\n}','2016-01-12 13:28:50'),
	(3,133,'测试',2,0,'function(){}','2016-01-13 09:30:35');

/*!40000 ALTER TABLE `zcurd_head_btn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zcurd_head_js
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zcurd_head_js`;

CREATE TABLE `zcurd_head_js` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) DEFAULT NULL COMMENT '所属表单',
  `page` varchar(50) DEFAULT NULL COMMENT '页面',
  `js_content` text COMMENT 'js内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单扩展js';

LOCK TABLES `zcurd_head_js` WRITE;
/*!40000 ALTER TABLE `zcurd_head_js` DISABLE KEYS */;

INSERT INTO `zcurd_head_js` (`id`, `head_id`, `page`, `js_content`, `create_time`)
VALUES
	(1,134,'list','var operateWidth = 80;\r\nvar subPageWidth = \"50%\";\r\nvar subPageTitle = \"等级详情\";\r\ndgOptions.singleSelect=true;','2016-01-12 16:25:45'),
	(2,5,'list','$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n  	var btnIds = window.parent.getCurrMenuBtns();\n 	var rows = datagrid.datagrid(\"getData\").rows;\n 	if(btnIds && rows.length > 0) {\n   		$.each(rows, function(i, item) {\n      		$.each(btnIds, function(j, btnId) {\n	       		if(item.id == btnId) {\n	          		datagrid.datagrid(\"selectRow\", j);\n	        	}\n     		});\n   		});\n 	}\n\n 	//如果无数据，则显示一键生成\n	if(rows.length == 0) {\n		genAuthBtnBatch();\n	}\n}\n\n//显示一键生成\nfunction genAuthBtnBatch() {\n	$(\"<button id=\'genAuthBtnBatchBtn\' style=\'position: fixed; top: 120px; left: 50%; margin-left: -30px; padding: 2px;\'>一键生成<button>\")\n	.linkbutton().click(function() {\n		$.post(\"../../role/genAuthBtnBatch\", {menuId: $(\"#menu_id\").val()}, function() {\n			$(\"#genAuthBtnBatchBtn\").remove();\n			showMsg(\"生成成功！\");\n			datagrid.datagrid(\"reload\");\n		});\n	}).appendTo(\"body\");\n}','2016-02-15 11:13:14'),
	(3,8,'list','var operateWidth = 80;\nvar subPageWidth = \"55%\";\nvar subPageTitle = \"权限设置\";\ndgOptions.singleSelect=true;','2016-02-16 16:32:31'),
	(4,131,'update','$(function() {\n  changeComboboxToMult(\"roles\");\n});','2016-02-23 23:09:57'),
	(5,12,'add','$(function() {\n changeComboboxToMult(\"roles\");\n});','2016-02-23 23:10:03'),
	(6,152,'list','$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections2 = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n var dataruleIds = window.parent.getCurrMenuDatarules();\n var rows = datagrid.datagrid(\"getData\").rows;\n if(dataruleIds && rows.length > 0) {\n    $.each(rows, function(i, item) {\n      $.each(dataruleIds, function(j, dataruleId) {\n       if(item.id == dataruleId) {\n         datagrid.datagrid(\"selectRow\", j);\n        }\n     });\n   });\n }\n}','2016-02-15 11:13:14'),
	(7,6,'list','$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections2 = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n	var dataruleIds = window.parent.getCurrMenuDatarules();\n	var rows = datagrid.datagrid(\"getData\").rows;\n	if(dataruleIds && rows.length > 0) {\n		$.each(rows, function(i, item) {\n			$.each(dataruleIds, function(j, dataruleId) {\n				if(item.id == dataruleId) {\n					datagrid.datagrid(\"selectRow\", j);\n				}\n			});\n		});\n	}\n}','2016-09-27 00:17:56'),
	(8,12,'update','$(function() {\n changeComboboxToMult(\"roles\");\n});','2016-09-27 00:40:00');

/*!40000 ALTER TABLE `zcurd_head_js` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
