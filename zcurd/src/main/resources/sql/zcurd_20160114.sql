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

-- 导出  表 zcurd.blog 结构
DROP TABLE IF EXISTS `blog`;
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


-- 导出  表 zcurd.customer 结构
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键客户信息表',
  `source` int(11) DEFAULT '0' COMMENT '客户来源',
  `parentid` int(11) DEFAULT '0' COMMENT '主借人id',
  `name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `idcard` varchar(20) DEFAULT NULL COMMENT '客户身份证',
  `mobile` varchar(20) DEFAULT NULL COMMENT '客户手机号码',
  `cityid` int(11) DEFAULT '0' COMMENT '城市id',
  `cityname` varchar(50) DEFAULT NULL COMMENT '城市名',
  `pid` int(11) DEFAULT '0' COMMENT '项目id',
  `pname` varchar(50) DEFAULT NULL COMMENT '项目名',
  `type` int(11) DEFAULT '0' COMMENT '客户类型',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `mid` int(11) DEFAULT '0' COMMENT '使用模型',
  `score` int(11) DEFAULT '0' COMMENT '按模型计算得分',
  `tempcontent` varchar(11) DEFAULT NULL COMMENT '修改数据',
  `ordercode` varchar(50) DEFAULT NULL COMMENT '订单id',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '贷款金额',
  `stime` date DEFAULT NULL COMMENT '贷款开始时间',
  `etime` date DEFAULT NULL COMMENT '贷款结束时间',
  `sex` varchar(20) DEFAULT NULL COMMENT '客户性别',
  `birthday` date DEFAULT NULL COMMENT '出生年月',
  `natiomality` varchar(50) DEFAULT NULL COMMENT '国籍',
  `nation` varchar(50) DEFAULT NULL COMMENT '民族',
  `pidtype` varchar(50) DEFAULT NULL COMMENT '证件类型',
  `pidvaildity` date DEFAULT NULL COMMENT '证件有效期',
  `pidunit` varchar(50) DEFAULT NULL COMMENT '发证机关',
  `higdegree` varchar(20) DEFAULT NULL COMMENT '最高学位',
  `health` varchar(20) DEFAULT NULL COMMENT '健康状况',
  `domloction` varchar(50) DEFAULT NULL COMMENT '户籍所在地',
  `salaryway` varchar(20) DEFAULT NULL COMMENT '工资发放形式',
  `familycount` int(11) DEFAULT '0' COMMENT '家庭人口数量',
  `buyhouseamount` int(11) DEFAULT '0' COMMENT '购房金额',
  `fristpayratio` int(11) DEFAULT '0' COMMENT '首付比例',
  `loanproduct` varchar(20) DEFAULT NULL COMMENT '贷款产品',
  `applyamount` double DEFAULT '0' COMMENT '申请金额',
  `homestatus` varchar(50) DEFAULT NULL COMMENT '置业状况',
  `marriagestatus` varchar(20) DEFAULT NULL COMMENT '婚姻状态',
  `familyaddress` varchar(100) DEFAULT NULL COMMENT '家庭地址',
  `job` varchar(20) DEFAULT NULL COMMENT '职业',
  `gunitname` varchar(50) DEFAULT NULL COMMENT '单位名称-工薪',
  `gunitnature` varchar(50) DEFAULT NULL COMMENT '单位性质-工薪',
  `gjoblevel` varchar(20) DEFAULT NULL COMMENT '工作级别-工薪',
  `gmonincome` int(11) DEFAULT '0' COMMENT '月收入-工薪',
  `gworklife` varchar(20) DEFAULT NULL COMMENT '工作年限-工薪',
  `gsalaryway` varchar(50) DEFAULT NULL COMMENT '工作发放形式-工薪',
  `zcompanyname` varchar(50) DEFAULT NULL COMMENT '企业名-自雇',
  `zindustrytype` varchar(20) DEFAULT NULL COMMENT '行业类型-自雇',
  `zmonincome` int(11) DEFAULT '0' COMMENT '月收入—自雇',
  `zyearbus` int(11) DEFAULT '0' COMMENT '年营业额-自雇',
  `zenterpfund` int(11) DEFAULT '0' COMMENT '企业资产-自雇',
  `zenterploan` int(11) DEFAULT '0' COMMENT '企业借款-自雇',
  `zmanageplace` varchar(50) DEFAULT NULL COMMENT '经营场所-自雇',
  `zsharesratio` varchar(50) DEFAULT NULL COMMENT '占股比例-自雇',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `bankaccount` varchar(30) DEFAULT NULL COMMENT '用户银行账户',
  `creditlimit` int(11) DEFAULT '0' COMMENT '信用卡最高额度',
  `creditconsume` int(11) DEFAULT '0' COMMENT '信用卡已消费',
  `otherloan` int(11) DEFAULT '0' COMMENT '其他贷款',
  `contname` varchar(50) DEFAULT NULL COMMENT '紧急联系人姓名',
  `contage` int(11) DEFAULT '0' COMMENT '紧急联系人年龄',
  `contsex` varchar(20) DEFAULT NULL COMMENT '紧急联系人性别',
  `contrelation` varchar(20) DEFAULT NULL COMMENT '紧急联系人关系',
  `contloan` varchar(20) DEFAULT NULL COMMENT '经济联系人是否知晓贷款',
  `contmobile` varchar(20) DEFAULT NULL COMMENT '紧急联系人电话',
  `contphone` varchar(20) DEFAULT NULL COMMENT '紧急联系人住宅电话',
  `contaddress` varchar(100) DEFAULT NULL COMMENT '紧急联系人地址',
  `contunitname` varchar(100) DEFAULT NULL COMMENT '紧急联系人单位名称',
  `contunitphone` varchar(20) DEFAULT NULL COMMENT '紧急联系人单位电话',
  `contunitaddress` varchar(100) DEFAULT NULL COMMENT '紧急联系人单位地址',
  `contworkdep` varchar(50) DEFAULT NULL COMMENT '紧急联系人工作部门',
  `contposition` varchar(50) DEFAULT NULL COMMENT '紧急联系人工作职位',
  `adid` int(11) DEFAULT '0',
  `ctime` datetime DEFAULT NULL,
  `aname` varchar(255) DEFAULT NULL,
  `creditNumber` int(11) DEFAULT '0',
  `zenterpborrow` double DEFAULT '0',
  `creditLoanMoney` double DEFAULT '0',
  `relations` varchar(255) DEFAULT NULL,
  `xsid` int(11) DEFAULT '0',
  `xsname` varchar(50) DEFAULT NULL,
  `gunitaddress` varchar(255) DEFAULT NULL,
  `zcompanyaddress` varchar(255) DEFAULT NULL,
  `loantimelimit` int(11) DEFAULT '0',
  `fund` varchar(255) DEFAULT NULL,
  `fundname` varchar(255) DEFAULT NULL,
  `examindate` date DEFAULT NULL COMMENT '报审时间',
  `fkid` int(11) DEFAULT '0',
  `personPath` varchar(255) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `repay` varchar(255) DEFAULT NULL,
  `signstatus` varchar(10) DEFAULT NULL COMMENT '签约状态',
  `signtime` date DEFAULT NULL COMMENT '签约时间',
  `loanstatus` varchar(10) DEFAULT NULL COMMENT '放款状态',
  `loantime` date DEFAULT NULL COMMENT '放款时间',
  `recviway` varchar(50) DEFAULT NULL COMMENT '还款方式1 pos机器 2现金  3转账  4其他',
  `posamount` int(11) DEFAULT '0' COMMENT '放款金额',
  `postime` date DEFAULT NULL COMMENT 'pos刷卡时间',
  `cashamount` int(11) DEFAULT '0' COMMENT '现金金额',
  `cashtime` date DEFAULT NULL COMMENT '现金付款时间',
  `transferamount` int(11) DEFAULT '0' COMMENT '转账金额',
  `transfertime` date DEFAULT NULL COMMENT '转账时间',
  `otheramount` int(11) DEFAULT '0' COMMENT '加他付款方式',
  `othertime` date DEFAULT NULL,
  `urgentlevel` varchar(20) DEFAULT NULL COMMENT '紧急程度',
  `applyloandate` date DEFAULT NULL COMMENT '申请放款时间',
  `accountbranch` varchar(100) DEFAULT NULL COMMENT '开户支行',
  `loanbankaccount` varchar(100) DEFAULT NULL COMMENT '还款银行卡号',
  `houseConsultant` varchar(100) DEFAULT NULL COMMENT '职业顾问',
  `consultantphone` varchar(30) DEFAULT NULL COMMENT '顾问号码',
  `refundamount` int(11) DEFAULT '0' COMMENT '退款金额',
  `refundtime` date DEFAULT NULL COMMENT '退款时间',
  `loanMoney` double DEFAULT '0',
  `creditLevel` varchar(11) DEFAULT NULL COMMENT '信用卡等级',
  `buyhouseaddress` varchar(200) DEFAULT NULL COMMENT '客户新买房新地址',
  `gjrelation` varchar(30) DEFAULT NULL COMMENT '共借人关系',
  `approvalopinion` varchar(5000) DEFAULT NULL COMMENT '审批意见',
  `archstatus` varchar(20) DEFAULT NULL COMMENT '资料归档情况',
  `archtime` date DEFAULT NULL COMMENT '资料归档时间',
  `archremark` varchar(500) DEFAULT NULL COMMENT '资料归档备注',
  `mortgagestatus` varchar(20) DEFAULT NULL COMMENT '按揭情况',
  `mortgageremark` varchar(500) DEFAULT NULL COMMENT '按揭备注',
  `repaystatus` varchar(20) DEFAULT NULL COMMENT '还款情况',
  `overduecount` varchar(50) DEFAULT NULL COMMENT '逾期次数',
  `overfueremark` varchar(500) DEFAULT NULL COMMENT '逾期记录',
  `cheLoanMoney` int(11) DEFAULT '0',
  `houseLoanMoney` int(11) DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

-- 正在导出表  zcurd.customer 的数据：130 rows
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`cid`, `source`, `parentid`, `name`, `idcard`, `mobile`, `cityid`, `cityname`, `pid`, `pname`, `type`, `status`, `mid`, `score`, `tempcontent`, `ordercode`, `price`, `stime`, `etime`, `sex`, `birthday`, `natiomality`, `nation`, `pidtype`, `pidvaildity`, `pidunit`, `higdegree`, `health`, `domloction`, `salaryway`, `familycount`, `buyhouseamount`, `fristpayratio`, `loanproduct`, `applyamount`, `homestatus`, `marriagestatus`, `familyaddress`, `job`, `gunitname`, `gunitnature`, `gjoblevel`, `gmonincome`, `gworklife`, `gsalaryway`, `zcompanyname`, `zindustrytype`, `zmonincome`, `zyearbus`, `zenterpfund`, `zenterploan`, `zmanageplace`, `zsharesratio`, `age`, `bankaccount`, `creditlimit`, `creditconsume`, `otherloan`, `contname`, `contage`, `contsex`, `contrelation`, `contloan`, `contmobile`, `contphone`, `contaddress`, `contunitname`, `contunitphone`, `contunitaddress`, `contworkdep`, `contposition`, `adid`, `ctime`, `aname`, `creditNumber`, `zenterpborrow`, `creditLoanMoney`, `relations`, `xsid`, `xsname`, `gunitaddress`, `zcompanyaddress`, `loantimelimit`, `fund`, `fundname`, `examindate`, `fkid`, `personPath`, `period`, `repay`, `signstatus`, `signtime`, `loanstatus`, `loantime`, `recviway`, `posamount`, `postime`, `cashamount`, `cashtime`, `transferamount`, `transfertime`, `otheramount`, `othertime`, `urgentlevel`, `applyloandate`, `accountbranch`, `loanbankaccount`, `houseConsultant`, `consultantphone`, `refundamount`, `refundtime`, `loanMoney`, `creditLevel`, `buyhouseaddress`, `gjrelation`, `approvalopinion`, `archstatus`, `archtime`, `archremark`, `mortgagestatus`, `mortgageremark`, `repaystatus`, `overduecount`, `overfueremark`, `cheLoanMoney`, `houseLoanMoney`) VALUES
	(1, 0, 0, '王健林', '234324343243242', '13875531216', 14, '长沙', 51261, '东宸林海', 0, 9, 0, 0, NULL, NULL, 0, '2015-12-31', '2015-12-10', '男', '1919-02-02', '', '', '身份证', '2015-12-23', '', '', '良好', '', '', 0, 2000000, 33, NULL, 150000, '', '', '', '', '', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '1', 0, NULL, '1', NULL, '13509223384', '', '世界的历史', '', '', '', '', '', 1, '2015-12-08 13:55:28', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 3, '9', '团贷', NULL, 13, NULL, 0, '按月付息，按季还本', '', '2015-12-01', '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, '哥哥', NULL, '未完成', '2015-12-10', '刚恢复人体哥廷根', '一次性付款无按揭', '隔热隔热好任何人', '是', '逾期3次', '哥哥突然而供热费个', 0, 0),
	(2, 0, 1, '测试', '330726196507040016', NULL, 11, '上海', 274084, '浅水湾1600恺悦大厦', 0, 0, 0, 0, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 20, 20, NULL, 0, '首次', '已婚有子女', '东方闪电', '工薪', '吉屋', '外资企业', '中级/科级', 20, '2', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '1', 1, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2015-12-23 15:23:19', '测试', 1, 0, 0, '兄弟', 45, '张六', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, '现金', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, '哥哥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(4, 0, 1, '成龙', '450521198911111', '12334565884', 23, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-01', '中国', '汉族', '身份证', '2015-12-04', '111', '学士', '良好', '合浦', '不知道', 8, 1000000, 63, '首付贷', 10000, '首次', '已婚', '广东深圳福田', '工薪', '吉屋网络', '民营', '', 888, '5', '工资卡', '', '', 0, 0, 0, 0, '', '', 0, '123547849854674', 10000000, 50000, 5000, '孙大华', 77, '男', '朋友', '是', '13222221111', '45674984654', '深圳福田', '腾讯', '5454354', '5555', '游戏', '运营', 1, '2015-12-23 15:23:19', NULL, 0, 0, 0, '兄弟', 2, NULL, '深圳', '', 12, NULL, NULL, NULL, 0, NULL, 0, '', NULL, '2015-12-01', NULL, '2015-12-01', '现金', 0, '2015-12-02', 0, '2015-11-30', 0, '2015-12-01', 0, '2015-12-08', '', '2015-12-09', '', '', NULL, '', 0, NULL, 0, '2', NULL, '哥哥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(5, 0, 0, 'hchm', '450521198911100', '12334565883', 23, '重庆', 273651, '圣名世贸城', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-26', '中国', '汉族', '身份证', '2015-12-24', '合浦', '', '良好', '合浦', NULL, 12, 1000000, 44, NULL, 55, '第二次', '已婚无子女', '', '工薪', '吉屋网络', '', '', 500, '3', '转账', '', '', 0, 0, 0, 0, '', '', 0, '5545324234324', 10000000, 50000, 5000, '孙大华', 77, '男', '朋友', '是', '10233564848', '45674984654', '深圳福田', '腾讯', '4254278542', '深圳南山', '游戏', '开发', 0, '2015-12-17 15:42:15', NULL, 0, 0, 0, NULL, 2, NULL, '深圳', '', 18, NULL, NULL, NULL, 117, NULL, 0, '', '', '2015-12-01', '', '2015-12-09', 'POS机器,现金,转账', 44, '2015-12-08', 444, '2015-12-08', 44, '2015-12-01', 55, '2015-12-16', '加急', '2015-12-09', '', '12345678932145', '', '13225566545', 0, '2015-11-30', 0, '2', NULL, NULL, NULL, '', '2015-12-01', '', '按揭是否完成', '', '', '', '', 0, 0),
	(7, 0, 0, '罗源', '430523199010258615', '12334565884', 11, '上海', 274084, '浅水湾1600恺悦大厦', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-08', '', '', '身份证', '2015-12-07', '', '', '良好', '', '', 5, 20, 20, NULL, 0, '首次', '', 's电风扇电风扇', '工薪', 'sd', '', '', 211, '3', '现金', '', '', 0, 0, 0, 0, '', '', 0, '1', 1, 0, 1, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:36', NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, '', '', '2015-12-01', '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '加急', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(8, 0, 0, '陶君华', '430421197710177894', '', 14, '长沙', 266289, '柏强创业园', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-25', '', '', '身份证', '2015-12-18', '', '学士', '良好', '', '', 20, 1, 21, NULL, 0, '首次', '', 'sdfds', '工薪', 'dfs', '', '', 20, '3', '现金', '', '', 0, 0, 0, 0, '', '', 0, '46594654564564', 21545, 0, 121, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:43', NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 3, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(9, 0, 0, '王志超', '2345343243434', '', 14, '长沙', 51261, '东宸林海', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-15', '', '', '身份证', '2015-12-24', '', '学士', '健康', '', '', 0, 23333333, 55, NULL, 33333, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:45', NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, '现金', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(11, 0, 0, '李自成', '23423432432432', '', 52, '常州', 225851, '政新花园', 0, 7, 0, 0, NULL, NULL, 0, NULL, NULL, '女', '2015-12-17', '', '', '身份证', '2015-12-17', '', '学士', '良好', '', '', 0, 333333, 55, NULL, 44444, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 11:57:45', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, '', '2015-12-01', '', NULL, NULL, 777, NULL, 77, NULL, 55, NULL, 77, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(15, 0, 0, '闻飞白', '341701198308135834', '', 23, '重庆', 184205, '标美1268', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '学士', '良好', '', '', 12, 12, 1, NULL, 0, '首次', '', '21', '工薪', 'dfs', '', '', 20, '2', '转账', '', '', 0, 0, 0, 0, '', '', 0, '46594654564564', 21545, 0, 121, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:47', NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, '现金', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(24, 0, 0, '罗源', '430523199010258615', '', 14, '长沙', 275350, '湖湘天街', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-01', '', '', '身份证', '2015-12-01', '', '学士', '良好', '', '', 5, 30, 30, NULL, 0, '首次', '', '士大夫士大夫', '工薪', '吉屋', '', '', 20000, '5', '现金', '', '', 0, 0, 0, 0, '', '', 0, '123456', 20000, 0, 200, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 09:50:42', NULL, 2, 0, 0, NULL, 46, NULL, '', '', 18, NULL, NULL, NULL, 13, NULL, 0, NULL, '', '2015-12-01', '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(14, 0, 0, '闻飞白', '341701198308135834', '', 50, '福州', 221204, '五洲大厦写字楼', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-11-30', '', '', '身份证', '2015-12-07', '', '学士', '良好', '', '', 12, 2, 1, NULL, 0, '首次', '', '21', '工薪', 'dfs', '', '', 20, '2', '转账', '', '', 0, 0, 0, 0, '', '', 0, '46594654564564', 21545, 0, 121, '孙大华', 44, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, NULL, '', '2015-12-01', '', NULL, '现金', 0, NULL, 77, '2015-12-15', 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(19, 0, 14, '李嘉诚', '450521198911100', '12134564845', 50, '福州', 221204, '五洲大厦写字楼', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '工薪', '吉屋网络', '民营', '', 500, '3', '工资卡', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, '兄弟', 2, NULL, '深圳', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, '现金', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, '哥哥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(21, 0, 19, '李自成', '450521198911100', '12134564845', 50, '福州', 221204, '五洲大厦写字楼', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '工薪', '吉屋网络', '民营', '', 500, '3', '工资卡', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, '兄弟', 2, NULL, '深圳', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, '现金', 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, '哥哥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(46, 0, 0, '李敏', '450521198911105', '', 5, '重庆', 273651, '圣名世贸城', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '1919-02-02', '', '', '身份证', '2015-12-18', '', '', '良好', '', NULL, 0, 0, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, NULL, NULL, 0, 0, 0, NULL, 2, NULL, '', '', 12, '6', '', NULL, 13, NULL, 0, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '未完成', '2015-12-14', '的水果法大使馆', '一次性付款无按揭', '跟对方是个好人的是', '是', '逾期5次', '个梵蒂冈和热点发货人若风人', 0, 0),
	(23, 0, 0, '邵川', '530322198103200115', '13769876645', 32, '昆明', 57334, '别样幸福城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '1981-03-20', '中国', '汉族', '身份证', '2015-12-24', '陆良县公安局', '学士', '良好', '云南省曲靖市陆良县', '现金', 3, 170, 30, '首付贷', 25, '多次', '离异', '云南省陆良县中枢文坛街5号', '自雇', '云南翰翔商贸有限公司', '', '', 0, '0', '', '云南翰翔商贸有限公司', '贸易', 50000, 60, 0, 0, '云南昆明市官渡区世纪城E栋2-33', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 36, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(27, 0, 0, '李国斌', '4301811111255555', '', 14, '长沙', 214666, '长沙银泰中心项目', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-24', '', '', '身份证', '2015-12-18', '', '', '良好', '', '', 5, 5666666, 40, '首付贷', 50000, '第二次', '单身(离婚)', '广东深圳福田', '工薪', '吉屋网络', '民营企业', '员工/干部', 100, '1', '转账', '', '', 0, 0, 0, 0, '', '', 0, '123547849854674', 10000000, 50000, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 13:55:51', NULL, 0, 0, 0, NULL, 2, '小明', '深圳', '', 6, '128', '', '2015-12-10', 13, NULL, 0, '', '已签约', '2015-12-01', '已放款', '2015-11-30', NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(28, 0, 0, '王大雷', '32432434324324', '', 14, '长沙', 277286, '厚朴国际商业广场', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-08', '', '', '身份证', '2015-12-08', '', '', '良好', '', '', 0, 0, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, NULL, NULL, 0, 0, 0, NULL, 2, NULL, '', '', 6, NULL, NULL, NULL, 62, NULL, 0, NULL, '', '2015-12-01', '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(29, 0, 0, '郜兴运', '310107197908318858', '', 14, '长沙', 261437, '旷远洋湖18克拉', 0, 0, 0, 0, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5000000, 21, NULL, 0, '首次', '已婚有子女', '多少分但是', '工薪', 'dsfds', '外资企业', '中级/科级', 200000, '15', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '13215645646', 1213, 0, 2132, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2015-12-26 14:33:34', '郜兴运', 121, 0, 1212, '兄弟', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(30, 0, 0, '罗源', '430523199010258615', '', 22, '成都', 11036, '绿地国际花都', 0, 1, 0, 0, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 23, 25, NULL, 0, '第二次', '已婚有子女', '打发士大夫', '工薪', '房利通', '机关事业单位', '法人或股东', 3000, '3', '现金', '房利通', '', 2000, 3000, 4000, 0, '自有全款自建房/厂房', '50', 0, '6226604032384511', 1000, 0, 1000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-26 17:03:48', '罗源', 5, 0, 2000, '兄弟', 2, NULL, '打发士大夫', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, 3000),
	(31, 0, 0, '潘先生', '511702197105183653', '', 14, '长沙', 193652, '国建 • 天馥', 0, 1, 0, 556, NULL, NULL, 36, NULL, NULL, '男', '2015-12-07', '', '', '身份证', '2015-12-07', '', '学士', '良好', '', '', 4, 4444, 30, NULL, 0, '首次', '已婚无子女', '打发士大夫', '工薪', '吉屋', '机关事业单位', '法人或股东', 20000, '5', '现金', '房利通', '', 2000, 3000, 4000, 0, '自有全款自建房/厂房', '50', 0, '6226365874589658', 2, 0, 2, '紧急联系人', 0, NULL, '朋友', NULL, '18665889336', '', '师德师风', '', '', '', '', '', 1, '2015-12-28 19:57:46', NULL, 2, 0, 0, NULL, 2, NULL, '打发士大夫fdsfds', '房利通公司地址', 3, NULL, NULL, NULL, 13, NULL, 18, '按月付息,到期还本', '未签约', '2015-12-01', '待放款', '2015-12-01', 'POS机器,现金,转账', 777, '2015-12-02', 33, '2015-12-01', 77, '2015-12-08', 0, '2015-11-30', '', '2015-12-08', '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '未完成', '2015-12-01', '发货发货方电话如风还是我', '按揭通过', '55656675', '否', '逾期3次', '565465643454', 0, 200),
	(32, 0, 31, '共借人1', '511702197701193532', '18665889336', 14, '长沙', 193652, '国建 • 天馥', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '工薪', '房利通', '上市企业', '高级/处级以上', 20000, '5', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, '兄弟', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(33, 0, 31, '公借人2', '522635198908262178', '18665889336', 14, '长沙', 193652, '国建 • 天馥', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '自雇', NULL, NULL, NULL, 0, '0', NULL, '房利通', '', 3000000, 3000000, 3000000, 0, '自有全款自建房/厂房', '30', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 13:55:51', NULL, 0, 0, 0, '兄弟', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(44, 0, 0, '殷', '441900198709204579', '', 100, '东莞', 71192, '松山会馆', 0, 0, 0, 0, NULL, NULL, 30, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '学士', '良好', '', '', 5, 150, 50, NULL, 0, '首次', '', '深圳', '工薪', '吉屋', '', '', 200, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '1', 1, 0, 1, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 8, '2015-12-29 13:55:51', NULL, 5, 0, 0, NULL, 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(39, 0, 0, '严文涛', '429006198010153977', '', 10, '北京', 261434, '长安王府', 0, 1, 0, 0, NULL, NULL, 100, NULL, NULL, '女', '2015-12-01', '22', '', '身份证', '2015-12-01', '', '学士', '良好', '', '', 3, 300, 3, NULL, 0, '多次', '', '深圳市南山区软件产业基地', '工薪', '深圳市吉屋网络技术有限公司', '', '', 30000, '9', '转账', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291616', 50000, 0, 5000, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 6, '2015-12-28 16:23:16', NULL, 3, 0, 0, NULL, 43, NULL, '', '', 12, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(42, 0, 0, '严文涛', '429006198010153977', '12134564845', 50, '福州', 264224, '万科金域滨江', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-15', '', '', '身份证', '2015-12-15', '', '大专', '良好', '', '', 3, 300, 3, NULL, 0, '首次', '', '广东省深圳市', '工薪', '吉屋', '', '', 30000, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291616', 50000, 0, 5000, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 6, '2015-12-29 15:59:33', NULL, 3, 0, 0, NULL, 2, NULL, '', '', 6, '6', '', NULL, 0, NULL, 0, '', '', '2015-12-01', '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(43, 0, 0, '严文涛', '429006198309010065', '', 14, '长沙', 272395, '湘江玖号', 0, 0, 0, 0, NULL, NULL, 30, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '学士', '良好', '', '', 5, 100, 30, NULL, 60, '首次', '已婚有子女', '深圳', '工薪', '吉屋', '普通企业', '员工/干部', 20000, '10', '转账', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291616', 50000, 0, 5000, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 6, '2015-12-29 13:55:51', NULL, 3, 0, 0, NULL, 2, NULL, '深圳', '', 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, 5000),
	(67, 0, 43, '李自成', '450521198911105', '', 14, '长沙', 272395, '湘江玖号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 13:55:51', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(45, 0, 0, '刘应祥', '430321198410319511', '', 100, '东莞', 30455, '万科棠樾', 0, 1, 0, 0, NULL, NULL, 10, NULL, NULL, '男', '2015-11-30', '', '', '身份证', '2015-12-22', '', '学士', '良好', '', '', 2, 100, 3, NULL, 0, '首次', '', '湖南湘潭   说的都是速度速度', '工薪', '吉屋科技', '', '', 15000, '3', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291079', 34000, 0, 1, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 7, '2015-12-29 13:55:51', NULL, 2, 0, 0, NULL, 2, NULL, '', '', 12, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(50, 0, 45, '李自成', '450521198911105', '', 100, '东莞', 30455, '万科棠樾', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 14:55:07', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(54, 0, 0, '李小龙', '450521198911100', '12334565884', 22, '成都', 10077, '中粮祥云国际生活区', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-15', '中国', '孨族', '身份证', '2015-12-01', '', '学士', '健康', '', '', 0, 0, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 13:55:51', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(55, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 13:55:51', NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(56, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:24:39', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(57, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 5, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:25:25', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(97, 0, 24, '李自成', '450521198911105', '12334565884', 14, '长沙', 275350, '湖湘天街', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 10000000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 13:55:51', NULL, 4, 0, 0, '朋友', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(98, 0, 97, '李自成', '450521198911105', '12334565884', 14, '长沙', 275350, '湖湘天街', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 10000000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 4, 0, 0, '朋友', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(60, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:27:39', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(61, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:29:00', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(62, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:30:33', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(63, 0, 59, '规划开发', '450521198911104417', '', 0, '', 0, '', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 13:55:51', NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(64, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 55, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:42:46', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(65, 0, 54, 'hchm', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 76, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:44:29', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, '2015-12-25', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(66, 0, 54, '李自成', '450521198911105', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 34, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 15:45:03', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(68, 0, 43, '李自成', '450521198911105', '', 14, '长沙', 272395, '湘江玖号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 78, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 16:00:16', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(70, 0, 43, '李自成', '450521198911105', '', 14, '长沙', 272395, '湘江玖号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 87, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 16:03:22', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(71, 0, 43, '李自成', '450521198911105', '', 14, '长沙', 272395, '湘江玖号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 87, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-28 16:03:53', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2015-12-01', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(81, 0, 0, '大叔', '430181198704279370', '', 14, '长沙', 1935, '盈峰翠邸', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-01', '', '', '身份证', '2015-12-01', '', '学士', '良好', '', '', 0, 222, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 09:49:14', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 12, NULL, NULL, NULL, 13, NULL, 0, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '完成', '2015-12-15', '如图4跳4同4讨厌4月海棠花4月', '按揭通过', '43一体化(ノω<。)ノ))☆.。月4讨厌', '是', '逾期2次', '她4跳4陶然亭4 ', 0, 0),
	(83, 0, 0, '罗源', '430523199010258615', '', 50, '福州', 264281, '先生的山', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '1919-02-02', '', '', '身份证', '2015-12-18', '', '学士', '良好', '', '', 5, 40, 25, NULL, 0, '第二次', '', '电话费', '工薪', '房利通', '', '', 3000, '9', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291185', 30000, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 13, '2015-12-29 11:30:52', NULL, 3, 0, 0, NULL, 2, NULL, '', '', 3, NULL, NULL, NULL, 13, NULL, 0, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(88, 0, 0, '刘应祥', '430321198410319511', '', 14, '长沙', 3343, '江河双水湾', 0, 1, 0, 0, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 60, 30, NULL, 0, '首次', '已婚有子女', '深圳南山', '工薪', '吉屋科技', '普通企业', '中层管理', 10000, '8', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6226660403291079', 34000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, '2015-12-28 19:31:43', '刘应祥', 2, 0, 1700, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, '等额本息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(89, 0, 0, '洪七公', '440825199204210012', '', 50, '福州', 75373, '东二环泰禾广场', 0, 0, 0, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 30, 30, NULL, 0, '首次', '未婚', '深圳市福田区华强北', '工薪', '房利通', '普通企业', '员工/干部', 3000, '15', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6846131351531883', 50000, 0, 0, '钟汉良', 0, NULL, '弟弟', NULL, '13587854661', NULL, '深圳市南山区', NULL, NULL, NULL, NULL, NULL, 4, '2015-12-28 19:36:13', '李先生', 3, 0, 1000, NULL, 2, NULL, '深圳市南山区', NULL, 0, NULL, NULL, NULL, 0, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(90, 0, 0, '陶君华', '430421197710177894', '', 14, '长沙', 1933, '金科东方大院', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '女', '2015-11-30', '', '', '身份证', '2015-12-01', '', '学士', '良好', '', '', 5, 56, 25, NULL, 0, '首次', '', 'k d k d k', '工薪', '也很好', '', '', 58, '0', '现金', '', '', 0, 0, 0, 0, '', '', 0, '1234567887654321', 5, 0, 65, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 3, '2015-12-28 19:53:21', NULL, 5, 0, 0, NULL, 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(112, 0, 112, '李自成ffgg', '450521198911105', '', 23, '重庆', 273651, '圣名世贸城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(91, 0, 0, '陈晓前', '130124198208167259', '', 50, '福州', 75373, '东二环泰禾广场', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-07', '', '', '身份证', '2015-11-30', '', '学士', '良好', '', '', 3, 50, 30, NULL, 0, '首次', '未婚', '深圳市宝安区', '自雇', '', '', '', 0, '0', '', '小李科技', '', 0, 300, 300, 0, '自有全款商铺/厂房', '100', 0, '62507566875666669875', 300000, 0, 0, '周杰伦', 0, NULL, '哥哥', NULL, '15676545689', '', '深圳市福田区车公庙', '', '', '', '', '', 4, '2015-12-28 20:05:19', NULL, 2, 0, 0, NULL, 2, NULL, '', '深圳市福田区', 6, NULL, NULL, NULL, 0, NULL, 24, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(99, 0, 0, '陈年', '440825199204210012', '', 14, '长沙', 277692, '万科金域蓝湾二期', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '1919-02-02', '', '', '身份证', '2015-12-18', '', '学士', '良好', '', '', 3, 80, 30, NULL, 0, '首次', '未婚', '深圳市福田区', '工薪', '房利通', '', '', 3000, '15', '转账', '', '', 0, 0, 0, 0, '', '', 0, '668884848546855646464', 20000, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 14, NULL, NULL, 3, 0, 0, NULL, 2, NULL, '', '', 3, NULL, NULL, NULL, 0, NULL, 12, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(100, 0, 0, '欧阳老师', '440825199204210012', '', 50, '福州', 276894, '香开观海', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-15', '', '孨族', '身份证', '2015-11-30', '', '', '良好', '', '', 5, 80, 25, NULL, 0, '首次', '已婚有子女', '深圳市福田区华强北', '工薪', '房利通', '机关事业单位', '法人或股东', 2000, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '6288844260085999586', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 4, '2015-12-29 13:55:51', NULL, 5, 0, 0, NULL, 2, NULL, '是深圳市福田区华强北', '', 3, '6', '', NULL, 0, NULL, 1, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(101, 0, 0, '宋健', '430523199010258615', '', 14, '长沙', 277976, '青苹果数据城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-26', '', '', '身份证', '2015-12-15', '', '学士', '良好', '', '', 0, 500000, 0, NULL, 200000, '', '', '', '', '', '', '', 0, '0', '', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 13:55:51', NULL, 0, 0, 0, NULL, 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(135, 0, 0, '不时', '450521198911105', NULL, 23, '重庆', 277832, '远洋原香', 0, 8, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-30 09:41:21', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(104, 0, 103, '小明', '420983199201125245', '', 0, '', 0, '', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 14:02:24', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(116, 0, 28, '王小雷', '4209831545', '', 14, '长沙', 277286, '厚朴国际商业广场', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(106, 0, 103, '小明', '420983199201125245', '', 0, '', 0, '', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 14:57:35', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(107, 0, 0, '罗源', '430523199010258615', '', 22, '成都', 281635, '恒大广场写字楼', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '', '良好', '', '', 25, 31, 26, NULL, 0, '首次', '', 'sdfds', '工薪', '吉屋', '机关事业单位', '法人或股东', 30, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291251', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 1, NULL, NULL, 0, 0, 0, NULL, 2, NULL, 'sdfsdfsdf', '', 0, NULL, NULL, NULL, 0, NULL, 18, NULL, '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(134, 0, 0, '罗源', '430523199010258615', NULL, 14, '长沙', 278403, '星光名座', 0, 0, 0, 0, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 30, 26, NULL, 0, '首次', '已婚有子女', 'sdfsd', '工薪', '吉屋', '国营单位', '高级/处级以上', 2000, '3', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6226604035836521', 2, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 23:13:50', NULL, 1, 0, 0, NULL, 2, '', 'hhhhhhhhhhhhhh', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(133, 0, 27, '大水牛', '450521198911144', '14278542782578', 27, '长沙', 214666, '长沙银泰中心项目', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 22:15:41', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(110, 0, 98, '李自成', '450521198911105', '12334565884', 14, '长沙', 275350, '湖湘天街', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 10000000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 15:26:06', 'admin', 4, 0, 0, '朋友', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(111, 0, 98, '李自成', '450521198911105', '12334565884', 14, '长沙', 275350, '湖湘天街', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 10000000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 15:29:53', 'admin', 4, 0, 0, '朋友', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(113, 0, 113, '李小龙', '450521198911105', '', 0, '', 0, '', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(114, 0, 12, '罗源2', '234534324343411', '', 0, '', 0, '', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '兄弟', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(115, 0, 0, '王志jj', '440825199204210012', '', 22, '成都', 10077, '中粮祥云国际生活区', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-01', '', '', '身份证', '2015-12-14', '', '', '良好', '', NULL, 0, 0, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-29 16:08:23', 'admin', 0, 0, 0, NULL, 117, NULL, '', '', 6, NULL, NULL, NULL, 1, NULL, 0, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(117, 0, 117, '李自成明', '450521198911105', '115454', 23, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '朋友', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(118, 0, 118, '马云云', '450521198911105', '', 23, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(119, 0, 0, '陈先生', '440825199204210012', NULL, 57, '厦门', 262942, '国际艺术品金融中心', 0, 0, 0, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 80, 30, NULL, 0, '第二次', '已婚有子女', '深圳市福田区车公庙', '工薪', '房利通', '机关事业单位', '员工/干部', 3000, '5', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '622805656686265998', 30000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 16:48:27', NULL, 3, 0, 0, NULL, 60, '', '深圳市福田区', NULL, 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(120, 0, 120, '马云云与', '450521198911105', '', 23, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(121, 0, 5, '大云云方uu44', '450521198911105', '13509333389', 23, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', '吉屋网络', '民营', '', 44, '55', '5', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 5, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 0, 0, '朋友', 2, NULL, '55', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(122, 0, 0, '陈楚楚', '440825199204210012', NULL, 203, '漳州', 281619, '阳光城凡尔赛宫', 0, 0, 0, 0, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 80, 30, NULL, 0, '第二次', '已婚有子女', '深圳市宝安区', '工薪', '房利通', '机关事业单位', '法人或股东', 2000, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '622205566565866865655', 30000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 17:18:48', NULL, 3, 0, 0, NULL, 2, '', '深圳市福田区车公庙', NULL, 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(123, 0, 0, '黎明', '450521198911105', '', 5, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 17:24:27', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(124, 0, 0, '李文超', '440825199204210012', '', 22, '成都', 281459, '龙湖时代天街(综合体)', 0, 1, 0, 459, NULL, NULL, 0, NULL, NULL, '男', '2015-12-08', '中国', '汉族', '身份证', '2015-12-01', '', '', '良好', '', NULL, 6, 80, 30, '首付贷', 0, '首次', '已婚有子女', '深圳市宝安区西乡', '自雇', '', '', '', 0, '0', '转账', '篮球科技有限责任公司', '', 0, 600, 1000, 0, '自有全款商铺/厂房', '50', 0, '65580265668656566869', 30000, 0, 0, '李大福', 0, NULL, '哥哥3 ', NULL, '18569856696', '', '深圳市宝安区', '', '', '', '', '', 1, '2015-12-29 17:35:22', NULL, 6, 0, 0, NULL, 2, '几号机', '', '深圳市龙岗区', 3, NULL, NULL, NULL, 0, NULL, 3, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(125, 0, 5, 'balabala', '450521198911144', '13875531216', 5, '重庆', 273651, '圣名世贸城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '夫妻', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(126, 0, 5, 'ggg', '450521198911111', '12134564845', 5, '重庆', 273651, '圣名世贸城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '0', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, 0, '不知道', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(127, 0, 0, '严文涛11', '429006198010153977', '12334565884', 22, '成都', 270305, '万科城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-11-30', '美国', '孨族', '身份证', '2015-12-08', '', '', '良好', '', NULL, 3, 200, 65, NULL, 0, '首次', '已婚有子女', '深圳市南山区', '自雇', '', '', '', 0, '0', '转账', '吉屋', '', 0, 30000, 50000, 0, '租用', '10', 0, '6226660403291616', 50000, 0, 10000, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, '2015-12-29 18:52:01', NULL, 3, 0, 0, NULL, 60, '信审专员', '', '深圳南山', 6, NULL, NULL, NULL, 0, NULL, 6, '', '', NULL, '', '2015-12-23', '现金', 100, '2015-12-23', 500, '2015-12-23', 20, NULL, 20, NULL, '一般', NULL, '213', '12345678932145', 'test', '13225566545', 0, NULL, 0, '2', 'gfdsfsfds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2100, 4700),
	(129, 0, 27, '孙悟空猪八戒', '450521198911104417', '12334565884', 27, '长沙', 214666, '长沙银泰中心项目', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', '吉屋网络', '', '', 66, '66', '工资卡', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 10000000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-29 20:16:06', 'admin', 0, 0, 0, '朋友', 2, NULL, '是深圳市福田区华强北', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(130, 0, 0, '刘应祥', '430321198410319511', '', 22, '成都', 270305, '万科城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '', '良好', '', NULL, 10, 100, 30, NULL, 0, '首次', '已婚有子女', '大家觉得简单', '工薪', '万科', '世界500强企业', '员工/干部', 136666, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '6226660403291079', 34000, 0, 9, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 7, '2015-12-29 20:53:36', '刘应祥', 2, 0, 0, NULL, 2, NULL, '等你多久时间', '', 0, NULL, NULL, NULL, 0, NULL, 3, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1900),
	(136, 0, 0, '奥巴马', '450521198911100', NULL, 22, '成都', 281459, '龙湖时代天街(综合体)', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-30 09:44:26', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(132, 0, 0, '袁岳', '440825199204210012', NULL, 57, '厦门', 277753, '阳光城凡尔赛宫', 0, 0, 0, 0, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 80, 30, NULL, 0, '第二次', '已婚有子女', '深圳市宝安区西乡', '自雇', NULL, NULL, NULL, 0, '0', NULL, '湖吃海喝', '', 0, 800, 1000, 0, '自有全款商铺/厂房', '80', 0, '658265686595698989595', 3000, 0, 5, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-29 22:12:08', NULL, 3, 100, 0, NULL, 2, '', NULL, '深圳市福田区', 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 2),
	(137, 0, 0, '老奥', '450521198911100', NULL, 23, '重庆', 281499, '龙水湖国际旅游度假区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-30 09:45:35', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(138, 0, 0, '黄河', '440825199204210012', NULL, 50, '福州', 223143, '彩虹铺景', 0, 0, 0, 0, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 80, 30, NULL, 0, '第二次', '已婚有子女', '深圳市宝安区', '自雇', NULL, NULL, NULL, 0, NULL, NULL, '锤子科技', '', 0, 3000, 9000, 0, '自有全款商铺/厂房', '66', 0, '6682866988825866', 3000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-30 11:53:53', NULL, 3, 2000, 0, NULL, 2, '', NULL, '深圳市福田区', 0, NULL, NULL, NULL, 0, NULL, 6, '等额本息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(139, 0, 0, '习大大', '450521198911105', '12334565884', 23, '重庆', 281499, '龙水湖国际旅游度假区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-08', '', '', '身份证', '2015-12-02', '', '', '良好', '', NULL, 0, 0, 0, NULL, 0, '', '', '', '', '', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2015-12-30 14:08:26', 'admin', 0, 0, 0, NULL, 2, NULL, '', '', 6, NULL, NULL, NULL, 0, NULL, 0, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(140, 0, 0, '关羽', '440825199204210012', '18665889336', 41, '泉州', 281553, '泉州恒大翡翠龙庭', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-21', '', '', '身份证', '2015-12-22', '', '', '良好', '', NULL, 6, 60, 25, NULL, 55.36, '首次', '已婚有子女', '深圳市福田区车公庙', '工薪', '饿了么', '国营单位', '法人或股东', 30000, '3', '现金', '1', '', 0, 1, 1, 0, '自有全款商铺/厂房', '1', 0, '6226686565655995', 3000, 0, 52, '刘备', 0, NULL, '姐姐', NULL, '18568523556', '', '深圳市宝安区深圳市龙岗区', '', '', '', '', '', 4, '2015-12-31 01:36:37', '关羽', 3, 0, 0, NULL, 2, 'admin', '深圳市宝安区', 'sjdlfjsdl', 1, NULL, NULL, NULL, 62, NULL, 24, '', '', NULL, '', '2015-12-30', 'POS机', 5000, '2015-12-30', 300, '2018-10-16', 300, NULL, 300, NULL, '加急', NULL, 'jn1111', '622529652692652', 'jmkl', '18582626262', 0, NULL, 0, NULL, '深圳市', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 32),
	(141, 0, 0, '张飞', '440825199204210012', '', 22, '成都', 278777, '福地广场金钻', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 80, 30, NULL, 3, '首次', '已婚有子女', '深圳市福田区', '工薪', '大众点评', '上市企业', '法人或股东', 2000, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '62668686865956565', 5000, 0, 0, '宋江', 0, NULL, '小弟', NULL, '13508689659', NULL, '深圳市宝安区', NULL, NULL, NULL, NULL, NULL, 4, '2015-12-30 16:23:19', '张飞', 3, 0, 0, NULL, 65, NULL, '深圳市龙岗区', NULL, 0, NULL, NULL, NULL, 1, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(142, 0, 0, 'test', '341502197809192694', '', 41, '泉州', 82305, '港通公园1号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 21, 50, NULL, 1, '首次', '未婚', '2112', '工薪', '21', '机关事业单位', '法人或股东', 21, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6321632163216321', 21, 0, 21, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2015-12-30 16:37:52', 'test', 21, 0, 0, NULL, 2, NULL, '321321', NULL, 0, NULL, NULL, NULL, 0, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
	(143, 0, 140, '我才', '37020319841228061X', '13256325363', 57, '厦门', 275998, '水岸新城第壹街', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', 'td', '外资企业', '法人或股东', 2, '1年以内', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '关羽', 0, 0, 0, 'ts', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(144, 0, 0, '胡子', '411625197706175670', '', 14, '长沙', 275905, '圆泰国际广场项目', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 50, 50, NULL, 50, '第二次', '已婚有子女', '晕晕乎乎', '工薪', '还有', '世界500强企业', '高级/处级以上', 5000, '5', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6398963595633214', 255, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2015-12-30 17:41:28', '胡子', 2, 0, 0, NULL, 2, NULL, '哈哈哈哈', NULL, 0, NULL, NULL, NULL, 0, NULL, 6, '等额本息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(145, 0, 0, 'test', '230828197610050772', '', 41, '泉州', 82305, '港通公园1号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-02', '', '', '身份证', '2015-12-05', '', '', '良好', '', NULL, 1, 1, 50, NULL, 20, '首次', '未婚', 'sdfds', '工薪', '加快速度龙卷风', '机关事业单位', '法人或股东', 123, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6362632663266326', 21, 0, 21, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 1, '2015-12-30 17:59:03', 'test', 1, 0, 0, NULL, 2, NULL, 'test', '', 6, NULL, NULL, NULL, 0, NULL, 1, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 21),
	(146, 0, 0, '张辽', '440825199204210012', '18512345678', 41, '泉州', 278781, '百捷中央名门', 0, 2, 0, 426, NULL, NULL, 0, NULL, NULL, '', NULL, '', '', '身份证', NULL, '', '', '良好', '', NULL, 3, 90, 30, NULL, 5, '首次', '已婚有子女', '深圳市宝安区', '工薪', '魏国', '机关事业单位', '高级/处级以上', 3000, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '665686566565959565695', 2000, 0, 0, '陈皮', 0, NULL, '哥哥', NULL, '13585866565', '', '深圳市', '', '', '', '', '', 22, '2015-12-30 18:05:08', NULL, 3, 0, 0, NULL, 2, 'admin', '深圳市龙岗区', '', 0, '6', '', NULL, 0, NULL, 6, '等额本息', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, 'B', NULL, NULL, 'sfsdfdsfdsfdsfds', '', NULL, '', '按揭是否完成', '', '', '', '', 0, 0),
	(147, 0, 0, '胡换个', '220723198108313819', '', 14, '长沙', 269938, '海德广场', 0, 0, 0, 456, NULL, NULL, 0, NULL, NULL, '女', '2015-12-07', '', '', '身份证', '2015-12-07', '', '', '良好', '', NULL, 5, 58, 50, NULL, 50, '首次', '未婚', '蝴蝶结', '工薪', '放假话费', '世界500强企业', '高级/处级以上', 256, '3', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6986689569856985', 24, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 1, '2015-12-30 18:09:39', '胡换个', 1, 0, 0, NULL, 2, NULL, '好的很方便', '', 12, NULL, NULL, NULL, 0, NULL, 6, '等额本息', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 25.86, 'AA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 34),
	(148, 0, 0, '大塞弗', '360727195905114460', '', 41, '泉州', 82305, '港通公园1号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, 50, NULL, 21, '首次', '已婚有子女', '是非得失', '工薪', '他的说法', '机关事业单位', '法人或股东', 1231, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6053632663266320', 21, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-30 18:14:33', '大塞弗', 1, 0, 0, NULL, 2, NULL, 'sdfs', NULL, 0, NULL, NULL, NULL, 0, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(149, 0, 0, '海鲎', '361121195905114460', '', 22, '成都', 80939, '东原城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 25, 50, NULL, 50, '第二次', '已婚有子女', '减肥姐姐', '工薪', '解放军', '世界500强企业', '高级/处级以上', 648, '3', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6969656536533652', 546, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-30 18:17:43', '海鲎', 1, 0, 0, NULL, 2, NULL, '火凤凰', NULL, 0, NULL, NULL, NULL, 0, NULL, 6, '等额本息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(150, 0, 0, '机电井', '610324198802205073', '', 22, '成都', 278425, '医科总部基地', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 60, 50, NULL, 60, '第二次', '已婚有子女', '机电井', '工薪', '回到家', '机关事业单位', '法人或股东', 54, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6543654365436987', 54676, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-30 18:38:29', '机电井', 1, 0, 0, NULL, 2, NULL, '难道今年的', NULL, 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(151, 0, 0, '曹操', '440825199204210012', '', 50, '福州', 272197, '长乐大名城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-02', '', '', '身份证', '2015-12-08', '', '', '健康', '', NULL, 6, 80, 30, NULL, 3, '第二次', '已婚有子女', '深圳市宝安区', '自雇', '', '', '', 0, '0', '转账', '快播', '', 0, 10000, 2000, 0, '租用', '30', 0, '62886868656556565656', 5000, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 4, '2015-12-30 19:26:00', '曹操', 2, 0, 0, NULL, 2, NULL, '', '深圳市宝安区', 6, NULL, NULL, NULL, 0, NULL, 6, '等额本息', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(152, 0, 0, '灿灿', '441900198709204579', NULL, 14, '长沙', 271595, '天祥水晶湾', 0, 0, 0, 496, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, 30, NULL, 15, '第二次', '未婚', '东莞市西平', '工薪', '房利通', '普通企业', '员工/干部', 22000, '10', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6222002010004852524', 55000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-30 20:09:40', NULL, 4, 0, 0, NULL, 2, '', '深圳市南山区', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(153, 0, 27, '武大郎', '450521198911105', '12334565884', 27, '长沙', 214666, '长沙银泰中心项目', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-30 21:30:45', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(154, 0, 27, '潘金莲', '450521198911105', '12134564845', 27, '长沙', 214666, '长沙银泰中心项目', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-30 21:31:22', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(155, 0, 146, 'fsf', '61032419700619871X', '18565623569', 41, '泉州', 278781, '百捷中央名门', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', 'fas', '外资企业', '高级/处级以上', 233, '1-3年', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, 0, 0, 0, 'bb', 2, 'admin', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(156, 0, 0, '严文涛', '429006198309010065', NULL, 22, '成都', 270305, '万科城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 400, 30, NULL, 100, '首次', '已婚有子女', '广东', '工薪', '吉屋', '国营单位', '中级/科级', 20000, '15', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6226660403291616', 50000, 0, 2000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-30 21:55:07', NULL, 3, 0, 0, NULL, 87, 'admin', '深圳', NULL, 0, NULL, NULL, NULL, 0, NULL, 36, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, 5000),
	(157, 0, 0, '严格', '429006198309010065', NULL, 22, '成都', 278491, '华润万象城', 0, 1, 0, 524, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 200, 30, NULL, 60, '首次', '离婚', '深圳', '工薪', '吉屋', '世界500强企业', '高级/处级以上', 20000, '15', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6226660403291615', 50000, 0, 5000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-12-30 22:08:20', NULL, 3, 0, 0, NULL, 2, 'admin', '深圳', NULL, 0, NULL, NULL, NULL, 0, NULL, 18, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 23.8965, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, 5000),
	(158, 0, 140, 'hi', '610324198802205073', '13535434325', 41, '泉州', 281553, '泉州恒大翡翠龙庭', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '自雇', NULL, NULL, NULL, 0, NULL, NULL, 'hfgn', '', 0, 123, 26, 0, '自有全款商铺/厂房', '20', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '关羽', 0, 52142, 0, 'hkui', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(159, 0, 0, '冯圳', '440301198610025119', '', 12, '深圳', 263528, '奥宸·观壹城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 240, 30, NULL, 36, '首次', '未婚', '深圳福田区新闻路', '工薪', '深圳市房利通金融服务有限公司', '普通企业', '中级/科级', 30000, '10', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6214857801822216', 30000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, '2015-12-30 22:28:04', '冯圳', 3, 0, 0, NULL, 2, NULL, '南山区软件产业基地', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(160, 0, 0, '维拉', '440825199204210012', '', 22, '成都', 281469, '营盛双子座', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 30, 25, NULL, 3, '第二次', '已婚有子女', '深圳市宝安区', '工薪', '肯德基', '机关事业单位', '法人或股东', 3000, '1', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '62268660686868668', 5500, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2015-12-30 22:59:12', '维拉', 3, 0, 0, NULL, 2, NULL, '深圳市福田区', NULL, 0, NULL, NULL, NULL, 0, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(161, 0, 0, '李自成', '450521198911105', NULL, 23, '重庆', 277962, '首成鼎尚名都', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:03:37', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(162, 0, 0, '让人', '450521198911105', NULL, 22, '成都', 281637, '恒大广场', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:40:47', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(163, 0, 0, '李自成', '450521198911105', NULL, 23, '重庆', 278387, '浙商大厦', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:43:06', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(164, 0, 0, '猪猪', '450521198911109', NULL, 23, '重庆', 281499, '龙水湖国际旅游度假区', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:48:04', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(165, 0, 0, '死猪', '450521198911100', '12134564845', 23, '重庆', 281551, '富州新城兰亭', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:49:20', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(166, 0, 0, '死猪', '450521198911106', '12134564845', 23, '重庆', 281551, '富州新城兰亭', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 01:50:33', 'admin', 0, 0, 0, NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(167, 0, 5, 'kkkk', '450521198911100', '', 5, '重庆', 273651, '圣名世贸城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', '', '', 0, '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-12-31 02:04:55', 'admin', 0, 0, 0, '', 2, NULL, '', '', 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(168, 0, 124, '罗源', '430523199010258615', '18665889336', 22, '成都', 281459, '龙湖时代天街(综合体)', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', '房利通', '外资企业', '法人或股东', 200, '1年以内', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, '朋友', 2, '几号机', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(169, 0, 0, 'U盾', '540101196712313000', '', 14, '长沙', 72203, '紫御江山人民里', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 50, 50, NULL, 50, '首次', '已婚有子女', '好喜欢', '工薪', '好的很', '机关事业单位', '高级/处级以上', 3000, '5', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6865685686568655', 5, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-31 15:56:36', 'U盾', 1, 0, 0, NULL, 2, NULL, '办法话费', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(170, 0, 157, '罗小', '440825199204210012', '13586686866', 22, '成都', 278491, '华润万象城', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '工薪', '季候风', '外资企业', '法人或股东', 3000, '1年以内', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0, '婆婆', 2, 'admin', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(171, 0, 0, '王大锤', '513330197603162818', '', 12, '深圳', 272316, '天阶1号', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 20, 50, NULL, 1, '首次', '未婚', '范德萨斯蒂芬', '工薪', '万万没想到', '机关事业单位', '法人或股东', 5, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6326632563256325', 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-12-31 16:34:47', '王大锤', 1, 0, 0, NULL, 2, NULL, '发达省份的萨芬', NULL, 0, NULL, NULL, NULL, 0, NULL, 3, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(172, 0, 0, '成龙', '440825199204210012', '', 22, '成都', 273595, '新津瞰海一品商业街', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 80, 30, NULL, 30, '第二次', '已婚有子女', '深圳市', '工薪', '火狐', '机关事业单位', '法人或股东', 3000, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6366868686866868', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2016-01-04 18:37:07', '成龙', 0, 0, 0, NULL, 2, NULL, '深圳市', NULL, 0, NULL, NULL, NULL, 0, NULL, 6, '等额本息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(173, 0, 0, '廉俊捷', '420701198305075070', '', 22, '成都', 277969, '紫檀2期', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 231, 1, 26, NULL, 1, '首次', '已婚有子女', 'sfd', '工薪', '似懂非懂', '机关事业单位', '法人或股东', 123, '1', '现金', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '60236023653206532', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2016-01-05 11:16:45', '廉俊捷', 0, 0, 0, NULL, 2, NULL, '电风扇', NULL, 0, NULL, NULL, NULL, 0, NULL, 1, '一次性还本付息', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(174, 0, 0, '你了', '361101198206287811', '', 22, '成都', 276738, '乡林涵碧天下', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 3, 26, NULL, 6, '第三次', '已婚有子女', '丽敏', '工薪', '第一次', '世界500强企业', '法人或股东', 36, '3', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6356635663566985', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2016-01-05 11:26:07', '你了', 0, 0, 0, NULL, 2, NULL, '您咯', NULL, 0, NULL, NULL, NULL, 0, NULL, 12, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(175, 0, 0, '海边', '440825199204210012', '', 41, '泉州', 270737, '泉州恒大翡翠华庭', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 20, 30, NULL, 30, '第二次', '未婚', '深圳市', '工薪', '呵呵', '机关事业单位', '高级/处级以上', 3000, '5', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6558966600566685688', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2016-01-05 11:37:31', '海边', 0, 0, 0, NULL, 2, NULL, '深圳市', NULL, 0, NULL, NULL, NULL, 0, NULL, 24, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(176, 0, 0, '测试', '511702197207108849', '15674819635', 14, '长沙', 277692, '万科金域蓝湾二期', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-01', '中国', '汉族', '身份证', '2016-01-04', '合浦', '', '健康', '', NULL, 1, 1, 26, NULL, 12, '首次', '已婚有子女', 'fsfds', '工薪', '都是', '机关事业单位', '法人或股东', 12, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '6326326326532635', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 2, '2016-01-05 12:01:42', 'admin', 0, 0, 0, NULL, 2, NULL, '防晒粉底霜', '', 1, NULL, NULL, NULL, 0, NULL, 6, '按月付息,到期还本', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(177, 0, 0, '机顶盒', '361101198206287811', '12334565884', 28, '青岛', 274012, '商河欣园网点', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-27', '中国', '汉族', '身份证', '2015-12-05', '', '大专', '良好', '', NULL, 54, 8, 26, NULL, 1, '首次', '已婚有子女', '哈哈大家', '工薪', '机电井', '国营单位', '法人或股东', 5464, '1', '现金', '', '', 0, 0, 0, 0, '', '', 0, '65656565656565656565', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 1, '2016-01-05 16:02:42', '机顶盒', 0, 0, 0, NULL, 66, NULL, '还大喊大叫', '', 3, NULL, NULL, NULL, 65, NULL, 1, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(180, 0, 0, '如花mm', '450521198911188', '12334565884', 23, '重庆', 281551, '富州新城兰亭', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-28', '中国', '汉族', '身份证', '2015-12-05', '合浦', '高中或以下', '健康', '合浦', NULL, 2, 1000000, 33, NULL, 44444, '', '', '广东深圳福田', '', '吉屋网络', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '123547849854674', 10000000, 50000, 5000, '孙大华', 33, '男', '朋友', NULL, '10233564848', '45674984654', '深圳福田', '腾讯', '4254278542', '深圳南山', '游戏', '开发', 2, '2016-01-06 16:26:23', 'admin', 0, 0, 0, NULL, 60, NULL, '', '', 6, NULL, NULL, NULL, 62, NULL, 0, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 333, 444),
	(181, 0, 0, '如花mmm', '450521198911189', '12334565884', 23, '重庆', 281551, '富州新城兰亭', 0, 6, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, '2016-01-06 17:38:51', 'xszy', 0, 0, 0, NULL, 65, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(182, 0, 0, '如花dd', '450521198911155', '12134564845', 23, '重庆', 281551, '富州新城兰亭', 0, 8, 0, 0, NULL, NULL, 0, NULL, NULL, '男', '2015-12-29', '', '', '身份证', '2015-12-29', '', '高中或以下', '良好', '', NULL, 0, 0, 0, NULL, 5, '', '', '', '', '', '', '', 0, '0', '转账', '', '', 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', 0, NULL, '', NULL, '', '', '', '', '', '', '', '', 60, '2016-01-06 19:26:59', 'xszy', 0, 0, 0, NULL, 66, NULL, '', '', 3, '33', '', NULL, 1, NULL, 0, '', '', NULL, '', NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '', NULL, '', '', '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(183, 0, 111, 'ruhua', '450521198911100', '13875531216', 23, '重庆', 273361, '招商雍华府', 0, 2, 0, 0, NULL, NULL, 0, NULL, NULL, '女', '2016-01-04', NULL, NULL, '身份证', '2015-12-28', NULL, NULL, '良好', NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, '2016-01-07 00:00:00', 'xszy', 0, 0, 0, NULL, 60, NULL, NULL, NULL, 3, NULL, NULL, NULL, 65, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(185, 1, 0, '季谷之', '622921198103067887', '15107078796', 22, '成都', 273602, '九龙318', 0, 0, 0, 481, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 20, 26, NULL, 25, '首次', '已婚有子女', '房贷首付多少', '工薪', '垫付首付多少', '机关事业单位', '法人或股东', 30, '1', '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, '6363636363636363', 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2016-01-07 17:52:10', '季谷之', 0, 0, 0, NULL, 0, NULL, '房贷首付多少', NULL, 0, NULL, NULL, NULL, 0, NULL, 6, '按月付息,到期还本', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(186, 0, 0, '马大哈', '450521198911177', '12134564845', 23, '重庆', 281499, '龙水湖国际旅游度假区', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '测试', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2016-01-06 00:00:00', 'admin', 0, 0, 0, NULL, 116, '1852', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
	(187, 1, 12345111, '测试11', '430051199003153821', '18600000000', 12, '深圳', 281563, '心海城', 0, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '转账', NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, '2016-01-08 00:00:00', 'xtgly', 0, 0, 0, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


-- 导出  表 zcurd.demo_users 结构
DROP TABLE IF EXISTS `demo_users`;
CREATE TABLE IF NOT EXISTS `demo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT '0' COMMENT '状态',
  `login_id` varchar(255) DEFAULT '' COMMENT '登录账户',
  `login_pwd` varchar(255) DEFAULT '' COMMENT '录登密码',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `info` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='游戏用户';

-- 正在导出表  zcurd.demo_users 的数据：~41 rows (大约)
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
	(32, 1, '1111', 'adfafasf', 'qqq', '2016-01-02 00:00:00', NULL),
	(33, 1, '苦基', NULL, 'aa', '2016-01-02 22:15:53', NULL),
	(34, 1, '好', NULL, '呵呵', '2016-01-02 00:00:00', NULL),
	(35, 0, 'abcd', NULL, '中', '2016-01-02 22:49:09', NULL),
	(36, 1, 'aaa', NULL, '国', '2016-01-02 22:49:24', NULL),
	(37, 1, 'bacdq', NULL, '国', '2016-01-02 00:00:00', NULL),
	(38, 1, 'abcd', '1', 'aa', '2016-01-07 00:00:00', 'aa'),
	(45, 0, '111', NULL, '111222', '2016-01-03 00:00:00', NULL),
	(49, 1, 'adfsa', 'asdfasd', 'adfsasd', '2016-01-14 00:00:00', 'asdfasf'),
	(51, 1, 'sss111111', 'sfsfas', '林林1', '2016-01-05 00:00:00', NULL);
/*!40000 ALTER TABLE `demo_users` ENABLE KEYS */;


-- 导出  表 zcurd.dynamic_table 结构
DROP TABLE IF EXISTS `dynamic_table`;
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


-- 导出  表 zcurd.riskgrade 结构
DROP TABLE IF EXISTS `riskgrade`;
CREATE TABLE IF NOT EXISTS `riskgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastupateuser` int(11) DEFAULT NULL COMMENT '最后更新人',
  `lastupdatetime` datetime DEFAULT NULL COMMENT '最后更新时间',
  `type` varchar(255) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `startrange` int(11) DEFAULT NULL,
  `endrange` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='评级等级管理';

-- 正在导出表  zcurd.riskgrade 的数据：4 rows
/*!40000 ALTER TABLE `riskgrade` DISABLE KEYS */;
INSERT INTO `riskgrade` (`id`, `name`, `createuser`, `createtime`, `lastupateuser`, `lastupdatetime`, `type`, `source`, `level`, `startrange`, `endrange`) VALUES
	(1, '工薪个人', 1, '2015-12-08 15:18:23', 2, '2015-12-28 15:34:04', NULL, NULL, NULL, NULL, NULL),
	(2, '自雇个人', 1, '2015-12-08 15:18:32', 2, '2015-12-28 14:10:35', NULL, NULL, NULL, NULL, NULL),
	(3, '项目', 1, '2015-12-08 15:18:51', 2, '2015-12-22 11:12:30', NULL, NULL, NULL, NULL, NULL),
	(4, '城市', 1, '2015-12-08 15:18:57', 2, '2015-12-29 11:48:17', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `riskgrade` ENABLE KEYS */;


-- 导出  表 zcurd.riskgradedetail 结构
DROP TABLE IF EXISTS `riskgradedetail`;
CREATE TABLE IF NOT EXISTS `riskgradedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `riskgradeid` int(11) DEFAULT NULL COMMENT '等级属性id',
  `level` varchar(50) DEFAULT NULL COMMENT '等级',
  `comment` varchar(500) DEFAULT NULL COMMENT '含义',
  `startrange` int(11) DEFAULT NULL COMMENT '分值范围开始',
  `endrange` int(11) DEFAULT NULL COMMENT '分值范围结束',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='评级等级管理';

-- 正在导出表  zcurd.riskgradedetail 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `riskgradedetail` DISABLE KEYS */;
INSERT INTO `riskgradedetail` (`id`, `riskgradeid`, `level`, `comment`, `startrange`, `endrange`, `createtime`) VALUES
	(251, 2, 'AAA', '点滴信用，帮您一生富足。', 641, 800, '2015-12-28 14:09:24'),
	(252, 2, 'AA', '点滴信用，帮您一生富足。', 561, 640, '2015-12-28 14:09:24'),
	(253, 2, 'A', '点滴信用，帮您一生富足。', 481, 560, '2015-12-28 14:09:24'),
	(254, 2, 'B', '点滴信用，帮您一生富足。', 401, 480, '2015-12-28 14:09:24'),
	(255, 2, 'C', '点滴信用，帮您一生富足。', 321, 400, '2015-12-28 14:09:24'),
	(256, 2, 'D', '点滴信用，帮您一生富足。', 0, 320, '2015-12-28 14:09:24'),
	(257, 1, 'D', '点滴信用，伴您一生富足。', 0, 320, '2015-12-28 15:33:29'),
	(258, 1, 'C', '点滴信用，伴您一生富足。', 321, 400, '2015-12-28 15:33:29'),
	(259, 1, 'B', '点滴信用，伴您一生富足。', 401, 480, '2015-12-28 15:33:29'),
	(260, 1, 'A', '点滴信用，伴您一生富足。', 481, 560, '2015-12-28 15:33:30'),
	(261, 1, 'AA', '点滴信用，伴您一生富足。', 561, 640, '2015-12-28 15:33:30'),
	(262, 1, 'AAA', '这位小主有极好的债务安全保障，从各方面看无可挑剔，具有良好的还款意愿以及相当稳定的偿债能力。点滴信用，伴您一生富足。', 641, 800, '2015-12-28 15:33:30'),
	(266, 4, '1', '1', 1, 1, '2015-12-29 11:47:04'),
	(267, 4, '2', '3', 2, 2, '2015-12-29 11:47:04'),
	(268, 4, '2', '2', 2, 2, '2015-12-29 11:47:04');
/*!40000 ALTER TABLE `riskgradedetail` ENABLE KEYS */;


-- 导出  表 zcurd.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(100) DEFAULT NULL COMMENT '菜单地址',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属菜单',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `order_num` int(11) DEFAULT NULL COMMENT '顺序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- 正在导出表  zcurd.sys_menu 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_url`, `parent_id`, `icon`, `order_num`, `create_time`) VALUES
	(1, '贷款管理', NULL, 0, NULL, 1, '2016-01-08 08:36:44'),
	(2, '贷前客户管理', '/zcurd/listPage?headId=133', 1, 'icon-search', 1, '2016-01-08 08:36:59'),
	(3, '内容管理', NULL, 0, NULL, 2, '2016-01-08 08:37:17'),
	(4, '游戏用户', '/zcurd/listPage?headId=130', 3, 'icon-search', 1, '2016-01-08 08:37:25'),
	(5, '系统管理', NULL, 0, 'icon-search', 3, '2016-01-08 08:37:31'),
	(6, '菜单管理', '/menu/list', 5, 'icon-search', 2, '2016-01-08 08:37:38'),
	(12, '用户管理', '/zcurd/listPage?headId=131', 5, NULL, 3, '2016-01-08 16:32:08'),
	(16, 'bb', NULL, NULL, NULL, NULL, '2016-01-08 17:02:54'),
	(17, '客户管理', '/zcurd/listPage?headId=133', 5, NULL, 4, '2016-01-09 10:08:06'),
	(18, '在线表单', '/zcurdHead/list', 5, NULL, 1, '2016-01-09 10:41:21'),
	(19, '贷中客户管理', '/zcurd/listPage?headId=133', 1, 'icon-search', 2, '2016-01-09 10:45:42'),
	(20, '贷后客户管理', '/zcurd/listPage?headId=133', 1, 'icon-search', NULL, '2016-01-09 10:45:51');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;


-- 导出  表 zcurd.sys_menu_btn 结构
DROP TABLE IF EXISTS `sys_menu_btn`;
CREATE TABLE IF NOT EXISTS `sys_menu_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) DEFAULT NULL COMMENT '所属菜单',
  `btn_name` varchar(100) DEFAULT NULL COMMENT '按钮名称',
  `class_name` varchar(100) DEFAULT NULL COMMENT '页面class名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '后台method名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `order_num` int(11) DEFAULT NULL COMMENT '顺序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`menu_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单按钮';

-- 正在导出表  zcurd.sys_menu_btn 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `sys_menu_btn` DISABLE KEYS */;
INSERT INTO `sys_menu_btn` (`id`, `menu_id`, `btn_name`, `class_name`, `method_name`, `icon`, `order_num`, `create_time`) VALUES
	(1, 6, '增加', 'addBtn', 'add,addPage', 'icon_add', 1, '2016-01-11 14:59:30'),
	(2, 3, '增加', NULL, NULL, NULL, 2, '2016-01-11 15:33:22'),
	(3, 4, '增加', NULL, NULL, NULL, NULL, '2016-01-12 09:19:37'),
	(4, 4, '删除', NULL, NULL, NULL, NULL, '2016-01-12 09:19:53'),
	(5, 4, '修改', NULL, NULL, NULL, NULL, '2016-01-12 09:22:31');
/*!40000 ALTER TABLE `sys_menu_btn` ENABLE KEYS */;


-- 导出  表 zcurd.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- 正在导出表  zcurd.sys_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `user_name`, `password`, `create_time`) VALUES
	(1, 'zhong', '123456', '2016-01-08 16:33:05'),
	(2, 'test', '123456', '2016-01-08 16:35:12');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


-- 导出  视图 zcurd.v_blog 结构
DROP VIEW IF EXISTS `v_blog`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_blog` (
	`id` INT(11) NOT NULL,
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`content` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  表 zcurd.zcurd_field 结构
DROP TABLE IF EXISTS `zcurd_field`;
CREATE TABLE IF NOT EXISTS `zcurd_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `head_id` int(11) DEFAULT NULL COMMENT '所属表',
  `field_name` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `column_name` varchar(100) DEFAULT NULL COMMENT '列表列名',
  `column_length` int(11) DEFAULT '120' COMMENT '列宽',
  `data_type` varchar(50) DEFAULT NULL COMMENT '数据类型',
  `is_show_list` int(11) DEFAULT '1' COMMENT '是否列表显示',
  `is_allow_add` int(11) DEFAULT '1' COMMENT '是否允许增加',
  `is_allow_update` int(11) DEFAULT '1' COMMENT '是否允许编辑',
  `dict_sql` varchar(1000) DEFAULT NULL COMMENT '字典sql',
  `is_search` int(11) DEFAULT '0' COMMENT '是否搜索',
  `order_num` int(11) DEFAULT '0' COMMENT '顺序',
  `search_type` int(11) DEFAULT '1' COMMENT '搜索类型(1:值,2:范围)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8 COMMENT='在线表单字段';

-- 正在导出表  zcurd.zcurd_field 的数据：~170 rows (大约)
/*!40000 ALTER TABLE `zcurd_field` DISABLE KEYS */;
INSERT INTO `zcurd_field` (`id`, `head_id`, `field_name`, `column_name`, `column_length`, `data_type`, `is_show_list`, `is_allow_add`, `is_allow_update`, `dict_sql`, `is_search`, `order_num`, `search_type`, `create_time`) VALUES
	(179, 130, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 1, 1, '2016-01-08 16:25:53'),
	(180, 130, 'status', '状态', 120, 'int', 1, 1, 1, 'select 0, \'无效\' union all select 1, \'有效\'', 1, 3, 1, '2016-01-08 16:25:53'),
	(181, 130, 'login_id', '登录账户', 120, 'varchar', 1, 1, 1, '', 1, 2, 1, '2016-01-08 16:25:53'),
	(182, 130, 'login_pwd', '录登密码', 120, 'varchar', 1, 1, 1, '', 0, 4, 1, '2016-01-08 16:25:53'),
	(183, 130, 'nickname', '昵称', 120, 'varchar', 1, 1, 1, '', 0, 5, 1, '2016-01-08 16:25:53'),
	(184, 130, 'reg_time', '注册时间', 120, 'timestamp', 1, 0, 0, '', 1, 6, 2, '2016-01-08 16:25:53'),
	(185, 130, 'info', '备注', 120, 'varchar', 1, 1, 1, '', 0, 7, 1, '2016-01-08 16:25:53'),
	(186, 131, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 16:31:45'),
	(187, 131, 'user_name', '用户名', 120, 'varchar', 1, 1, 1, '', 1, 0, 1, '2016-01-08 16:31:45'),
	(188, 131, 'password', '密码', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 16:31:45'),
	(189, 131, 'create_time', '创建时间', 120, 'timestamp', 1, 0, 0, '', 1, 0, 2, '2016-01-08 16:31:45'),
	(316, 133, 'cid', '主键客户信息表', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(317, 133, 'source', '客户来源', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(318, 133, 'parentid', '主借人id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(319, 133, 'name', '客户姓名', 120, 'varchar', 1, 1, 1, '', 1, 0, 1, '2016-01-08 17:53:35'),
	(320, 133, 'idcard', '客户身份证', 120, 'varchar', 1, 1, 1, '', 1, 0, 1, '2016-01-08 17:53:35'),
	(321, 133, 'mobile', '客户手机号码', 120, 'varchar', 1, 1, 1, '', 1, 0, 1, '2016-01-08 17:53:35'),
	(322, 133, 'cityid', '城市id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(323, 133, 'cityname', '城市名', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(324, 133, 'pid', '项目id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(325, 133, 'pname', '项目名', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(326, 133, 'type', '客户类型', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(327, 133, 'status', '状态', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(328, 133, 'mid', '使用模型', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(329, 133, 'score', '按模型计算得分', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:35'),
	(330, 133, 'tempcontent', '修改数据', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(331, 133, 'ordercode', '订单id', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(332, 133, 'price', '贷款金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(333, 133, 'stime', '贷款开始时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(334, 133, 'etime', '贷款结束时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(335, 133, 'sex', '客户性别', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(336, 133, 'birthday', '出生年月', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(337, 133, 'natiomality', '国籍', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(338, 133, 'nation', '民族', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(339, 133, 'pidtype', '证件类型', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(340, 133, 'pidvaildity', '证件有效期', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(341, 133, 'pidunit', '发证机关', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(342, 133, 'higdegree', '最高学位', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(343, 133, 'health', '健康状况', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(344, 133, 'domloction', '户籍所在地', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(345, 133, 'salaryway', '工资发放形式', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(346, 133, 'familycount', '家庭人口数量', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(347, 133, 'buyhouseamount', '购房金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(348, 133, 'fristpayratio', '首付比例', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(349, 133, 'loanproduct', '贷款产品', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(350, 133, 'applyamount', '申请金额', 120, 'double', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(351, 133, 'homestatus', '置业状况', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(352, 133, 'marriagestatus', '婚姻状态', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(353, 133, 'familyaddress', '家庭地址', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(354, 133, 'job', '职业', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(355, 133, 'gunitname', '单位名称-工薪', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(356, 133, 'gunitnature', '单位性质-工薪', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(357, 133, 'gjoblevel', '工作级别-工薪', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(358, 133, 'gmonincome', '月收入-工薪', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(359, 133, 'gworklife', '工作年限-工薪', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(360, 133, 'gsalaryway', '工作发放形式-工薪', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(361, 133, 'zcompanyname', '企业名-自雇', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(362, 133, 'zindustrytype', '行业类型-自雇', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(363, 133, 'zmonincome', '月收入—自雇', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(364, 133, 'zyearbus', '年营业额-自雇', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(365, 133, 'zenterpfund', '企业资产-自雇', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(366, 133, 'zenterploan', '企业借款-自雇', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(367, 133, 'zmanageplace', '经营场所-自雇', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(368, 133, 'zsharesratio', '占股比例-自雇', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:36'),
	(369, 133, 'age', '年龄', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(370, 133, 'bankaccount', '用户银行账户', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(371, 133, 'creditlimit', '信用卡最高额度', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(372, 133, 'creditconsume', '信用卡已消费', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(373, 133, 'otherloan', '其他贷款', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(374, 133, 'contname', '紧急联系人姓名', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(375, 133, 'contage', '紧急联系人年龄', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(376, 133, 'contsex', '紧急联系人性别', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(377, 133, 'contrelation', '紧急联系人关系', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(378, 133, 'contloan', '经济联系人是否知晓贷款', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(379, 133, 'contmobile', '紧急联系人电话', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(380, 133, 'contphone', '紧急联系人住宅电话', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(381, 133, 'contaddress', '紧急联系人地址', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(382, 133, 'contunitname', '紧急联系人单位名称', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(383, 133, 'contunitphone', '紧急联系人单位电话', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(384, 133, 'contunitaddress', '紧急联系人单位地址', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(385, 133, 'contworkdep', '紧急联系人工作部门', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(386, 133, 'contposition', '紧急联系人工作职位', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(387, 133, 'adid', 'adid', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(388, 133, 'ctime', 'ctime', 120, 'datetime', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(389, 133, 'aname', 'aname', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(390, 133, 'creditNumber', 'creditNumber', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(391, 133, 'zenterpborrow', 'zenterpborrow', 120, 'double', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(392, 133, 'creditLoanMoney', 'creditLoanMoney', 120, 'double', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(393, 133, 'relations', 'relations', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(394, 133, 'xsid', 'xsid', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(395, 133, 'xsname', 'xsname', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(396, 133, 'gunitaddress', 'gunitaddress', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(397, 133, 'zcompanyaddress', 'zcompanyaddress', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(398, 133, 'loantimelimit', 'loantimelimit', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(399, 133, 'fund', 'fund', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(400, 133, 'fundname', 'fundname', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(401, 133, 'examindate', '报审时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(402, 133, 'fkid', 'fkid', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(403, 133, 'personPath', 'personPath', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(404, 133, 'period', 'period', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(405, 133, 'repay', 'repay', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(406, 133, 'signstatus', '签约状态', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(407, 133, 'signtime', '签约时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(408, 133, 'loanstatus', '放款状态', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(409, 133, 'loantime', '放款时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(410, 133, 'recviway', '还款方式1 pos机器 2现金  3转账  4其他', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(411, 133, 'posamount', '放款金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:37'),
	(412, 133, 'postime', 'pos刷卡时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(413, 133, 'cashamount', '现金金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(414, 133, 'cashtime', '现金付款时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(415, 133, 'transferamount', '转账金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(416, 133, 'transfertime', '转账时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(417, 133, 'otheramount', '加他付款方式', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(418, 133, 'othertime', 'othertime', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(419, 133, 'urgentlevel', '紧急程度', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(420, 133, 'applyloandate', '申请放款时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(421, 133, 'accountbranch', '开户支行', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(422, 133, 'loanbankaccount', '还款银行卡号', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(423, 133, 'houseConsultant', '职业顾问', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(424, 133, 'consultantphone', '顾问号码', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(425, 133, 'refundamount', '退款金额', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(426, 133, 'refundtime', '退款时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(427, 133, 'loanMoney', 'loanMoney', 120, 'double', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(428, 133, 'creditLevel', '信用卡等级', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(429, 133, 'buyhouseaddress', '客户新买房新地址', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(430, 133, 'gjrelation', '共借人关系', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(431, 133, 'approvalopinion', '审批意见', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(432, 133, 'archstatus', '资料归档情况', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(433, 133, 'archtime', '资料归档时间', 120, 'date', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(434, 133, 'archremark', '资料归档备注', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(435, 133, 'mortgagestatus', '按揭情况', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(436, 133, 'mortgageremark', '按揭备注', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(437, 133, 'repaystatus', '还款情况', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(438, 133, 'overduecount', '逾期次数', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(439, 133, 'overfueremark', '逾期记录', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(440, 133, 'cheLoanMoney', 'cheLoanMoney', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(441, 133, 'houseLoanMoney', 'houseLoanMoney', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-08 17:53:38'),
	(442, 134, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(443, 134, 'name', '类型名称', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(444, 134, 'createuser', '创建人', 120, 'int', 0, 0, 0, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(445, 134, 'createtime', '创建时间', 130, 'timestamp', 1, 1, 1, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(446, 134, 'lastupateuser', '最后更新人', 120, 'int', 0, 0, 0, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(447, 134, 'lastupdatetime', '最后更新时间', 120, 'datetime', 0, 0, 0, '', 0, 0, 1, '2016-01-11 11:52:59'),
	(453, 135, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 1, 1, '2016-01-11 11:53:07'),
	(454, 135, 'riskgradeid', '类型', 100, 'int', 1, 1, 1, 'select a.id, a.name from riskgrade a', 1, 2, 1, '2016-01-11 11:53:07'),
	(455, 135, 'level', '等级', 60, 'varchar', 1, 1, 1, '', 0, 3, 1, '2016-01-11 11:53:07'),
	(456, 135, 'comment', '含义', 120, 'varchar', 1, 1, 1, '', 0, 6, 1, '2016-01-11 11:53:07'),
	(457, 135, 'startrange', '分值开始', 80, 'int', 1, 1, 1, '', 0, 4, 1, '2016-01-11 11:53:07'),
	(458, 135, 'endrange', '分值结束', 80, 'int', 1, 1, 1, '', 0, 5, 1, '2016-01-11 11:53:07'),
	(459, 135, 'createtime', '创建时间', 120, 'timestamp', 0, 0, 0, '', 0, 0, 1, '2016-01-11 11:53:07'),
	(460, 136, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:02'),
	(461, 136, 'menu_id', '所属菜单', 120, 'int', 1, 1, 1, 'select * from (select id, menu_name from sys_menu order by order_num) a', 1, 0, 1, '2016-01-11 14:53:02'),
	(462, 136, 'btn_name', '按钮名称', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:02'),
	(463, 136, 'class_name', '页面class名称', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:02'),
	(464, 136, 'method_name', '后台method名称', 120, 'char', 1, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:02'),
	(465, 136, 'icon', '图标', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:03'),
	(466, 136, 'order_num', '顺序', 120, 'int', 0, 1, 1, '', 0, 0, 1, '2016-01-11 14:53:03'),
	(467, 136, 'create_time', '创建时间', 120, 'timestamp', 0, 0, 0, '', 0, 0, 1, '2016-01-11 14:53:03'),
	(468, 137, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-12 16:58:48'),
	(469, 137, 'head_id', '所属表单', 100, 'int', 1, 1, 1, 'select id, form_name from zcurd_head', 1, 0, 1, '2016-01-12 16:58:48'),
	(470, 137, 'btn_name', '按钮名称', 80, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-12 16:58:48'),
	(471, 137, 'location', '按钮位置', 80, 'int', 1, 1, 1, 'select 1, \'顶部\' union all select 2, \'行内\'', 0, 0, 1, '2016-01-12 16:58:48'),
	(472, 137, 'action', '行为', 80, 'int', 1, 1, 1, 'select 0, \'自定义\' union all select 1, \'打开子页面\'', 0, 0, 1, '2016-01-12 16:58:48'),
	(473, 137, 'func_content', '方法内容', 120, 'text', 0, 1, 1, '', 0, 0, 1, '2016-01-12 16:58:48'),
	(474, 137, 'create_time', '创建时间', 130, 'timestamp', 1, 0, 0, '', 0, 0, 1, '2016-01-12 16:58:48'),
	(475, 138, 'id', 'id', 120, 'int', 1, 1, 1, '', 0, 0, 1, '2016-01-13 10:35:01'),
	(476, 138, 'head_id', '所属表单', 120, 'int', 1, 1, 1, 'select id, form_name from zcurd_head', 1, 0, 1, '2016-01-13 10:35:01'),
	(477, 138, 'page', '页面', 120, 'varchar', 1, 1, 1, '', 0, 0, 1, '2016-01-13 10:35:01'),
	(478, 138, 'js_content', 'js内容', 120, 'text', 0, 1, 1, '', 0, 0, 1, '2016-01-13 10:35:01'),
	(479, 138, 'create_time', '创建时间', 130, 'timestamp', 1, 0, 0, '', 0, 0, 1, '2016-01-13 10:35:01');
/*!40000 ALTER TABLE `zcurd_field` ENABLE KEYS */;


-- 导出  表 zcurd.zcurd_head 结构
DROP TABLE IF EXISTS `zcurd_head`;
CREATE TABLE IF NOT EXISTS `zcurd_head` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL COMMENT '数据库表名',
  `form_name` varchar(100) DEFAULT NULL COMMENT '表单名称',
  `id_field` varchar(50) DEFAULT 'id' COMMENT '主键字段',
  `is_auto` int(11) DEFAULT '1' COMMENT '是否自增',
  `form_type` int(11) DEFAULT '1' COMMENT '表单类型（1:单表,2:主从）',
  `dialog_size` varchar(500) NOT NULL DEFAULT '800x500' COMMENT '弹窗大小',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='在线表单';

-- 正在导出表  zcurd.zcurd_head 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `zcurd_head` DISABLE KEYS */;
INSERT INTO `zcurd_head` (`id`, `table_name`, `form_name`, `id_field`, `is_auto`, `form_type`, `dialog_size`, `create_time`) VALUES
	(130, 'demo_users', '游戏用户', 'id', 1, 1, '600x400', '2016-01-08 16:25:53'),
	(131, 'sys_user', '用户管理', 'id', 1, 1, '400x300', '2016-01-08 16:31:45'),
	(133, 'customer', '客户管理', 'cid', 1, 1, '900x600', '2016-01-08 17:53:35'),
	(134, 'riskgrade', '评级等级管理', 'id', 1, 2, '800x500', '2016-01-11 11:52:59'),
	(135, 'riskgradedetail', '评级等级管理详情', 'id', 1, 1, '600x400', '2016-01-11 11:53:07'),
	(136, 'sys_menu_btn', '菜单按钮', 'id', 1, 1, '600x400', '2016-01-11 14:53:02'),
	(137, 'zcurd_head_btn', '表单按钮', 'id', 1, 1, '600x400', '2016-01-12 16:58:48'),
	(138, 'zcurd_head_js', '表单扩展js', 'id', 1, 1, '600x400', '2016-01-13 10:35:01');
/*!40000 ALTER TABLE `zcurd_head` ENABLE KEYS */;


-- 导出  表 zcurd.zcurd_head_btn 结构
DROP TABLE IF EXISTS `zcurd_head_btn`;
CREATE TABLE IF NOT EXISTS `zcurd_head_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) DEFAULT NULL COMMENT '所属表单',
  `btn_name` varchar(50) DEFAULT NULL COMMENT '按钮名称',
  `location` int(11) DEFAULT '1' COMMENT '按钮位置（1：顶部，2：行内）',
  `action` int(11) DEFAULT '1' COMMENT '行为（0：无，1：打开子页面）',
  `func_content` text COMMENT '方法内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='表单按钮';

-- 正在导出表  zcurd.zcurd_head_btn 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `zcurd_head_btn` DISABLE KEYS */;
INSERT INTO `zcurd_head_btn` (`id`, `head_id`, `btn_name`, `location`, `action`, `func_content`, `create_time`) VALUES
	(1, 134, '管理', 2, 1, 'function(index) {\n	var row = datagrid.datagrid("getRows")[index];\n	var url = basePath + "/zcurd/listPage?headId=135&riskgradeid=" + row.id;\n	_openSubPage(url);\n}', '2016-01-12 14:28:50'),
	(2, 133, '测试', 2, 0, 'function(){}', '2016-01-13 10:30:35');
/*!40000 ALTER TABLE `zcurd_head_btn` ENABLE KEYS */;


-- 导出  表 zcurd.zcurd_head_js 结构
DROP TABLE IF EXISTS `zcurd_head_js`;
CREATE TABLE IF NOT EXISTS `zcurd_head_js` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) DEFAULT NULL COMMENT '所属表单',
  `page` varchar(50) DEFAULT NULL COMMENT '页面',
  `js_content` text COMMENT 'js内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='表单扩展js';

-- 正在导出表  zcurd.zcurd_head_js 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `zcurd_head_js` DISABLE KEYS */;
INSERT INTO `zcurd_head_js` (`id`, `head_id`, `page`, `js_content`, `create_time`) VALUES
	(1, 134, 'list', 'var operateWidth = 80;\r\nvar subPageWidth = "50%";\r\nvar subPageTitle = "等级详情";\r\ndgOptions.singleSelect=true;', '2016-01-12 17:25:45');
/*!40000 ALTER TABLE `zcurd_head_js` ENABLE KEYS */;


-- 导出  视图 zcurd.v_blog 结构
DROP VIEW IF EXISTS `v_blog`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_blog`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `v_blog` AS SELECT
   `blog`.`id` AS `id`,
   `blog`.`title` AS `title`,
   `blog`.`content` AS `content`
FROM `blog` ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
