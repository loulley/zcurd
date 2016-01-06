-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.27 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 zcurd 的数据库结构
CREATE DATABASE IF NOT EXISTS `zcurd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zcurd`;


-- 导出  表 zcurd.blog 结构
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  zcurd.blog 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`id`, `title`, `content`) VALUES
	(1, 'JFinal Demo Title here', 'JFinal Demo Content here'),
	(2, 'test 1', 'test 1'),
	(3, 'test 2', 'test 2'),
	(4, 'test 3', 'test 3'),
	(5, 'test 4', 'test 4');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;


-- 导出  表 zcurd.demo_users 结构
CREATE TABLE IF NOT EXISTS `demo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT '0' COMMENT '状态',
  `login_id` varchar(255) DEFAULT '' COMMENT '登录账户',
  `login_pwd` varchar(255) DEFAULT '' COMMENT '录登密码',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `info` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='游戏用户';

-- 正在导出表  zcurd.demo_users 的数据：~43 rows (大约)
/*!40000 ALTER TABLE `demo_users` DISABLE KEYS */;
INSERT INTO `demo_users` (`id`, `status`, `login_id`, `login_pwd`, `nickname`, `reg_time`, `info`) VALUES
	(1, 3, 'test1', '000000', '无极剑圣', '2014-12-30 00:55:49', ''),
	(2, 0, 'test2', '000000', '雪人骑士', '2014-12-30 00:55:49', ''),
	(3, 0, 'test3', '000000', '战争女神', '2014-12-30 00:55:49', ''),
	(4, 0, 'test4', '000000', '众星之子', '2014-12-30 00:55:49', ''),
	(5, 0, 'test5', '000000', '审判天使', '2014-12-30 00:55:49', ''),
	(6, 0, 'test6', '000000', '寒冰射手', '2014-12-30 00:55:49', ''),
	(7, 0, 'test7', '000000', '德玛西亚之力', '2014-12-30 00:55:49', ''),
	(8, 0, 'test8', '000000', '流浪法师', '2014-12-30 00:55:49', ''),
	(9, 0, 'test9', '000000', '卡牌大师', '2014-12-30 00:55:49', ''),
	(10, 0, 'test10', '000000', '堕落天使', '2014-12-30 00:55:49', ''),
	(11, 0, 'test11', '000000', '炼金术士', '2014-12-30 00:55:49', ''),
	(12, 0, 'test12', '000000', '熔岩巨兽', '2014-12-30 00:55:49', ''),
	(13, 0, 'test13', '000000', '祖安狂人', '2014-12-30 00:55:49', ''),
	(14, 0, 'test14', '000000', '钢铁大使', '2014-12-30 00:55:49', ''),
	(15, 0, 'test15', '000000', '寡妇制造者', '2014-12-30 00:55:49', ''),
	(16, 0, 'test16', '000000', '时光守护者', '2014-12-30 00:55:49', ''),
	(17, 0, 'test17', '000000', '末日使者', '2014-12-30 00:55:49', ''),
	(18, 0, 'test18', '000000', '殇之木乃伊', '2014-12-30 00:55:49', ''),
	(19, 0, 'test19', '000000', '牛头酋长', '2014-12-30 00:55:49', ''),
	(20, 0, 'test20', '000000', '邪恶小法师', '2014-12-30 00:55:49', ''),
	(21, 0, 'test21', '000000', '风暴之怒', '2014-12-30 00:55:49', ''),
	(22, 0, 'test22', '000000', '麦林炮手', '2014-12-30 00:55:49', ''),
	(23, 0, 'test23', '000000', '黑暗之女', '2014-12-30 00:55:49', ''),
	(24, 0, 'test24', '000000', '亡灵勇士', '2014-12-30 00:55:49', ''),
	(25, 0, 'test2511', '000000', '沙漠死神1', '2014-12-30 00:55:49', ''),
	(26, 0, 'test26', '000000', '蛮族之王', '2014-12-30 00:55:49', ''),
	(27, 0, 'test27', '000000', '德邦总管', '2014-12-30 00:55:49', ''),
	(28, 0, '1111', '1111', '死神传说', '2015-07-26 23:26:19', ''),
	(29, 11, '', '', '11', '2015-01-01 00:00:00', ''),
	(30, 1, '', '', '1', '2015-01-01 00:00:00', ''),
	(31, 1, '', '', '111', '2015-01-01 00:00:00', ''),
	(32, 1, '', '', 'qqq', '2016-01-02 00:00:00', ''),
	(33, 1, '', '', 'aa', '2016-01-02 22:15:53', ''),
	(34, 1, NULL, NULL, '呵呵', '2016-01-02 00:00:00', NULL),
	(35, 0, '', '', '中', '2016-01-02 22:49:09', ''),
	(36, 1, '', '', '国', '2016-01-02 22:49:24', ''),
	(37, 1, '1', '', '国', '2016-01-02 00:00:00', ''),
	(38, 1, '11', '1', 'aa', '2016-01-07 00:00:00', 'aa'),
	(45, 0, '', '', '111', '2016-01-03 23:50:11', ''),
	(49, 1, 'adfsa', 'asdfasd', 'adfsasd', '2016-01-14 00:00:00', 'asdfasf'),
	(50, 1, 'asdfas', 'asdf', 'asdfasdf', '2016-01-06 00:00:00', 'asdfasfa'),
	(51, 1, 'sss', 'sfsfas', '林林', '2016-01-05 19:24:29', '');
/*!40000 ALTER TABLE `demo_users` ENABLE KEYS */;


-- 导出  表 zcurd.dynamic_table 结构
CREATE TABLE IF NOT EXISTS `dynamic_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `field` varchar(50) DEFAULT NULL COMMENT '字段名',
  `field_value` varchar(50) DEFAULT NULL COMMENT '字段值',
  `cid` varchar(50) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_cid` (`field`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='dynamic_table';

-- 正在导出表  zcurd.dynamic_table 的数据：112 rows
/*!40000 ALTER TABLE `dynamic_table` DISABLE KEYS */;
INSERT INTO `dynamic_table` (`id`, `field`, `field_value`, `cid`) VALUES
	(5, 'source', '0', '1'),
	(6, 'name', '', '1'),
	(7, 'idcard', '450521198911104', '1'),
	(8, 'mobile', '', '1'),
	(9, 'cityid', '0', '1'),
	(10, 'cityname', NULL, '1'),
	(11, 'pid', '0', '1'),
	(12, 'pname', '', '1'),
	(13, 'type', '0', '1'),
	(14, 'status', '1', '1'),
	(15, 'mid', '1', '1'),
	(16, 'score', '1', '1'),
	(17, 'tempcontent', '1', '1'),
	(18, 'ctime', '2015-12-10 00:00:00', '1'),
	(19, 'adid', '11', '1'),
	(20, 'aname', '111', '1'),
	(21, 'source', '0', '2'),
	(22, 'name', 'sss', '2'),
	(23, 'idcard', '450521198911105', '2'),
	(24, 'mobile', '12334565884', '2'),
	(25, 'cityid', '12', '2'),
	(26, 'cityname', '深圳', '2'),
	(27, 'pid', '2', '2'),
	(28, 'pname', '深圳万达楼盘', '2'),
	(29, 'type', '0', '2'),
	(30, 'status', '0', '2'),
	(31, 'mid', '0', '2'),
	(32, 'score', '0', '2'),
	(33, 'tempcontent', NULL, '2'),
	(34, 'ctime', '2015-12-04 17:55:12', '2'),
	(35, 'adid', '0', '2'),
	(36, 'aname', 'test', '2'),
	(37, 'source', '0', '3'),
	(38, 'name', 'aaa', '3'),
	(39, 'idcard', '450521198911105', '3'),
	(40, 'mobile', '15121454584', '3'),
	(41, 'cityid', '12', '3'),
	(42, 'cityname', '深圳', '3'),
	(43, 'pid', '2', '3'),
	(44, 'pname', '深圳万达楼盘', '3'),
	(45, 'type', '0', '3'),
	(46, 'status', '0', '3'),
	(47, 'mid', '0', '3'),
	(48, 'score', '0', '3'),
	(49, 'tempcontent', NULL, '3'),
	(50, 'ctime', '2015-12-04 18:00:55', '3'),
	(51, 'adid', '0', '3'),
	(52, 'aname', 'test', '3'),
	(53, 'source', '0', '4'),
	(54, 'name', 'aa', '4'),
	(55, 'idcard', '450521198911105', '4'),
	(56, 'mobile', '12124545454', '4'),
	(57, 'cityid', '12', '4'),
	(58, 'cityname', '深圳', '4'),
	(59, 'pid', '3', '4'),
	(60, 'pname', '深圳碧桂园', '4'),
	(61, 'type', '0', '4'),
	(62, 'status', '0', '4'),
	(63, 'mid', '0', '4'),
	(64, 'score', '0', '4'),
	(65, 'tempcontent', NULL, '4'),
	(66, 'ctime', '2015-12-04 18:01:40', '4'),
	(67, 'adid', '0', '4'),
	(68, 'aname', 'test', '4'),
	(69, 'source', '0', '6'),
	(70, 'name', '1fd', '6'),
	(71, 'idcard', '450521198911100', '6'),
	(72, 'mobile', '12325498748', '6'),
	(73, 'cityid', '12', '6'),
	(74, 'cityname', '深圳', '6'),
	(75, 'pid', '2', '6'),
	(76, 'pname', '深圳万达楼盘', '6'),
	(77, 'type', '0', '6'),
	(78, 'status', '0', '6'),
	(79, 'mid', '0', '6'),
	(80, 'score', '0', '6'),
	(81, 'tempcontent', NULL, '6'),
	(82, 'ctime', '2015-12-04 18:06:16', '6'),
	(83, 'adid', '0', '6'),
	(84, 'aname', 'test', '6'),
	(85, 'source', '0', '7'),
	(86, 'name', 'ss', '7'),
	(87, 'idcard', '450521198911111', '7'),
	(88, 'mobile', '12145674845', '7'),
	(89, 'cityid', '12', '7'),
	(90, 'cityname', '深圳', '7'),
	(91, 'pid', '2', '7'),
	(92, 'pname', '深圳万达楼盘', '7'),
	(93, 'type', '0', '7'),
	(94, 'status', '0', '7'),
	(95, 'mid', '0', '7'),
	(96, 'score', '0', '7'),
	(97, 'tempcontent', NULL, '7'),
	(98, 'ctime', '2015-12-04 18:08:54', '7'),
	(99, 'adid', '0', '7'),
	(100, 'aname', 'test', '7'),
	(101, 'source', '0', '11'),
	(102, 'name', 'ccc', '11'),
	(103, 'idcard', '450521198911105', '11'),
	(104, 'mobile', '12134564848', '11'),
	(105, 'cityid', '13', '11'),
	(106, 'cityname', '苏州', '11'),
	(107, 'pid', '4', '11'),
	(108, 'pname', '', '11'),
	(109, 'type', '0', '11'),
	(110, 'status', '0', '11'),
	(111, 'mid', '0', '11'),
	(112, 'score', '0', '11'),
	(113, 'tempcontent', NULL, '11'),
	(114, 'ctime', NULL, '11'),
	(115, 'adid', '0', '11'),
	(116, 'aname', NULL, '11');
/*!40000 ALTER TABLE `dynamic_table` ENABLE KEYS */;


-- 导出  表 zcurd.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- 正在导出表  zcurd.sys_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


-- 导出  视图 zcurd.v_blog 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_blog` (
	`id` INT(11) NOT NULL,
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`content` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  表 zcurd.zcurd_field 结构
CREATE TABLE IF NOT EXISTS `zcurd_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL COMMENT '所属表',
  `field_name` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `column_name` varchar(100) DEFAULT NULL COMMENT '列表列名',
  `column_length` int(11) DEFAULT '120',
  `data_type` varchar(50) DEFAULT NULL COMMENT '数据类型',
  `is_show_list` int(11) DEFAULT '1' COMMENT '是否列表显示',
  `dict_sql` varchar(1000) DEFAULT NULL COMMENT '字典sql',
  `order_num` int(11) DEFAULT NULL COMMENT '顺序',
  `is_search` int(11) DEFAULT '0' COMMENT '是否搜索',
  `search_type` int(11) DEFAULT '1' COMMENT '搜索类型(1:值,2:范围)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='在线表单字段';

-- 正在导出表  zcurd.zcurd_field 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `zcurd_field` DISABLE KEYS */;
INSERT INTO `zcurd_field` (`id`, `head_id`, `field_name`, `column_name`, `column_length`, `data_type`, `is_show_list`, `dict_sql`, `order_num`, `is_search`, `search_type`, `create_time`) VALUES
	(1, 1, 'id', 'id', 120, 'int', 0, '', 1, 0, 1, NULL),
	(4, 1, 'table_name', '数据库表名', 120, 'varchar', 1, '', 2, 0, 1, NULL),
	(5, 1, 'form_name', '表单名称', 120, 'varchar', 1, '', 3, 0, 1, NULL),
	(6, 1, 'id_field', '主键字段', 120, 'varchar', 1, '', 4, 0, 1, NULL),
	(81, 1, 'is_auto', '是否自增', 120, 'int', 1, 'select 0, \'否\' union all select 1, \'是\'', 5, 0, 1, '2015-12-19 15:02:15'),
	(96, 121, 'id', 'id', 120, 'int', 1, '', 1, 0, 1, '2015-12-20 21:20:52'),
	(97, 121, 'status', '状态', 120, 'int', 1, 'select 0, \'否\' union all select 1, \'是\'', 3, 1, 1, '2015-12-20 21:20:52'),
	(98, 121, 'login_id', '登录账户', 120, 'varchar', 1, '', 4, 1, 1, '2015-12-20 21:20:52'),
	(99, 121, 'login_pwd', '录登密码', 120, 'varchar', 1, '', 5, 0, 1, '2015-12-20 21:20:52'),
	(100, 121, 'nickname', '昵称', 120, 'varchar', 1, '', 2, 1, 1, '2015-12-20 21:20:52'),
	(101, 121, 'reg_time', '注册时间', 120, 'timestamp', 1, '', 7, 1, 2, '2015-12-20 21:20:52'),
	(102, 121, 'info', '备注', 120, 'varchar', 1, '', 6, 0, 1, '2015-12-20 21:20:52'),
	(117, 120, 'id', 'id', 120, 'int', 1, '', 1, 0, 1, '2015-12-20 02:39:23'),
	(118, 120, 'status', '状态', 120, 'int', 1, '', 2, 0, 1, '2015-12-20 02:39:23'),
	(119, 120, 'login_id', '登录账户', 120, 'varchar', 1, '', 3, 0, 1, '2015-12-20 02:39:23'),
	(120, 120, 'login_pwd', '录登密码', 120, 'varchar', 1, '', 4, 0, 1, '2015-12-20 02:39:23'),
	(121, 120, 'nickname', '昵称', 120, 'varchar', 1, '', 5, 0, 1, '2015-12-20 02:39:23'),
	(122, 120, 'reg_time', '注册时间', 120, 'timestamp', 1, '', 6, 0, 1, '2015-12-20 02:39:23'),
	(123, 120, 'info', '备注', 120, 'varchar', 1, '', 7, 0, 1, '2015-12-20 02:39:23'),
	(128, 122, 'id', 'id', 120, 'int', 1, NULL, NULL, 0, 1, '2016-01-06 18:39:57'),
	(129, 122, 'field', '字段名', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:39:57'),
	(130, 122, 'field_value', '字段值', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:39:57'),
	(131, 122, 'cid', '客户id', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:39:57'),
	(132, 123, 'id', 'id', 120, 'int', 1, NULL, NULL, 0, 1, '2016-01-06 18:40:54'),
	(133, 123, 'field', '字段名', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:40:54'),
	(134, 123, 'field_value', '字段值', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:40:54'),
	(135, 123, 'cid', '客户id', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:40:54'),
	(136, 124, 'id', 'id', 120, 'int', 1, NULL, NULL, 0, 1, '2016-01-06 18:42:01'),
	(137, 124, 'title', 'title', 120, 'varchar', 1, NULL, NULL, 0, 1, '2016-01-06 18:42:01'),
	(138, 124, 'content', 'content', 120, 'mediumtext', 1, NULL, NULL, 0, 1, '2016-01-06 18:42:01');
/*!40000 ALTER TABLE `zcurd_field` ENABLE KEYS */;


-- 导出  表 zcurd.zcurd_head 结构
CREATE TABLE IF NOT EXISTS `zcurd_head` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL COMMENT '数据库表名',
  `form_name` varchar(100) DEFAULT NULL COMMENT '表单名称',
  `id_field` varchar(50) DEFAULT 'id' COMMENT '主键字段',
  `is_auto` int(11) DEFAULT '1' COMMENT '是否自增',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='在线表单';

-- 正在导出表  zcurd.zcurd_head 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `zcurd_head` DISABLE KEYS */;
INSERT INTO `zcurd_head` (`id`, `table_name`, `form_name`, `id_field`, `is_auto`, `create_time`) VALUES
	(1, 'zcurd_head', 'zcurd表', 'id', 1, '2015-12-06 23:34:33'),
	(2, 'zcurd_field ', 'zcurd字段', 'id', 1, '2015-12-06 23:34:33'),
	(3, 'sys_user', '系统用户', 'id', 0, '2015-12-06 23:34:33'),
	(120, 'demo_users', '游戏用户', 'id', 1, '2015-12-20 02:39:23'),
	(121, 'demo_users', '游戏用户', 'id', 1, '2015-12-20 21:20:52'),
	(122, 'dynamic_table', 'dynamic_table', 'id', 1, '2016-01-06 18:39:57'),
	(123, 'dynamic_table', 'dynamic_table', 'id', 1, '2016-01-06 18:40:54'),
	(124, 'v_blog', 'VIEW', 'id', 1, '2016-01-06 18:42:00');
/*!40000 ALTER TABLE `zcurd_head` ENABLE KEYS */;


-- 导出  视图 zcurd.v_blog 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_blog`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `v_blog` AS SELECT * from blog ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
