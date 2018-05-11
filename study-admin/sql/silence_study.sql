/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : silence_study

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 07/05/2018 18:47:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `dept_name` varchar(30) NOT NULL COMMENT '部门名称',
  `dept_tel` varchar(22) DEFAULT NULL COMMENT '部门电话',
  `dept_fax` varchar(22) DEFAULT NULL COMMENT '部门传真',
  `disabled` int(1) DEFAULT '0' COMMENT '0可用1禁用2删除',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `seq` int(11) DEFAULT '0' COMMENT '排序',
  `pid` int(11) DEFAULT '0' COMMENT '部门父编号',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `detp_name_unique` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (55, '总公司', '0755-00000000', '0755-00000000', 0, '2', 3, 0);
INSERT INTO `sys_dept` VALUES (280, '广告组', '', '', 0, '', 1, 62);
INSERT INTO `sys_dept` VALUES (281, '业务组', '', '', 0, '', 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '用户登录ip',
  `user_agent` varchar(300) DEFAULT NULL COMMENT '用户浏览器信息',
  `login_type` int(11) DEFAULT '0' COMMENT '登录类型',
  `remark` varchar(45) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4126 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户登录日志';

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
BEGIN;
INSERT INTO `sys_log_login` VALUES (4116, 'xujianxin', 28, '2018-05-07 17:27:53', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4117, 'xujianxin', 28, '2018-05-07 17:29:11', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4118, 'xujianxin', 28, '2018-05-07 17:30:39', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4119, 'xujianxin', 28, '2018-05-07 17:33:55', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4120, 'xujianxin', 28, '2018-05-07 17:36:41', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4121, 'xujianxin', 28, '2018-05-07 17:41:58', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4122, 'xujianxin', 28, '2018-05-07 17:43:59', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4123, 'xujianxin', 28, '2018-05-07 17:51:17', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4124, 'xujianxin', 28, '2018-05-07 17:54:59', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
INSERT INTO `sys_log_login` VALUES (4125, 'xujianxin', 28, '2018-05-07 18:45:31', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 0, '登录');
COMMIT;

-- ----------------------------
-- Table structure for sys_log_op
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_op`;
CREATE TABLE `sys_log_op` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `elapsed_time` int(11) DEFAULT NULL COMMENT '耗用时间',
  `exec_sql` text CHARACTER SET utf8 COMMENT '执行的语句',
  `user_id` int(11) DEFAULT NULL COMMENT '执行人id',
  `user_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '执行人名称',
  `exec_type` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '动作,delete update insert',
  `exec_table` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20008 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统操作日志';

-- ----------------------------
-- Records of sys_log_op
-- ----------------------------
BEGIN;
INSERT INTO `sys_log_op` VALUES (19922, '2018-05-07 17:27:53', 9, 'update sys_user set login_time=\'2018-05-07 17:27:53\', login_ip=\'127.0.0.1\', login_count=4377 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19923, '2018-05-07 17:27:53', 6, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4116,\'xujianxin\',28,\'2018-05-07 17:27:53\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (19924, '2018-05-07 17:29:11', 4, 'update sys_user set login_time=\'2018-05-07 17:29:11\', login_ip=\'127.0.0.1\', login_count=4378 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19925, '2018-05-07 17:29:11', 4, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4117,\'xujianxin\',28,\'2018-05-07 17:29:11\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (19926, '2018-05-07 17:30:39', 28, 'update sys_user set login_time=\'2018-05-07 17:30:39\', login_ip=\'127.0.0.1\', login_count=4379 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19927, '2018-05-07 17:30:39', 14, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4118,\'xujianxin\',28,\'2018-05-07 17:30:39\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (19928, '2018-05-07 17:33:54', 8, 'update sys_user set login_time=\'2018-05-07 17:33:54\', login_ip=\'127.0.0.1\', login_count=4380 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19929, '2018-05-07 17:33:54', 16, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4119,\'xujianxin\',28,\'2018-05-07 17:33:54\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (19930, '2018-05-07 17:34:55', 5, 'delete from sys_role_menu_mod WHERE menu_id = 43 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19931, '2018-05-07 17:34:55', 2, 'delete from sys_role_menu_mod WHERE menu_id = 48 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19932, '2018-05-07 17:34:55', 1, 'delete from sys_role_menu_mod WHERE menu_id = 49 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19933, '2018-05-07 17:34:55', 1, 'delete from sys_role_menu_mod WHERE menu_id = 50 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19934, '2018-05-07 17:34:55', 3, 'delete from sys_menu WHERE menu_id in ( 43 , 48 , 49 , 50 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19935, '2018-05-07 17:36:41', 9, 'update sys_user set login_time=\'2018-05-07 17:36:41\', login_ip=\'127.0.0.1\', login_count=4381 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19936, '2018-05-07 17:36:41', 12, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4120,\'xujianxin\',28,\'2018-05-07 17:36:41\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (19937, '2018-05-07 17:37:00', 5, 'delete from sys_role_menu_mod WHERE menu_id = 69 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19938, '2018-05-07 17:37:00', 2, 'delete from sys_role_menu_mod WHERE menu_id = 70 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19939, '2018-05-07 17:37:00', 2, 'delete from sys_role_menu_mod WHERE menu_id = 71 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19940, '2018-05-07 17:37:00', 2, 'delete from sys_menu WHERE menu_id in ( 69 , 70 , 71 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19941, '2018-05-07 17:37:18', 5, 'delete from sys_role_menu_mod WHERE menu_id = 79 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19942, '2018-05-07 17:37:18', 3, 'delete from sys_role_menu_mod WHERE menu_id = 80 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19943, '2018-05-07 17:37:18', 1, 'delete from sys_role_menu_mod WHERE menu_id = 81 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19944, '2018-05-07 17:37:19', 2, 'delete from sys_menu WHERE menu_id in ( 79 , 80 , 81 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19945, '2018-05-07 17:37:29', 5, 'delete from sys_role_menu_mod WHERE menu_id = 59 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19946, '2018-05-07 17:37:29', 1, 'delete from sys_role_menu_mod WHERE menu_id = 61 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19947, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 62 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19948, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 64 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19949, '2018-05-07 17:37:29', 3, 'delete from sys_role_menu_mod WHERE menu_id = 65 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19950, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 66 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19951, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 67 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19952, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 74 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19953, '2018-05-07 17:37:29', 1, 'delete from sys_role_menu_mod WHERE menu_id = 75 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19954, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 76 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19955, '2018-05-07 17:37:29', 2, 'delete from sys_role_menu_mod WHERE menu_id = 77 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19956, '2018-05-07 17:37:29', 1, 'delete from sys_role_menu_mod WHERE menu_id = 78 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19957, '2018-05-07 17:37:29', 20, 'delete from sys_menu WHERE menu_id in ( 59 , 61 , 62 , 64 , 65 , 66 , 67 , 74 , 75 , 76 , 77 , 78 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19958, '2018-05-07 17:37:41', 7, 'delete from sys_role_menu_mod WHERE menu_id = 86 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19959, '2018-05-07 17:37:41', 2, 'delete from sys_role_menu_mod WHERE menu_id = 88 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19960, '2018-05-07 17:37:41', 3, 'delete from sys_role_menu_mod WHERE menu_id = 89 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19961, '2018-05-07 17:37:41', 1, 'delete from sys_role_menu_mod WHERE menu_id = 90 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19962, '2018-05-07 17:37:41', 1, 'delete from sys_role_menu_mod WHERE menu_id = 91 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19963, '2018-05-07 17:37:41', 2, 'delete from sys_role_menu_mod WHERE menu_id = 92 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19964, '2018-05-07 17:37:41', 2, 'delete from sys_role_menu_mod WHERE menu_id = 93 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19965, '2018-05-07 17:37:41', 2, 'delete from sys_role_menu_mod WHERE menu_id = 94 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19966, '2018-05-07 17:37:41', 1, 'delete from sys_role_menu_mod WHERE menu_id = 95 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19967, '2018-05-07 17:37:41', 1, 'delete from sys_role_menu_mod WHERE menu_id = 96 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19968, '2018-05-07 17:37:41', 1, 'delete from sys_role_menu_mod WHERE menu_id = 97 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19969, '2018-05-07 17:37:41', 2, 'delete from sys_role_menu_mod WHERE menu_id = 101 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19970, '2018-05-07 17:37:41', 4, 'delete from sys_menu WHERE menu_id in ( 86 , 88 , 89 , 90 , 91 , 92 , 93 , 94 , 95 , 96 , 97 , 101 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19971, '2018-05-07 17:37:52', 2, 'delete from sys_role_menu_mod WHERE menu_id = 51 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19972, '2018-05-07 17:37:52', 1, 'delete from sys_role_menu_mod WHERE menu_id = 52 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19973, '2018-05-07 17:37:52', 3, 'delete from sys_role_menu_mod WHERE menu_id = 54 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19974, '2018-05-07 17:37:52', 2, 'delete from sys_role_menu_mod WHERE menu_id = 56 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19975, '2018-05-07 17:37:52', 2, 'delete from sys_role_menu_mod WHERE menu_id = 57 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19976, '2018-05-07 17:37:52', 2, 'delete from sys_role_menu_mod WHERE menu_id = 58 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19977, '2018-05-07 17:37:52', 20, 'delete from sys_menu WHERE menu_id in ( 51 , 52 , 54 , 56 , 57 , 58 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19978, '2018-05-07 17:38:01', 2, 'delete from sys_role_menu_mod WHERE menu_id = 82 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19979, '2018-05-07 17:38:01', 1, 'delete from sys_role_menu_mod WHERE menu_id = 83 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19980, '2018-05-07 17:38:01', 2, 'delete from sys_role_menu_mod WHERE menu_id = 85 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19981, '2018-05-07 17:38:01', 2, 'delete from sys_role_menu_mod WHERE menu_id = 102 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19982, '2018-05-07 17:38:01', 1, 'delete from sys_role_menu_mod WHERE menu_id = 103 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19983, '2018-05-07 17:38:01', 1, 'delete from sys_role_menu_mod WHERE menu_id = 104 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19984, '2018-05-07 17:38:01', 5, 'delete from sys_menu WHERE menu_id in ( 82 , 83 , 85 , 102 , 103 , 104 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19985, '2018-05-07 17:38:09', 1, 'delete from sys_role_menu_mod WHERE menu_id = 105 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19986, '2018-05-07 17:38:09', 1, 'delete from sys_role_menu_mod WHERE menu_id = 106 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19987, '2018-05-07 17:38:09', 1, 'delete from sys_role_menu_mod WHERE menu_id = 107 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19988, '2018-05-07 17:38:09', 2, 'delete from sys_role_menu_mod WHERE menu_id = 108 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19989, '2018-05-07 17:38:09', 2, 'delete from sys_role_menu_mod WHERE menu_id = 109 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19990, '2018-05-07 17:38:09', 1, 'delete from sys_role_menu_mod WHERE menu_id = 110 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19991, '2018-05-07 17:38:09', 4, 'delete from sys_menu WHERE menu_id in ( 105 , 106 , 107 , 108 , 109 , 110 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19992, '2018-05-07 17:38:16', 2, 'delete from sys_role_menu_mod WHERE menu_id = 111 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19993, '2018-05-07 17:38:16', 1, 'delete from sys_role_menu_mod WHERE menu_id = 112 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19994, '2018-05-07 17:38:16', 1, 'delete from sys_role_menu_mod WHERE menu_id = 113 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19995, '2018-05-07 17:38:16', 2, 'delete from sys_role_menu_mod WHERE menu_id = 114 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19996, '2018-05-07 17:38:16', 3, 'delete from sys_role_menu_mod WHERE menu_id = 116 ', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19997, '2018-05-07 17:38:16', 21, 'delete from sys_menu WHERE menu_id in ( 111 , 112 , 113 , 114 , 116 )', 1, 'admin', 'DELETE', 'test');
INSERT INTO `sys_log_op` VALUES (19998, '2018-05-07 17:41:58', 8, 'update sys_user set login_time=\'2018-05-07 17:41:58\', login_ip=\'127.0.0.1\', login_count=4382 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (19999, '2018-05-07 17:41:58', 17, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4121,\'xujianxin\',28,\'2018-05-07 17:41:58\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (20000, '2018-05-07 17:43:59', 9, 'update sys_user set login_time=\'2018-05-07 17:43:58\', login_ip=\'127.0.0.1\', login_count=4383 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (20001, '2018-05-07 17:43:59', 53, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4122,\'xujianxin\',28,\'2018-05-07 17:43:58\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (20002, '2018-05-07 17:51:17', 6, 'update sys_user set login_time=\'2018-05-07 17:51:16\', login_ip=\'127.0.0.1\', login_count=4384 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (20003, '2018-05-07 17:51:17', 10, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4123,\'xujianxin\',28,\'2018-05-07 17:51:16\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (20004, '2018-05-07 17:54:59', 5, 'update sys_user set login_time=\'2018-05-07 17:54:58\', login_ip=\'127.0.0.1\', login_count=4385 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (20005, '2018-05-07 17:54:59', 9, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4124,\'xujianxin\',28,\'2018-05-07 17:54:58\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
INSERT INTO `sys_log_op` VALUES (20006, '2018-05-07 18:45:31', 12, 'update sys_user set login_time=\'2018-05-07 18:45:30\', login_ip=\'127.0.0.1\', login_count=4386 where user_id=28', 1, 'admin', 'UPDATE', 'test');
INSERT INTO `sys_log_op` VALUES (20007, '2018-05-07 18:45:31', 17, 'insert into sys_log_login(id,user_name,user_id,login_time,login_ip,user_agent,login_type,remark) values(4125,\'xujianxin\',28,\'2018-05-07 18:45:30\',\'127.0.0.1\',\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\',0,\'登录\')', 1, 'admin', 'INSERT', 'test');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `elid` varchar(20) DEFAULT NULL COMMENT '元素ID',
  `icon_class` varchar(30) DEFAULT NULL COMMENT '节点图标样式',
  `tab_id` varchar(20) DEFAULT NULL COMMENT 'TAB页ID',
  `tab_title` varchar(20) DEFAULT NULL COMMENT 'TAB页标题',
  `tab_icon` varchar(30) DEFAULT NULL COMMENT 'TAB页图标样式',
  `iframe_url` varchar(200) DEFAULT NULL COMMENT '框架中打开URL',
  `seq` int(11) DEFAULT '0' COMMENT '排序',
  `modle` int(1) DEFAULT '0' COMMENT '打开模型0展开1TAB中打开2执行',
  `disabled` int(1) DEFAULT '0' COMMENT '0正常1禁用',
  `run_mod` int(11) DEFAULT '0' COMMENT '菜单操作权限',
  `pmid` int(11) DEFAULT '0' COMMENT '菜单父编号',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统设置', 'sysConfig', 'fa fa-cogs', NULL, '系统设置', 'productMIcon', '#', 0, 0, 0, 1, 0);
INSERT INTO `sys_menu` VALUES (8, '角色管理', 'sysRole', 'fa fa-users', NULL, '角色管理', 'icon-role', '/sysRole/index.html', 1, 1, 0, 63, 1);
INSERT INTO `sys_menu` VALUES (9, '用户管理', 'sysUser', 'fa fa-user', NULL, '用户管理', 'fa fa-user', '/sysUser/index.html', 3, 1, 0, 63, 1);
INSERT INTO `sys_menu` VALUES (10, '权限管理', 'sysAuth', 'fa fa-list-alt', NULL, '权限管理', 'icon-auth', '/sysAuth/index.html', 2, 1, 0, 63, 1);
INSERT INTO `sys_menu` VALUES (12, '部门管理', 'sysDept', 'fa fa-sitemap', NULL, '部门管理', 'icon-dept', '/sysDept/index.html', 2, 1, 0, 63, 1);
INSERT INTO `sys_menu` VALUES (22, '修改密码', 'modifyPwd', 'fa fa-list-alt', NULL, '修改密码', 'icon-form', '/sysUser/goModifyPwd.html', 3, 1, 1, 0, 1);
INSERT INTO `sys_menu` VALUES (34, '登录日志', 'sysLogLogin', 'fa fa-file-o', '', '登录日志', 'fa fa-file-o', '/sysLogLogin/index.html', 6, 1, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (35, '操作日志', 'sysLogOp', 'fa fa-file-o', NULL, '操作日志', 'fa fa-file-o', '/sysLogOp/index.html', 7, 1, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (36, '系统菜单', 'sysMenu', 'fa fa-th-list', NULL, '系统菜单', 'fa fa-th-list', '/sysMenu/index.html', 0, 1, 0, 63, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `seq` int(11) DEFAULT '0' COMMENT '排序号',
  `role_remark` varchar(30) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_unique` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', 0, '系统管理员');
INSERT INTO `sys_role` VALUES (5, '电子商务主管', 5, '电子商务主管');
INSERT INTO `sys_role` VALUES (6, '电子商务文员', 6, '电子商务文员');
INSERT INTO `sys_role` VALUES (7, '推广管理员', 0, 'APP推广员');
INSERT INTO `sys_role` VALUES (8, '测试', 0, '备注');
INSERT INTO `sys_role` VALUES (9, '业务员', 0, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu_mod
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_mod`;
CREATE TABLE `sys_role_menu_mod` (
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  `run_mod` int(11) NOT NULL COMMENT '运行权限',
  PRIMARY KEY (`role_id`,`menu_id`,`run_mod`),
  KEY `FK_sys_role_menu_run_2` (`menu_id`),
  KEY `FK_sys_role_menu_run_r` (`run_mod`),
  CONSTRAINT `FK_sys_role_menu_run` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `FK_sys_role_menu_run_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_menu_mod
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu_mod` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu_mod` VALUES (1, 8, 63);
INSERT INTO `sys_role_menu_mod` VALUES (1, 9, 63);
INSERT INTO `sys_role_menu_mod` VALUES (1, 10, 63);
INSERT INTO `sys_role_menu_mod` VALUES (1, 12, 63);
INSERT INTO `sys_role_menu_mod` VALUES (1, 34, 1);
INSERT INTO `sys_role_menu_mod` VALUES (1, 35, 1);
INSERT INTO `sys_role_menu_mod` VALUES (1, 36, 63);
COMMIT;

-- ----------------------------
-- Table structure for sys_run
-- ----------------------------
DROP TABLE IF EXISTS `sys_run`;
CREATE TABLE `sys_run` (
  `run_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `run_comm` varchar(20) DEFAULT NULL COMMENT '命令',
  `run_name` varchar(20) DEFAULT NULL COMMENT '说明',
  `run_btn` bit(1) DEFAULT NULL COMMENT '是否按钮',
  `run_btn_icon` varchar(20) DEFAULT NULL COMMENT '按钮样式',
  `run_mod` int(11) NOT NULL COMMENT '权限',
  `seq` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_run
-- ----------------------------
BEGIN;
INSERT INTO `sys_run` VALUES (1, 'browser', '浏览', b'0', NULL, 1, 10);
INSERT INTO `sys_run` VALUES (2, 'add', '新增', b'1', 'icon-tools-add', 2, 9);
INSERT INTO `sys_run` VALUES (3, 'edit', '编辑', b'1', 'icon-tools-edit', 4, 8);
INSERT INTO `sys_run` VALUES (4, 'delete', '删除', b'1', 'icon-tools-del', 8, 7);
INSERT INTO `sys_run` VALUES (5, 'search', '高级查询', b'1', 'icon-search', 16, 6);
INSERT INTO `sys_run` VALUES (6, 'refresh', '刷新', b'1', NULL, 32, 5);
INSERT INTO `sys_run` VALUES (7, 'print', '打印', b'1', NULL, 64, 4);
INSERT INTO `sys_run` VALUES (8, 'inport', '导入', b'1', NULL, 128, 3);
INSERT INTO `sys_run` VALUES (9, 'export', '导出', b'1', NULL, 256, 2);
INSERT INTO `sys_run` VALUES (10, 'audit', '审核', b'1', 'icon-auth', 512, 1);
INSERT INTO `sys_run` VALUES (11, 'operate', '状态操作', b'1', NULL, 1024, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属部门编号',
  `login_name` varchar(30) NOT NULL COMMENT '账号',
  `login_pwd` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(6) DEFAULT NULL COMMENT '盐值',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件地址',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `disabled` int(1) DEFAULT '0' COMMENT '0可用1禁用2删除',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `super_user` int(1) DEFAULT '0' COMMENT '超级管理员0否1是',
  PRIMARY KEY (`user_id`),
  KEY `FK_sys_user` (`dept_id`),
  CONSTRAINT `FK_sys_user` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '系统管理员', 55, 'admin', '056d8192a81f24f264eef6bca5f861ca', '54652', 'ee@sina.com', '2018-01-18 15:26:44', '0:0:0:0:0:0:0:1', 815, 0, 'MM307898', NULL, '2015-11-22 20:40:16', 1);
INSERT INTO `sys_user` VALUES (28, '许建新', 280, 'xujianxin', '40ed63c917ac5ae3fd3d2822500316f0', '397014', '', '2018-05-07 18:45:31', '127.0.0.1', 4386, 0, '', '2015-11-19 21:38:22', '2015-11-22 15:53:33', 0);
INSERT INTO `sys_user` VALUES (29, '测试', 55, 'ceshi', 'b238d286948d7595d92ffec9f4f38d84', '892259', 'ceshi@coocaa.com', NULL, NULL, 0, 1, '', '2017-05-10 18:04:08', '2017-05-10 18:04:22', 0);
INSERT INTO `sys_user` VALUES (30, '业务员1号', 281, 'yewu001', 'bd431e1a9bdbac2e28839420771ac4b5', '088070', 'yewu@coocaa.com', NULL, NULL, 0, 0, '', '2017-08-08 15:48:45', '2017-08-08 15:48:45', 0);
INSERT INTO `sys_user` VALUES (31, '测试', 280, 'test', '2f8394cc2916b0f784ce16c9496b8fb8', '629494', 'test@coocaa.com', NULL, NULL, 0, 0, '', '2017-08-09 17:02:18', '2017-08-09 17:02:18', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_sys_user_role_r` (`role_id`),
  CONSTRAINT `FK_sys_user_role_r` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `FK_sys_user_role_u` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (28, 1);
INSERT INTO `sys_user_role` VALUES (30, 9);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
