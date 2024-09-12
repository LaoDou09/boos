/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : car_mall

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 06/09/2024 00:57:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` bigint(16) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'Admin', '3aa2da690173014b479a22ce8c21b8a8', '0a7894', 'http://www.mall.com/assets/img/avatar.png', 'admin@admin.com', '', 0, 1725440812, '127.0.0.1', 1491635035, 1725440812, '20d894eb-d2d7-4eb4-a64d-0b0d6d42ba13', 'normal');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 336 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(16) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES (1, '', 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则ID',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '拼音',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 0, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1491635035, 119, 'normal');
INSERT INTO `auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `auth_rule` VALUES (85, 'file', 66, 'user/user_level_dict', '等级字典', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'djzd', 'dengjizidian', 1725035994, 1725300580, 0, 'normal');
INSERT INTO `auth_rule` VALUES (86, 'file', 66, 'user/user_info', '会员信息', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'hyxx', 'huiyuanxinxi', 1725036925, 1725037628, 0, 'normal');
INSERT INTO `auth_rule` VALUES (87, 'file', 86, 'user/user_info/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725036925, 1725037247, 0, 'normal');
INSERT INTO `auth_rule` VALUES (88, 'file', 86, 'user/user_info/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725036925, 1725037247, 0, 'normal');
INSERT INTO `auth_rule` VALUES (89, 'file', 86, 'user/user_info/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725036925, 1725037247, 0, 'normal');
INSERT INTO `auth_rule` VALUES (90, 'file', 86, 'user/user_info/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725036925, 1725037247, 0, 'normal');
INSERT INTO `auth_rule` VALUES (91, 'file', 86, 'user/user_info/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725036925, 1725037247, 0, 'normal');
INSERT INTO `auth_rule` VALUES (92, 'file', 66, 'user/user_bank', '用户银行卡', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'yhyhk', 'yonghuyinhangka', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (93, 'file', 92, 'user/user_bank/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (94, 'file', 92, 'user/user_bank/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (95, 'file', 92, 'user/user_bank/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (96, 'file', 92, 'user/user_bank/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (97, 'file', 92, 'user/user_bank/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037787, 1725037787, 0, 'normal');
INSERT INTO `auth_rule` VALUES (98, 'file', 66, 'user/user_address', '用户地址', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'yhdz', 'yonghudizhi', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (99, 'file', 98, 'user/user_address/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (100, 'file', 98, 'user/user_address/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (101, 'file', 98, 'user/user_address/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (102, 'file', 98, 'user/user_address/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (103, 'file', 98, 'user/user_address/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037803, 1725037803, 0, 'normal');
INSERT INTO `auth_rule` VALUES (104, 'file', 66, 'user/user_team', '用户团队', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'yhtd', 'yonghutuandui', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (105, 'file', 104, 'user/user_team/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (106, 'file', 104, 'user/user_team/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (107, 'file', 104, 'user/user_team/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (108, 'file', 104, 'user/user_team/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (109, 'file', 104, 'user/user_team/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037819, 1725037819, 0, 'normal');
INSERT INTO `auth_rule` VALUES (116, 'file', 66, 'user/user_level_system', '会员体系', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hytx', 'huiyuantixi', 1725037906, 1725037906, 0, 'normal');
INSERT INTO `auth_rule` VALUES (117, 'file', 116, 'user/user_level_system/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037906, 1725253873, 0, 'normal');
INSERT INTO `auth_rule` VALUES (118, 'file', 116, 'user/user_level_system/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037906, 1725253873, 0, 'normal');
INSERT INTO `auth_rule` VALUES (119, 'file', 116, 'user/user_level_system/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037906, 1725253873, 0, 'normal');
INSERT INTO `auth_rule` VALUES (120, 'file', 116, 'user/user_level_system/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037906, 1725253873, 0, 'normal');
INSERT INTO `auth_rule` VALUES (121, 'file', 116, 'user/user_level_system/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037906, 1725253873, 0, 'normal');
INSERT INTO `auth_rule` VALUES (122, 'file', 0, 'finance', '财务管理', 'fa fa-list', '', '', '', 1, 'addtabs', '', 'cwgl', 'caiwuguanli', 1725037958, 1725038872, 0, 'normal');
INSERT INTO `auth_rule` VALUES (123, 'file', 122, 'finance/finance_balance', '账户余额', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'zhye', 'zhanghuyue', 1725037958, 1725038902, 0, 'normal');
INSERT INTO `auth_rule` VALUES (124, 'file', 123, 'finance/finance_balance/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037958, 1725037958, 0, 'normal');
INSERT INTO `auth_rule` VALUES (125, 'file', 123, 'finance/finance_balance/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037958, 1725037958, 0, 'normal');
INSERT INTO `auth_rule` VALUES (126, 'file', 123, 'finance/finance_balance/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037958, 1725037958, 0, 'normal');
INSERT INTO `auth_rule` VALUES (127, 'file', 123, 'finance/finance_balance/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037958, 1725037958, 0, 'normal');
INSERT INTO `auth_rule` VALUES (128, 'file', 123, 'finance/finance_balance/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037958, 1725037958, 0, 'normal');
INSERT INTO `auth_rule` VALUES (129, 'file', 122, 'finance/finance_book_order', '记账凭证', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'jzpz', 'jizhangpingzheng', 1725037984, 1725038915, 0, 'normal');
INSERT INTO `auth_rule` VALUES (130, 'file', 129, 'finance/finance_book_order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725037984, 1725115674, 0, 'normal');
INSERT INTO `auth_rule` VALUES (131, 'file', 129, 'finance/finance_book_order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725037984, 1725115674, 0, 'normal');
INSERT INTO `auth_rule` VALUES (132, 'file', 129, 'finance/finance_book_order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725037984, 1725115674, 0, 'normal');
INSERT INTO `auth_rule` VALUES (133, 'file', 129, 'finance/finance_book_order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725037984, 1725115674, 0, 'normal');
INSERT INTO `auth_rule` VALUES (134, 'file', 129, 'finance/finance_book_order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725037984, 1725115674, 0, 'normal');
INSERT INTO `auth_rule` VALUES (135, 'file', 122, 'finance/finance_book_order_history', '历史记账', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'lsjz', 'lishijizhang', 1725038001, 1725038955, 0, 'normal');
INSERT INTO `auth_rule` VALUES (136, 'file', 135, 'finance/finance_book_order_history/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038001, 1725115696, 0, 'normal');
INSERT INTO `auth_rule` VALUES (137, 'file', 135, 'finance/finance_book_order_history/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038001, 1725115696, 0, 'normal');
INSERT INTO `auth_rule` VALUES (138, 'file', 135, 'finance/finance_book_order_history/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038001, 1725115696, 0, 'normal');
INSERT INTO `auth_rule` VALUES (139, 'file', 135, 'finance/finance_book_order_history/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038001, 1725115696, 0, 'normal');
INSERT INTO `auth_rule` VALUES (140, 'file', 135, 'finance/finance_book_order_history/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038001, 1725115696, 0, 'normal');
INSERT INTO `auth_rule` VALUES (141, 'file', 122, 'finance/finance_book_template', '记账模版', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'jzmb', 'jizhangmoban', 1725038069, 1725038981, 0, 'normal');
INSERT INTO `auth_rule` VALUES (142, 'file', 141, 'finance/finance_book_template/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038069, 1725038069, 0, 'normal');
INSERT INTO `auth_rule` VALUES (143, 'file', 141, 'finance/finance_book_template/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038069, 1725038069, 0, 'normal');
INSERT INTO `auth_rule` VALUES (144, 'file', 141, 'finance/finance_book_template/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038069, 1725038069, 0, 'normal');
INSERT INTO `auth_rule` VALUES (145, 'file', 141, 'finance/finance_book_template/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038069, 1725038069, 0, 'normal');
INSERT INTO `auth_rule` VALUES (146, 'file', 141, 'finance/finance_book_template/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038069, 1725038069, 0, 'normal');
INSERT INTO `auth_rule` VALUES (147, 'file', 122, 'finance/finance_cash_policy', '收银策略', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'sycl', 'shouyincelue', 1725038105, 1725039007, 0, 'normal');
INSERT INTO `auth_rule` VALUES (148, 'file', 147, 'finance/finance_cash_policy/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038105, 1725038105, 0, 'normal');
INSERT INTO `auth_rule` VALUES (149, 'file', 147, 'finance/finance_cash_policy/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038105, 1725038105, 0, 'normal');
INSERT INTO `auth_rule` VALUES (150, 'file', 147, 'finance/finance_cash_policy/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038105, 1725038105, 0, 'normal');
INSERT INTO `auth_rule` VALUES (151, 'file', 147, 'finance/finance_cash_policy/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038105, 1725038105, 0, 'normal');
INSERT INTO `auth_rule` VALUES (152, 'file', 147, 'finance/finance_cash_policy/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038105, 1725038105, 0, 'normal');
INSERT INTO `auth_rule` VALUES (153, 'file', 122, 'finance/finance_cash_order', '收银流水', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'syls', 'shouyinliushui', 1725038123, 1725039016, 0, 'normal');
INSERT INTO `auth_rule` VALUES (154, 'file', 153, 'finance/finance_cash_order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038123, 1725038123, 0, 'normal');
INSERT INTO `auth_rule` VALUES (155, 'file', 153, 'finance/finance_cash_order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038123, 1725038123, 0, 'normal');
INSERT INTO `auth_rule` VALUES (156, 'file', 153, 'finance/finance_cash_order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038123, 1725038123, 0, 'normal');
INSERT INTO `auth_rule` VALUES (157, 'file', 153, 'finance/finance_cash_order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038123, 1725038123, 0, 'normal');
INSERT INTO `auth_rule` VALUES (158, 'file', 153, 'finance/finance_cash_order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038123, 1725038123, 0, 'normal');
INSERT INTO `auth_rule` VALUES (159, 'file', 122, 'finance/finance_cash_order_history', '收银历史', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'syls', 'shouyinlishi', 1725038139, 1725039026, 0, 'normal');
INSERT INTO `auth_rule` VALUES (160, 'file', 159, 'finance/finance_cash_order_history/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038139, 1725038139, 0, 'normal');
INSERT INTO `auth_rule` VALUES (161, 'file', 159, 'finance/finance_cash_order_history/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038139, 1725038139, 0, 'normal');
INSERT INTO `auth_rule` VALUES (162, 'file', 159, 'finance/finance_cash_order_history/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038139, 1725038139, 0, 'normal');
INSERT INTO `auth_rule` VALUES (163, 'file', 159, 'finance/finance_cash_order_history/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038139, 1725038139, 0, 'normal');
INSERT INTO `auth_rule` VALUES (164, 'file', 159, 'finance/finance_cash_order_history/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038139, 1725038139, 0, 'normal');
INSERT INTO `auth_rule` VALUES (165, 'file', 122, 'finance/finance_cash_request', '收银申请', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'sysq', 'shouyinshenqing', 1725038162, 1725039145, 0, 'normal');
INSERT INTO `auth_rule` VALUES (166, 'file', 165, 'finance/finance_cash_request/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038162, 1725038162, 0, 'normal');
INSERT INTO `auth_rule` VALUES (167, 'file', 165, 'finance/finance_cash_request/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038162, 1725038162, 0, 'normal');
INSERT INTO `auth_rule` VALUES (168, 'file', 165, 'finance/finance_cash_request/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038162, 1725038162, 0, 'normal');
INSERT INTO `auth_rule` VALUES (169, 'file', 165, 'finance/finance_cash_request/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038162, 1725038162, 0, 'normal');
INSERT INTO `auth_rule` VALUES (170, 'file', 165, 'finance/finance_cash_request/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038162, 1725038162, 0, 'normal');
INSERT INTO `auth_rule` VALUES (171, 'file', 122, 'finance/finance_book_policy', '记账策略', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'jzcl', 'jizhangcelue', 1725038193, 1725039040, 0, 'normal');
INSERT INTO `auth_rule` VALUES (172, 'file', 171, 'finance/finance_book_policy/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725038193, 1725038193, 0, 'normal');
INSERT INTO `auth_rule` VALUES (173, 'file', 171, 'finance/finance_book_policy/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725038193, 1725038193, 0, 'normal');
INSERT INTO `auth_rule` VALUES (174, 'file', 171, 'finance/finance_book_policy/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725038193, 1725038193, 0, 'normal');
INSERT INTO `auth_rule` VALUES (175, 'file', 171, 'finance/finance_book_policy/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725038193, 1725038193, 0, 'normal');
INSERT INTO `auth_rule` VALUES (176, 'file', 171, 'finance/finance_book_policy/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725038193, 1725038193, 0, 'normal');
INSERT INTO `auth_rule` VALUES (177, 'file', 122, 'finance/finance_risk_template', '风控模板', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'fkmb', 'fengkongmuban', 1725040209, 1725040209, 0, 'normal');
INSERT INTO `auth_rule` VALUES (178, 'file', 177, 'finance/finance_risk_template/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725040209, 1725262207, 0, 'normal');
INSERT INTO `auth_rule` VALUES (179, 'file', 177, 'finance/finance_risk_template/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725040209, 1725262207, 0, 'normal');
INSERT INTO `auth_rule` VALUES (180, 'file', 177, 'finance/finance_risk_template/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725040209, 1725262207, 0, 'normal');
INSERT INTO `auth_rule` VALUES (181, 'file', 177, 'finance/finance_risk_template/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725040209, 1725262207, 0, 'normal');
INSERT INTO `auth_rule` VALUES (182, 'file', 177, 'finance/finance_risk_template/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725040209, 1725262207, 0, 'normal');
INSERT INTO `auth_rule` VALUES (183, 'file', 66, 'user/user_level_sale_order', '升级流水', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'sjls', 'shengjiliushui', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (184, 'file', 183, 'user/user_level_sale_order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (185, 'file', 183, 'user/user_level_sale_order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (186, 'file', 183, 'user/user_level_sale_order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (187, 'file', 183, 'user/user_level_sale_order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (188, 'file', 183, 'user/user_level_sale_order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725132807, 1725132807, 0, 'normal');
INSERT INTO `auth_rule` VALUES (189, 'file', 66, 'user/user_release_coupon', '打车卷释放', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'dcjsf', 'dachejuanshifang', 1725297320, 1725297320, 0, 'normal');
INSERT INTO `auth_rule` VALUES (190, 'file', 189, 'user/user_release_coupon/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725297320, 1725441219, 0, 'normal');
INSERT INTO `auth_rule` VALUES (191, 'file', 189, 'user/user_release_coupon/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725297320, 1725441219, 0, 'normal');
INSERT INTO `auth_rule` VALUES (192, 'file', 189, 'user/user_release_coupon/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725297320, 1725441219, 0, 'normal');
INSERT INTO `auth_rule` VALUES (193, 'file', 189, 'user/user_release_coupon/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725297320, 1725441219, 0, 'normal');
INSERT INTO `auth_rule` VALUES (194, 'file', 189, 'user/user_release_coupon/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725297320, 1725441219, 0, 'normal');
INSERT INTO `auth_rule` VALUES (195, 'file', 85, 'user/user_level_dict/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725300365, 1725300365, 0, 'normal');
INSERT INTO `auth_rule` VALUES (196, 'file', 85, 'user/user_level_dict/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725300365, 1725300365, 0, 'normal');
INSERT INTO `auth_rule` VALUES (197, 'file', 85, 'user/user_level_dict/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725300365, 1725300365, 0, 'normal');
INSERT INTO `auth_rule` VALUES (198, 'file', 85, 'user/user_level_dict/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725300365, 1725300365, 0, 'normal');
INSERT INTO `auth_rule` VALUES (199, 'file', 85, 'user/user_level_dict/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725300365, 1725300365, 0, 'normal');
INSERT INTO `auth_rule` VALUES (206, 'file', 2, 'general/crontab', '定时任务', 'fa fa-tasks', '', '', '按照设定的时间进行任务的执行,目前支持三种任务:请求URL、执行SQL、执行Shell。', 1, NULL, '', 'dsrw', 'dingshirenwu', 1725443806, 1725443806, 0, 'normal');
INSERT INTO `auth_rule` VALUES (207, 'file', 206, 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1725443806, 1725443806, 0, 'normal');
INSERT INTO `auth_rule` VALUES (208, 'file', 206, 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1725443806, 1725443806, 0, 'normal');
INSERT INTO `auth_rule` VALUES (209, 'file', 206, 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1725443806, 1725443806, 0, 'normal');
INSERT INTO `auth_rule` VALUES (210, 'file', 206, 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1725443806, 1725443806, 0, 'normal');
INSERT INTO `auth_rule` VALUES (211, 'file', 206, 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1725443806, 1725443806, 0, 'normal');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal');
INSERT INTO `category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal');
INSERT INTO `category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal');
INSERT INTO `category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal');
INSERT INTO `category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal');
INSERT INTO `category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal');
INSERT INTO `category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal');
INSERT INTO `category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal');
INSERT INTO `category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal');
INSERT INTO `category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal');
INSERT INTO `category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal');
INSERT INTO `category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal');
INSERT INTO `category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '可见条件',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', 'BOSS', '', 'required', '', NULL);
INSERT INTO `config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', NULL);
INSERT INTO `config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.8', '', 'required', '', NULL);
INSERT INTO `config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', NULL);
INSERT INTO `config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', NULL);
INSERT INTO `config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', NULL);
INSERT INTO `config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', NULL);
INSERT INTO `config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"默认\",\"page\":\"单页\",\"article\":\"文章\",\"test\":\"Test\"}', '', '', '', NULL);
INSERT INTO `config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\",\"finance\":\"财务字典\",\"trade_type\":\"交易类型\"}', '', '', '', NULL);
INSERT INTO `config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '', '', '', '', '');
INSERT INTO `config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'password', '', '', '', '', '', '');
INSERT INTO `config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '', '', '', '', '');
INSERT INTO `config` VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"分类一\",\"category2\":\"分类二\",\"custom\":\"自定义\"}', '', '', '', NULL);
INSERT INTO `config` VALUES (24, 'finance_cash_status', 'finance', '收银状态', '', 'array', '', '{\"begin\":\"10\",\"sucess\":\"00\",\"failed\":\"99\"}', '{\"value1\":\"title1\",\"value2\":\"title2\"}', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"状态\",\"value\":\"值\"}');
INSERT INTO `config` VALUES (25, 'finance_book_direction', 'finance', '记账方向', '', 'array', '', '{\"debit\":\"10\",\"credit\":\"20\"}', '{\"value1\":\"title1\",\"value2\":\"title2\"}', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"状态\",\"value\":\"值\"}');
INSERT INTO `config` VALUES (26, 'buy_level', 'trade_type', '购买会员', '', 'string', '', 'K9001', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `config` VALUES (27, 'top_up_10', 'trade_type', '余额充值', '', 'string', '', 'K1001', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `config` VALUES (28, 'top_up_20', 'trade_type', '绿色积分充值', '', 'string', '', 'K1002', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `config` VALUES (29, 'release_coupon', 'trade_type', '如e卷释放', '', 'string', '', 'K8001', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `config` VALUES (30, 'transfer_20', 'trade_type', '绿色积分转账', '', 'string', '', 'K2002', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');

-- ----------------------------
-- Table structure for crontab
-- ----------------------------
DROP TABLE IF EXISTS `crontab`;
CREATE TABLE `crontab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '延迟秒数执行',
  `maximums` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大执行次数 0为不限',
  `executes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已经执行的次数',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `begintime` bigint(16) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(16) NULL DEFAULT NULL COMMENT '结束时间',
  `executetime` bigint(16) NULL DEFAULT NULL COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crontab
-- ----------------------------
INSERT INTO `crontab` VALUES (1, 'url', '请求百度', 'https://www.baidu.com', '* * * * *', 0, 0, 1, 1497070825, 1725445089, 1483200000, 1830268800, 1725444873, 1, 'hidden');
INSERT INTO `crontab` VALUES (2, 'sql', '查询一条SQL', 'SELECT 1;', '* * * * *', 0, 0, 1, 1497071095, 1725445079, 1483200000, 1830268800, 1725444873, 2, 'hidden');
INSERT INTO `crontab` VALUES (3, 'shell', '执行积分释放', 'php think ReleaseCoupon', '0 1 * * *', 0, 0, 5, 1725444773, 1725452749, 1725444764, 1726913569, 1725451311, 3, 'normal');
INSERT INTO `crontab` VALUES (4, 'url', '0 1 * * * (每天1点执行)', '0 1 * * * ', '* * * * *', 0, 0, 0, 1725445350, 1725445350, 1725445347, 1725445350, NULL, 4, 'hidden');

-- ----------------------------
-- Table structure for crontab_log
-- ----------------------------
DROP TABLE IF EXISTS `crontab_log`;
CREATE TABLE `crontab_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crontab_id` int(10) NULL DEFAULT NULL COMMENT '任务ID',
  `executetime` bigint(16) NULL DEFAULT NULL COMMENT '执行时间',
  `completetime` bigint(16) NULL DEFAULT NULL COMMENT '结束时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行结果',
  `processid` int(10) NULL DEFAULT 0 COMMENT '进程ID',
  `status` enum('success','failure','inprogress') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'failure' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crontab_id`(`crontab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crontab_log
-- ----------------------------
INSERT INTO `crontab_log` VALUES (1, 3, 1725444873, 1725444873, 'hererReleaseCoupon Successed!\n', 5052, 'success');
INSERT INTO `crontab_log` VALUES (2, 2, 1725444874, 1725444874, '\nSQL:SELECT 1;\nTotal:1\n\nRow:1\n1：1\n', 5052, 'success');
INSERT INTO `crontab_log` VALUES (3, 1, 1725444874, 1725444874, '<html>\r\n<head>\r\n<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\r\n<style data-for=\"result\" id=\"css_result\">\r\nbody{color:#333;background:#fff;padding:6px 0 0;margin:0;position:relative;min-width:900px}body,th,td,.p1,.p2{font-family:arial}p,form,ol,ul,li,dl,dt,dd,h3{margin:0;padding:0;list-style:none}input{padding-top:0;padding-bottom:0;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}table,img{border:0}td{font-size:9pt;line-height:18px}\r\n\r\n\r\n\r\n#foot{font-size:12px}.logo{width:117px;height:38px;cursor:pointer}\r\n\r\n#u,#head,#tool,#search,.p1{line-height:120%;margin-left:-12pt}.p2{width:100%;line-height:120%;margin-left:-12pt}#wrapper{_zoom:1}#container{word-break:break-all;word-wrap:break-word}.container_s{width:1002px}.container_l{width:1222px}#content_left{width:636px;float:left;padding-left:35px}#content_right{border-left:1px solid #e1e1e1;float:right}.container_s #content_right{width:271px}.container_l #content_right{width:434px}.content_none{padding-left:35px}#u{color:#999;white-space:nowrap;position:absolute;right:10px;top:4px;z-index:299}#u a{color:#00c;margin:0 5px}#u .reg{margin:0}#u .last{margin-right:0}#u .un{font-weight:bold;margin-right:5px}#u ul{width:100%;background:#fff;border:1px solid #9b9b9b}#u li{height:25px}#u li a{width:100%;height:25px;line-height:25px;display:block;text-align:left;text-decoration:none;text-indent:6px;margin:0;filter:none\\9}#u li a:hover{background:#ebebeb}#u li.nl{border-top:1px solid #ebebeb}#user{position:relative;display:inline-block}#user_center{position:relative;display:inline-block}#user_center .user_center_btn{margin-right:5px}.userMenu{width:64px;position:absolute;right:7px;_right:2px;top:15px;top:14px\\9;*top:15px;padding-top:4px;display:none;*background:#fff}#head{padding-left:35px;margin-bottom:20px;width:900px}\r\n\r\n.fm{clear:both;position:relative;z-index:297}.nv a,.nv b,.btn,#page,#more{font-size:14px}\r\n\r\n.s_nav{height:45px}.s_nav .s_logo{margin-right:20px;float:left}.s_nav .s_logo img{border:0;display:block}.s_tab{line-height:18px;padding:20px 0 0;float:left}.s_nav a{color:#00c;font-size:14px}.s_nav b{font-size:14px}.s_ipt_wr{width:536px;height:30px;display:inline-block;margin-right:5px;background-position:0 -96px;border:1px solid #b6b6b6;border-color:#7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;vertical-align:top}.s_ipt{width:523px;height:22px;font:16px/22px arial;margin:5px 0 0 7px;padding:0;background:#fff;border:0;outline:0;-webkit-appearance:none}.s_btn{width:95px;height:32px;padding-top:2px\\9;font-size:14px;padding:0;background-color:#ddd;background-position:0 -48px;border:0;cursor:pointer}.s_btn_h{background-position:-240px -48px}.s_btn_wr{width:97px;height:34px;display:inline-block;background-position:-120px -48px;*position:relative;z-index:0;vertical-align:top}.sethf{padding:0;margin:0;font-size:14px}.set_h{display:none;behavior:url(#default#homepage)}.set_f{display:none}.shouji{margin-left:19px}.shouji a{text-decoration:none}.bdsug{position:absolute;width:536px;background:#fff;display:none;border:1px solid #817f82}\r\n\r\n\r\n#page{font:14px arial;white-space:nowrap;padding-left:35px}#page a,#page strong{display:inline-block;vertical-align:text-bottom;height:66px;text-align:center;line-height:34px;text-decoration:none;overflow:hidden;margin-right:9px;background:white}#page a{cursor:pointer}#page a:hover{background:0}#page .n:hover,#page a:hover .pc{background:#f2f8ff;border:1px solid #38f}#page .n{height:34px;padding:0 18px;border:1px solid #e1e2e3}#page span{display:block}#page .pc{width:34px;height:34px;border:1px solid #e1e2e3;cursor:pointer}#page .fk{width:24px;height:24px;margin-bottom:6px;margin-left:6px;cursor:pointer}#page strong .fk,#page strong .pc{cursor:auto}#page .fk .c-icon-bear-pn{top:-3px;position:relative}#page .fkd .c-icon-bear-pn{top:3px;position:relative}#page .fk_cur .c-icon-bear-p{top:-2px;position:relative}#page strong .pc{border:0;width:36px;height:36px;line-height:36px}#page .nums{display:inline-block;vertical-align:text-bottom;height:36px;line-height:36px;margin-left:10px}#rs{width:900px;background:#fff;padding:8px 0;margin:20px 0 0 15px}#rs td{width:5%}#rs th{font-size:14px;font-weight:normal;line-height:19px;white-space:nowrap;text-align:left;vertical-align:top}#rs .tt{font-weight:bold;padding:0 10px 0 20px}#rs_top{font-size:14px;margin-bottom:22px}#rs_top a{margin-right:18px}#search{width:900px;padding:35px 0 16px 35px}#search .s_help{position:relative;top:10px}\r\n\r\n#foot{height:20px;line-height:20px;color:#77c;background:#e6e6e6;text-align:center}#foot span{color:#666}\r\n\r\n.to_zhidao,.to_tieba,.to_zhidao_bottom{font-size:16px;line-height:24px;margin:20px 0 0 35px}.to_tieba .c-icon-tieba{float:left}.f{line-height:115%;*line-height:120%;font-size:100%;width:33.7em;word-break:break-all;word-wrap:break-word}.h{margin-left:8px;width:100%}.r{word-break:break-all;cursor:hand;width:238px}.t{font-weight:normal;font-size:medium;margin-bottom:1px}.pl{padding-left:3px;height:8px;padding-right:2px;font-size:14px}.mo,a.mo:link,a.mo:visited{color:#666;font-size:100%;line-height:10px}.htb{margin-bottom:5px}.jc a{color:#c00}a font[size=\"3\"] font,font[size=\"3\"] a font{text-decoration:underline}div.blog,div.bbs{color:#707070;padding-top:2px;font-size:13px}.result{width:33.7em;table-layout:fixed}.result-op .f{word-wrap:normal}.nums{font-size:12px;color:#999}.tools{position:absolute;top:10px;white-space:nowrap}\r\n\r\n#mHolder{width:62px;position:relative;z-index:296;top:-18px;margin-left:9px;margin-right:-12px;display:none}#mCon{height:18px;position:absolute;top:3px;top:6px\\9;cursor:pointer;line-height:18px}.wrapper_l #mCon{right:7px}#mCon span{color:#00c;cursor:default;display:block}#mCon .hw{text-decoration:underline;cursor:pointer;display:inline-block}#mCon .pinyin{display:inline-block}#mCon .c-icon-chevron-unfold2{margin-left:5px}#mMenu{width:56px;border:1px solid #9b9b9b;position:absolute;right:7px;top:23px;display:none;background:#fff}#mMenu a{width:100%;height:100%;color:#00c;display:block;line-height:22px;text-indent:6px;text-decoration:none;filter:none\\9}#mMenu a:hover{background:#ebebeb}#mMenu .ln{height:1px;background:#ebebeb;overflow:hidden;font-size:1px;line-height:1px;margin-top:-1px}\r\n\r\n\r\n#index_guide{display:none}#index_logo{display:none}#u1{display:none}.s_ipt_wr{height:32px}body{padding:0}.s_form:after,.s_tab:after{content:\".\";display:block;height:0;clear:both;visibility:hidden}.s_form{zoom:1;height:63px;padding:0 0 0 10px}\r\n\r\n#result_logo{float:left;margin:11px 6px 0 6px}#result_logo img{width:104px}\r\n\r\n#head{padding:0;margin:0;width:100%;position:absolute;z-index:301;min-width:1000px;background:#fff;border-bottom:1px solid #ebebeb;position:fixed;_position:absolute}#head .head_wrapper{_width:1000px}#head.s_down{box-shadow:0 0 5px #888}.fm{clear:none;float:left;margin:15px 0 0 12px}#s_tab{background:#f8f8f8;line-height:36px;height:38px;padding:63px 0 0 138px;float:none;zoom:1}#s_tab a,#s_tab b{width:54px;display:inline-block;text-decoration:none;text-align:center;color:#666;font-size:14px}#s_tab b{border-bottom:2px solid #38f;font-weight:bold;color:#323232}#s_tab a:hover{color:#323232}#content_left{width:540px;padding-left:138px;padding-top:5px}#content_right{margin-top:45px}\r\n#page{padding:0 0 0 138px;margin:30px 0 40px 0}\r\n\r\n\r\n#help{background:#f5f6f5;zoom:1;padding:0 0 0 50px;float:right}#help a{color:#777;padding:0 15px;text-decoration:none}#help a:hover{color:#333}\r\n\r\n#foot{background:#f5f6f5;border-top:1px solid #ebebeb;text-align:left;height:42px;line-height:42px}#foot .foot_c{float:left;padding:0 0 0 138px}.content_none{padding:30px 0 0 138px}\r\n\r\n#mCon{top:5px}\r\n\r\n.s_ipt_wr.bg,.s_btn_wr.bg,#su.bg{background-image:none}.s_btn_wr{width:auto;height:auto;border-bottom:1px solid transparent;*border-bottom:0}.s_btn{width:100px;height:34px;color:white;letter-spacing:1px;background:#3385ff;border-bottom:1px solid #2d78f4;outline:medium;*border-bottom:0;-webkit-appearance:none;-webkit-border-radius:0}.s_btn.btnhover{background:#317ef3;border-bottom:1px solid #2868c8;*border-bottom:0;box-shadow:1px 1px 1px #ccc}\r\n\r\n.s_btn_h{background:#3075dc;box-shadow:inset 1px 1px 3px #2964bb;-webkit-box-shadow:inset 1px 1px 3px #2964bb;-moz-box-shadow:inset 1px 1px 3px #2964bb;-o-box-shadow:inset 1px 1px 3px #2964bb}#head .bdsug{top:33px}.bdsug{width:538px;border-color:#ccc;box-shadow:1px 1px 3px #ededed;-webkit-box-shadow:1px 1px 3px #ededed;-moz-box-shadow:1px 1px 3px #ededed;-o-box-shadow:1px 1px 3px #ededed}\r\n\r\n.bdsug.bdsugbg{background-repeat:no-repeat;background-position:100% 100%;background-size:100px 110px;background-image:url(http://s1.bdstatic.com/r/www/cache/static/home/img/sugbg_6a9201c2.png);background-image:url(http://s1.bdstatic.com/r/www/cache/static/home/img/sugbg_d24a0811.gif)\\9}.bdsug li{width:522px;line-height:22px}.bdsug li.bdsug-s{background:#f0f0f0}.bdsug-ala h3{margin:8px 0 5px 0}#wrapper_wrapper .container_l .EC_ppim_top,#wrapper_wrapper .container_xl .EC_ppim_top{width:640px}#wrapper_wrapper .container_s .EC_ppim_top{width:570px}#head .c-icon-bear-round{display:none}.container_l #content_right{width:384px}.container_l{width:1212px}.container_xl #content_right{width:384px}.container_xl{width:1257px}.index_tab_top{display:none}.index_tab_bottom{display:none}#lg{display:none}#m{display:none}#ftCon{display:none}#ent_sug{margin:40px 0 0 145px;font-size:13px;color:#666}.c-icon{background:url(http://s1.bdstatic.com/r/www/cache/static/global/img/icons_3bfb8e45.png) no-repeat 0 0;_background-image:url(\"http://s1.bdstatic.com/r/www/cache/static/global/img/icons_f72fb1cc.gif\")}\r\n\r\n\r\n\r\n</style>\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\r\n<title>页面不存在_百度搜索</title>\r\n\r\n<style data-for=\"debug\">\r\n	#debug{display:none!important}\r\n</style>\r\n\r\n<style data-for=\"result\" id=\"css_index_result\">\r\n#seth{display:none;behavior:url(#default#homepage)}#setf{display:none}#sekj{margin-left:14px}#st,#sekj{display:none}.s_ipt_wr{border:1px solid #b6b6b6;border-color:#7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;background:#fff;display:inline-block;vertical-align:top;width:539px;margin-right:0;border-right-width:0;border-color:#b8b8b8 transparent #ccc #b8b8b8}/*.wrapper_s .s_ipt_wr{width:439px}*//*.wrapper_s .s_ipt{width:434px}*/.s_ipt_wr:hover,.s_ipt_wr.ipthover{border-color:#999 transparent #b3b3b3 #999}.s_ipt_wr.iptfocus{border-color:#4791ff transparent #4791ff #4791ff}.s_ipt_tip{color:#aaa;position:absolute}.s_ipt{width:526px;height:22px;font:16px/22px arial;margin:6px 0 0 7px;padding:0;background:transparent;border:0;outline:0;-webkit-appearance:none}#kw{position:relative}.bdpfmenu,.usermenu{border:1px solid #d1d1d1;position:absolute;width:105px;top:36px;padding:1px 0;z-index:302;overflow:hidden;box-shadow:1px 1px 5px #d1d1d1;-webkit-box-shadow:1px 1px 5px #d1d1d1;-moz-box-shadow:1px 1px 5px #d1d1d1;-o-box-shadow:1px 1px 5px #d1d1d1}\r\n.bdpfmenu{font-size:12px}.bdpfmenu a,.usermenu a{display:block;text-align:left;margin:0!important;padding:0 9px;line-height:26px;text-decoration:none}\r\n\r\n#u .bri:hover,#u .bri.brihover{background-position:-18px 3px}#mCon #imeSIcon{background-position:-408px -144px;margin-left:0}#mCon span{color:#333}.bdpfmenu a:link,.bdpfmenu a:visited,#u .usermenu a:link,#u .usermenu a:visited{background:white;color:#333}.bdpfmenu a:hover,.bdpfmenu a:active,#u .usermenu a:hover,#u .usermenu a:active{background:#38f;text-decoration:none;color:white}.bdpfmenu{width:70px}.usermenu{width:68px;right:8px}#wrapper .bdnuarrow{width:24px;height:13px;position:absolute;z-index:303;top:24px;background:url(http://s1.bdstatic.com/r/www/cache/static/home/img/sugbg_6a9201c2.png) no-repeat -90px -1px;background-size:300px 21px;background-image:url(http://s1.bdstatic.com/r/www/cache/static/home/img/icons_0a1fc6ac.gif)\\9}#prefpanel{background:#fafafa;display:none;opacity:0;position:fixed;_position:absolute;top:-359px;z-index:500;width:100%;min-width:960px;height:359px;border-bottom:1px solid #ebebeb}#prefpanel form{_width:850px}#kw_tip{cursor:default;display:none}#bds-message-wrapper{top:43px}\r\n\r\ninput::-ms-clear{display:none}\r\n</style>\r\n\r\n</head>\r\n\r\n<body link=\"#0000cc\">\r\n<div id=\"wrapper\" style=\"\" class=\"wrapper_s\">\r\n\r\n <div id=\"head\"> <div class=\"head_wrapper\"> <div class=\"s_form\"> <div class=\"s_form_wrapper\"> <div id=\"lg\"> <img hidefocus=\"true\" src=\"//www.baidu.com/img/bd_logo1.png\" width=\"270\" height=\"129\"> </div> <a href=\"/\" id=\"result_logo\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'logo\'})\"> <img src=\"//www.baidu.com/img/baidu_jgylogo3.gif\" alt=\"到百度首页\" title=\"到百度首页\"> </a> <form id=\"form\" name=\"f\" action=\"/s\" class=\"fm\"> <input type=\"hidden\" name=\"ie\" value=\"utf-8\"> <input type=\"hidden\" name=\"f\" value=\"8\"> <input type=\"hidden\" name=\"rsv_bp\" value=\"1\"> <input type=\"hidden\" name=\"rsv_idx\" value=\"1\"> <input type=\"hidden\" name=\"ch\" value=\"\"> <input type=\"hidden\" name=\"tn\" value=\"baiduerr\"> <input type=\"hidden\" name=\"bar\" value=\"\"> <span class=\"bg s_ipt_wr\"> <input id=\"kw_tip\" unselectable=\"on\" onselectstart=\"return false;\" class=\"s_ipt s_ipt_tip\" disabled=\"\" autocomplete=\"off\" value=\"\" maxlength=\"100\" style=\"display: none;\"> <input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"100\" autocomplete=\"off\"> </span><span class=\"bg s_btn_wr\"> <input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\"> </span><span class=\"tools\"> <span id=\"mHolder\"> <div id=\"mCon\"> <span>输入法</span> </div> <ul id=\"mMenu\"> <li><a href=\"javascript:;\" name=\"ime_hw\">手写</a> </li> <li><a href=\"javascript:;\" name=\"ime_py\">拼音</a> </li> <li class=\"ln\"></li> <li><a href=\"javascript:;\" name=\"ime_cl\">关闭</a> </li> </ul> </span> <span class=\"shouji\" style=\"display: none;\"><a href=\"http://w.x.baidu.com/go/mini/8/10000020\" onmousedown=\"return ns_c({\'fm\':\'behs\',\'tab\':\'bdbrowser\'})\">百度浏览器，打开网页快2秒！</a> </span> </span> <input type=\"hidden\" name=\"rn\" value=\"\"> <input type=\"hidden\" name=\"rsv_enter\" value=\"1\"> </form> <div id=\"m\"></div> </div></div> </div></div> <div class=\"s_tab\" id=\"s_tab\"> <b>网页</b> <a href=\"http://news.baidu.com/ns?cl=2&amp;rn=20&amp;tn=news&amp;word=\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'news\'})\">新闻</a><a href=\"http://tieba.baidu.com/f?kw=&amp;fr=wwwt\" wdfield=\"kw\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'tieba\'})\">贴吧</a><a href=\"http://zhidao.baidu.com/q?ct=17&amp;pn=0&amp;tn=ikaslist&amp;rn=10&amp;word=&amp;fr=wwwt\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'zhidao\'})\">知道</a><a href=\"http://music.baidu.com/search?fr=ps&amp;key=\" wdfield=\"key\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'music\'})\">音乐</a><a href=\"http://image.baidu.com/i?tn=baiduimage&amp;ps=1&amp;ct=201326592&amp;lm=-1&amp;cl=2&amp;nc=1&amp;word=\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'pic\'})\">图片</a><a href=\"http://v.baidu.com/v?ct=301989888&amp;rn=20&amp;pn=0&amp;db=0&amp;s=25&amp;word=\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'video\'})\">视频</a><a href=\"http://map.baidu.com/m?word=&amp;fr=ps01000\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'map\'})\">地图</a><a href=\"http://wenku.baidu.com/search?word=&amp;lm=0&amp;od=0\" wdfield=\"word\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'wenku\'})\">文库</a><a href=\"//www.baidu.com/more/\" onmousedown=\"return c({\'fm\':\'tab\',\'tab\':\'more\'})\">更多»</a> </div>\r\n<div id=\"ftCon\"><div id=\"ftConw\"><p id=\"lh\"> <a id=\"seth\" onclick=\"h(this)\" href=\"/\" onmousedown=\"return ns_c({\'fm\':\'behs\',\'tab\':\'homepage\',\'pos\':0})\">把百度设为主页</a><a id=\"setf\" href=\"http://www.baidu.com/cache/sethelp/index.html\" onmousedown=\"return ns_c({\'fm\':\'behs\',\'tab\':\'favorites\',\'pos\':0})\" target=\"_blank\" style=\"display: inline;\">把百度设为主页</a><a onmousedown=\"return ns_c({\'fm\':\'behs\',\'tab\':\'tj_about\'})\" href=\"http://home.baidu.com\">关于百度</a><a onmousedown=\"return ns_c({\'fm\':\'behs\',\'tab\':\'tj_about_en\'})\" href=\"http://ir.baidu.com\">About Baidu</a> </p> <p id=\"cp\">©2014&nbsp;Baidu&nbsp;<a href=\"/duty/\" name=\"tj_duty\">使用百度前必读</a>&nbsp;京ICP证030173号&nbsp;<i class=\"c-icon-icrlogo\"></i> </p> </div> </div>\r\n<div id=\"wrapper_wrapper\" style=\"display: block;\">\r\n	<style>\r\n			.nors{\r\n				position: relative;\r\n			}\r\n			.norsTitle{\r\n				font-size: 22px;\r\n				font-family: Microsoft Yahei;\r\n				font-weight: normal;\r\n				color: #333;\r\n				margin: 35px 0 25px 0;\r\n			}\r\n			.norsSuggest {\r\n				display: inline-block;\r\n				color:#333;\r\n				font-family:arial;\r\n				font-size: 13px;\r\n				position: relative;\r\n			}\r\n\r\n			.norsSuggest li{\r\n				list-style: decimal;\r\n			}\r\n			.norsTitle2 {\r\n				font-family: arial;\r\n				font-size: 13px;\r\n				color: #666;	\r\n			}\r\n			.norsSuggest li{\r\n				margin: 13px 0;\r\n			}\r\n			.norsSuggest ol{\r\n				margin-left: 47px;\r\n			}\r\n			#foot{\r\n				position: fixed;\r\n				_position: absolute;\r\n				bottom: 0;\r\n				width: 100%;\r\n				clear: both;\r\n			}\r\n	</style>\r\n	<div id=\"content_left\">\r\n		<div class=\"nors\">\r\n			<div class=\"norsSuggest\">\r\n				<h3 class=\"norsTitle\">很抱歉，您要访问的页面不存在！</h3>\r\n				<p class=\"norsTitle2\">温馨提示：</p>\r\n				<ol>\r\n					<li>请检查您访问的网址是否正确</li> \r\n					<li>如果您不能确认访问的网址，请浏览<a href=\"http://www.baidu.com/more/index.html\">百度更多</a>页面查看更多网址。</li>\r\n					<li>回到顶部重新发起搜索</li>\r\n					<li>如有任何意见或建议，请及时<a href=\"http://qingting.baidu.com/index\">反馈给我们</a>。</li>\r\n					\r\n\r\n				</ol>\r\n			</div>\r\n		</div>\r\n	</div>\r\n\r\n<div id=\"foot\"><span class=\"foot_c\">©2015&nbsp;Baidu&nbsp;<span>此内容系百度根据您的指令自动搜索的结果，不代表百度赞成被搜索网站的内容或立场</span></span>\r\n<span id=\"help\"><a href=\"http://www.baidu.com/search/jubao.html\" target=\"_blank\">举报</a></span></div>\r\n\r\n<div class=\"c-tips-container\" id=\"c-tips-container\"></div></div></div><div class=\"c-tips-container\" id=\"c-tips-container\"></div>\r\n\r\n</body></html>', 5052, 'success');
INSERT INTO `crontab_log` VALUES (4, 3, 1725445098, 1725445098, 'hererReleaseCoupon Successed!\n', 10344, 'success');
INSERT INTO `crontab_log` VALUES (5, 3, 1725446166, 1725446166, '111\n2\n3\n4\n5\n6\n7\n8\n10\n11\n12\n111\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n111\n23\n24\n25\n26\n27\n28\n29\n30\n31\n33\n111\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n111\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n111\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n111\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n111\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n111\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n111\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n111\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n111\n114\n115\n116\n117\n118\n119\n120\n121\n122\n123\n111\n124\n125\n126\n127\n128\n129\n130\n131\n132\n133\n111\n134\n135\n136\n137\n138\n139\n140\n141\n142\n143\n111\n144\n145\n146\n147\n148\n149\n150\n151\n152\n153\n111\n154\n155\n156\n157\n158\n159\n160\n161\n162\n163\n111\n164\n165\n166\n167\n168\n169\n170\n171\n172\n173\n111\n174\n175\n176\n177\n178\n179\n180\n181\n182\n183\n111\n184\n185\n186\n187\n188\n189\n190\n191\n192\n193\n111\n194\n195\n196\n197\n198\n199\n200\n201\n202\n203\n111\n204\n205\n206\n207\n208\n209\n210\n211\n212\n213\n111\n214\n215\n216\n217\n218\n219\n220\n221\n222\n223\n111\n224\n225\n226\n227\n228\n229\n230\n231\n232\n233\n111\n234\n235\n236\n237\n238\n239\n240\n241\n242\n243\n111\n244\n245\n246\n247\n248\n249\n250\n251\n252\n253\n111\n254\n255\n256\n257\n258\n259\n260\n261\n262\n263\n111\n264\n265\n266\n267\nReleaseCoupon Successed!\n', 11184, 'success');
INSERT INTO `crontab_log` VALUES (6, 3, 1725446324, 1725446324, '111\n2\n3\n4\n5\n6\n7\n8\n10\n11\n12\n111\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n111\n23\n24\n25\n26\n27\n28\n29\n30\n31\n33\n111\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n111\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n111\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n111\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n111\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n111\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n111\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n111\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n111\n114\n115\n116\n117\n118\n119\n120\n121\n122\n123\n111\n124\n125\n126\n127\n128\n129\n130\n131\n132\n133\n111\n134\n135\n136\n137\n138\n139\n140\n141\n142\n143\n111\n144\n145\n146\n147\n148\n149\n150\n151\n152\n153\n111\n154\n155\n156\n157\n158\n159\n160\n161\n162\n163\n111\n164\n165\n166\n167\n168\n169\n170\n171\n172\n173\n111\n174\n175\n176\n177\n178\n179\n180\n181\n182\n183\n111\n184\n185\n186\n187\n188\n189\n190\n191\n192\n193\n111\n194\n195\n196\n197\n198\n199\n200\n201\n202\n203\n111\n204\n205\n206\n207\n208\n209\n210\n211\n212\n213\n111\n214\n215\n216\n217\n218\n219\n220\n221\n222\n223\n111\n224\n225\n226\n227\n228\n229\n230\n231\n232\n233\n111\n234\n235\n236\n237\n238\n239\n240\n241\n242\n243\n111\n244\n245\n246\n247\n248\n249\n250\n251\n252\n253\n111\n254\n255\n256\n257\n258\n259\n260\n261\n262\n263\n111\n264\n265\n266\n267\nReleaseCoupon Successed!\n', 5148, 'success');
INSERT INTO `crontab_log` VALUES (7, 3, 1725451311, 1725451311, '释放完成!\n', 10120, 'success');

-- ----------------------------
-- Table structure for ems
-- ----------------------------
DROP TABLE IF EXISTS `ems`;
CREATE TABLE `ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮箱验证码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ems
-- ----------------------------

-- ----------------------------
-- Table structure for fin_balance
-- ----------------------------
DROP TABLE IF EXISTS `fin_balance`;
CREATE TABLE `fin_balance`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `account_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '帐套id',
  `account_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `process_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账主体....',
  `balance` bigint(20) NULL DEFAULT 0 COMMENT '余额',
  `open_balance` bigint(20) NULL DEFAULT 0 COMMENT '期初余额',
  `occurred_amount` bigint(20) NULL DEFAULT 0 COMMENT '发生额',
  `direction` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方向:收入,支出...',
  `close_order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '记账流水',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id_idx`(`process_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户余额表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_balance
-- ----------------------------
INSERT INTO `fin_balance` VALUES ('1', '1', '10', '40', NULL, '100210', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-09-05 05:19:08');
INSERT INTO `fin_balance` VALUES ('1942874837512206593', '1', '20', '80', '13000000001', '1142889689825594113', 0, 0, 0, '0', '', '', '2024-09-05 07:30:58', '2024-09-05 09:17:13');
INSERT INTO `fin_balance` VALUES ('1942874837512321792', '1', '10', '80', '13000000001', '1142889689825594113', 0, 0, 0, '0', '', '', '2024-09-05 07:30:58', '2024-09-05 07:30:58');
INSERT INTO `fin_balance` VALUES ('1942874837717718784', '1', '30', '80', '13000000001', '1142889689825594113', 0, 0, 0, '0', '', '', '2024-09-05 07:30:58', '2024-09-05 07:30:58');
INSERT INTO `fin_balance` VALUES ('1942874837927488768', '1', '90', '80', '13000000001', '1142889689825594113', 0, 0, 0, '0', '', '', '2024-09-05 07:30:58', '2024-09-05 07:30:58');
INSERT INTO `fin_balance` VALUES ('1942874838036462080', '1', '91', '80', '13000000001', '1142889689825594113', 0, 0, 0, '0', '', '', '2024-09-05 07:30:58', '2024-09-05 07:30:58');
INSERT INTO `fin_balance` VALUES ('2', '1', '10', '40', NULL, '600110', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-08-31 05:02:14');
INSERT INTO `fin_balance` VALUES ('3', '1', '10', '40', NULL, '640110', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-08-31 05:02:14');
INSERT INTO `fin_balance` VALUES ('4', '1', '10', '40', NULL, '600120', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-09-05 08:50:19');
INSERT INTO `fin_balance` VALUES ('5', '1', '10', '40', NULL, '600130', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-08-31 05:02:14');
INSERT INTO `fin_balance` VALUES ('6', '1', '10', '40', NULL, '600190', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-09-05 05:19:08');
INSERT INTO `fin_balance` VALUES ('7', '1', '10', '40', NULL, '600191', 0, 0, 0, '0', '', '', '2024-08-31 05:02:14', '2024-08-31 05:02:14');

-- ----------------------------
-- Table structure for fin_book_order
-- ----------------------------
DROP TABLE IF EXISTS `fin_book_order`;
CREATE TABLE `fin_book_order`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `book_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `account_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账套号',
  `batch_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账批次ID',
  `batch_detail_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账批次明细ID',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `account_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `process_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账主体....',
  `debit_amount` bigint(20) NULL DEFAULT NULL COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT NULL COMMENT '贷方金额',
  `direction` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '借贷方向',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验签',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账状态10初始未更新 00 更新成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id`(`process_id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `idx_group`(`process_id`, `account_type`, `account_object`, `account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账凭证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_book_order
-- ----------------------------

-- ----------------------------
-- Table structure for fin_book_order_history
-- ----------------------------
DROP TABLE IF EXISTS `fin_book_order_history`;
CREATE TABLE `fin_book_order_history`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `book_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `account_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账套号',
  `batch_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账批次ID',
  `batch_detail_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账批次明细ID',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `account_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `process_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账主体....',
  `debit_amount` bigint(20) NULL DEFAULT NULL COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT NULL COMMENT '贷方金额',
  `direction` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '借贷方向',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验签',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账状态10初始未更新 00 更新成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id`(`process_id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `idx_group`(`process_id`, `account_type`, `account_object`, `account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账凭证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_book_order_history
-- ----------------------------

-- ----------------------------
-- Table structure for fin_book_policy
-- ----------------------------
DROP TABLE IF EXISTS `fin_book_policy`;
CREATE TABLE `fin_book_policy`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `policy_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '策略名称',
  `policy_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略BEAN',
  `operators` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作符',
  `policy_value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略值',
  `response_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账返回码',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账策略表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_book_policy
-- ----------------------------

-- ----------------------------
-- Table structure for fin_book_template
-- ----------------------------
DROP TABLE IF EXISTS `fin_book_template`;
CREATE TABLE `fin_book_template`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `book_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `book_code` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `account_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '帐套bean',
  `batch_detail_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账批次明细ID',
  `book_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '记账bean',
  `process_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '记账主体....',
  `process_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '记账主体bean....',
  `account_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `debit_amount` bigint(20) NULL DEFAULT 0 COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT 0 COMMENT '贷方金额',
  `debit_amount_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '借方bean',
  `credit_amount_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '贷方bean',
  `direction` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '借贷方向....',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'remark',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账模版表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_book_template
-- ----------------------------
INSERT INTO `fin_book_template` VALUES ('1', '现金资产', 'K1001', '', '1', '', '100210', '', '10', '40', '1', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-02 16:52:54', '2024-09-02 16:52:54', '1', '1');
INSERT INTO `fin_book_template` VALUES ('10', '如e卷成本增加', 'K9001', '', '6', '', '600190', '', '10', '40', '5', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-03 18:05:15', '2024-09-03 18:05:17', '1', '1');
INSERT INTO `fin_book_template` VALUES ('11', '用户奖励', 'K9001', '', '7', 'app\\api\\middle\\finance\\book\\CarBDistribution', '', '', '10', '80', '2', 0, 0, '', '', '20', '', '2024-09-03 18:07:15', '2024-09-03 18:07:18', '1', '1');
INSERT INTO `fin_book_template` VALUES ('12', '现金成本增加', 'K9001', '', '8', '', '600110', '', '10', '40', '5', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\RemainAmount', '', '10', '', '2024-09-03 18:13:09', '2024-09-03 18:13:12', '1', '1');
INSERT INTO `fin_book_template` VALUES ('13', '绿色积分支出', 'K2002', '', '1', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '20', '80', '2', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-04 20:19:43', '2024-09-04 20:19:45', '1', '1');
INSERT INTO `fin_book_template` VALUES ('14', '绿色积分收入', 'K2002', '', '2', '', '', 'app\\api\\middle\\finance\\book\\process\\ToUser', '20', '80', '2', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-04 20:19:48', '2024-09-04 20:19:51', '1', '1');
INSERT INTO `fin_book_template` VALUES ('15', '如e卷释放', 'K8001', '', '1', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '90', '40', '2', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-04 20:22:54', '2024-09-04 20:22:56', '1', '1');
INSERT INTO `fin_book_template` VALUES ('16', '可用e增加', 'K8001', '', '2', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '91', '40', '2', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-04 20:24:12', '2024-09-04 20:24:15', '1', '1');
INSERT INTO `fin_book_template` VALUES ('2', '用户余额增加', 'K1001', '', '2', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '10', '80', '2', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-02 16:52:54', '2024-09-02 16:52:54', '1', '1');
INSERT INTO `fin_book_template` VALUES ('3', '绿色积分成本', 'K1002', '', '1', '', '600120', '', '10', '40', '5', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-03 15:00:11', '2024-09-03 15:00:14', '1', '1');
INSERT INTO `fin_book_template` VALUES ('4', '用户积分增加', 'K1002', '', '2', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '20', '80', '2', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-03 15:01:52', '2024-09-03 15:01:55', '1', '1');
INSERT INTO `fin_book_template` VALUES ('5', '用户余额扣款', 'K9001', '', '1', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '10', '80', '2', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '', '10', '', '2024-09-03 18:04:44', '2024-09-03 18:04:48', '1', '1');
INSERT INTO `fin_book_template` VALUES ('6', '资产减少', 'K9001', '', '2', '', '100210', '', '10', '40', '1', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-03 18:04:50', '2024-09-03 18:04:53', '1', '1');
INSERT INTO `fin_book_template` VALUES ('7', '用户积分扣款', 'K9001', '', '3', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '20', '80', '2', 0, 0, 'app\\api\\middle\\finance\\book\\amount\\CashDetail20Amount', '', '10', '', '2024-09-03 18:04:56', '2024-09-03 18:05:00', '1', '1');
INSERT INTO `fin_book_template` VALUES ('8', '积分成本减少', 'K9001', '', '4', '', '600120', '', '10', '40', '5', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashDetail20Amount', '20', '', '2024-09-03 18:05:03', '2024-09-03 18:05:05', '1', '1');
INSERT INTO `fin_book_template` VALUES ('9', '用户如e卷增加', 'K9001', '', '5', '', '', 'app\\api\\middle\\finance\\book\\process\\RequestUser', '90', '80', '2', 0, 0, '', 'app\\api\\middle\\finance\\book\\amount\\CashAmount', '20', '', '2024-09-03 18:05:09', '2024-09-03 18:05:12', '1', '1');

-- ----------------------------
-- Table structure for fin_cash_order
-- ----------------------------
DROP TABLE IF EXISTS `fin_cash_order`;
CREATE TABLE `fin_cash_order`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `relation_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关联表id',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `trans_amt` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `discount` bigint(20) NULL DEFAULT 0 COMMENT '优惠',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '总金额',
  `to_user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'to用户id',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态码',
  `fail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '失败原因',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `to_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'to用户名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_cash_order
-- ----------------------------

-- ----------------------------
-- Table structure for fin_cash_order_history
-- ----------------------------
DROP TABLE IF EXISTS `fin_cash_order_history`;
CREATE TABLE `fin_cash_order_history`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `relation_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关联表id',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `trans_amt` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `discount` bigint(20) NULL DEFAULT 0 COMMENT '优惠',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '总金额',
  `to_user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'to用户id',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态码',
  `fail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '失败原因',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `to_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'to用户名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_cash_order_history
-- ----------------------------

-- ----------------------------
-- Table structure for fin_cash_policy
-- ----------------------------
DROP TABLE IF EXISTS `fin_cash_policy`;
CREATE TABLE `fin_cash_policy`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `policy_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '策略名称',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型:字典表',
  `bean_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'bean类型',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'bean名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_cash_policy
-- ----------------------------

-- ----------------------------
-- Table structure for fin_cash_request
-- ----------------------------
DROP TABLE IF EXISTS `fin_cash_request`;
CREATE TABLE `fin_cash_request`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '记账码',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `to_user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'to用户id',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '10' COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fin_risk_template
-- ----------------------------
DROP TABLE IF EXISTS `fin_risk_template`;
CREATE TABLE `fin_risk_template`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `risk_bean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风控BEAN',
  `book_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账码',
  `operators` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作符',
  `value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '00' COMMENT '状态',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '风控模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fin_risk_template
-- ----------------------------
INSERT INTO `fin_risk_template` VALUES ('1941909097158183424', '检查推荐码', 'app\\api\\middle\\finance\\risk\\CheckPromotionCode', 'K9001', '', '', 2, '00', '');
INSERT INTO `fin_risk_template` VALUES ('1941909884659770624', '检查购买会员的余额', 'app\\api\\middle\\finance\\risk\\CheckLevelSystem', 'K9001', '', '', 3, '00', '');
INSERT INTO `fin_risk_template` VALUES ('1942265670300620800', '检查当前用户等级', 'app\\api\\middle\\finance\\risk\\CheckUserLevel', 'K9001', '', '', 1, '00', '');
INSERT INTO `fin_risk_template` VALUES ('1942710036895024896', '检查用户的绿色积分', 'app\\api\\middle\\finance\\risk\\CheckUser20Balance', 'K2002', '', '', 0, '00', '');

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信验证码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) NULL DEFAULT 0 COMMENT '会员ID',
  `admin_id` int(10) NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '省市',
  `array` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数组:value=值',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '点击',
  `workrange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '时间区间',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` bigint(16) NULL DEFAULT NULL COMMENT '刷新时间',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '我是一篇测试文章描述，内容过多时将自动隐藏', '广西壮族自治区/百色市/平果县', '[\"a\",\"b\"]', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');
INSERT INTO `test` VALUES (2, 1, 1, 1, '12', '早上11111111大发噶士大夫', 'monday', 'hot', 'male', 'reading', 'sadfasd', 'fasdfasdf', 'sadfasdf', 'sadf', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1725062247, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (3, 1, 0, 0, NULL, 'sadfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725062073, 1725062073, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (4, 1, 0, 0, NULL, 'sadsdafasdfsdfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725062107, 1725062107, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (5, 1, 0, 0, NULL, '早上11111111大发噶士大夫', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725113986, 1725113986, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (6, 1, 0, 0, NULL, '早上11111111大发噶士大夫', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725113998, 1725113998, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (7, 1, 0, 0, NULL, '早上11111111大发噶士大夫', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725114005, 1725114005, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (8, 1, 0, 0, NULL, 'asfasdfasdfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725114448, 1725114448, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (9, 1, 0, 0, NULL, 'asfasdfasdfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725114449, 1725114449, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (10, 1, 0, 0, NULL, 'asfasdfasdfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725114450, 1725114450, NULL, 0, 0, 'normal', '1');
INSERT INTO `test` VALUES (11, 1, 0, 0, NULL, 'asfasdfasdfasdf', NULL, '', 'male', NULL, '', NULL, '', '', '', '', '', '', '', '', '', 0.00, 0, '', NULL, NULL, NULL, NULL, NULL, 1725114450, 1725114450, NULL, 0, 0, 'normal', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` bigint(16) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(16) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(16) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'admin', 'admin', '481b823b0ab574230fa7d60adc86105b', 'TlZGMy', 'admin@163.com', '13000000000', 'http://www.mall.com/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1724860604, 1725493055, '127.0.0.1', 0, '127.0.0.1', 1491635035, 0, 1725493055, '', 'normal', '');
INSERT INTO `user` VALUES (2, 0, '13000000001', '130****0001', '366ed08f9bcc10af462debf6a0730708', 'zHlOso', '', '13000000001', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1725492658, 1725492658, '127.0.0.1', 0, '127.0.0.1', 1725492658, 1725492658, 1725492658, '', 'normal', '');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `receiver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_bank
-- ----------------------------
DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `account_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户',
  `account_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户名称',
  `bank_reserved_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留手机号',
  `open_bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行名称',
  `bank_line_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联行号名称',
  `bank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡简称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户银行卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_bank
-- ----------------------------

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限节点',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '标识',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `pay_passwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `tariff_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资费编码',
  `user_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'U1000' COMMENT '用户等级',
  `agent_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'A1000' COMMENT '代理等级',
  `sys_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'S1000' COMMENT '系统等级',
  `cash_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户提现',
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传递过来的Token',
  `cash_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '收款码',
  `promotion_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (2, '1142889689825594113', '13000000001', '13000000001', NULL, NULL, NULL, 'U1000', 'A1000', 'S1000', '00', 'eyJpZCI6IjExNDI4ODk2ODk4MjU1OTQxMTMiLCJuYW1lIjoiMTMwMDAwMDAwMDEiLCJyb2xlIjoiXHU1MWZhXHU4ODRjIiwiaWF0IjoxNzI1NDkyNjQxLCJleHAiOjE3MjgwODQ2NDF9.0c19cc3a22c6f85052ce248374558029', '1142889689825594113', '1');

-- ----------------------------
-- Table structure for user_level_dict
-- ----------------------------
DROP TABLE IF EXISTS `user_level_dict`;
CREATE TABLE `user_level_dict`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `level_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `promotion_reward` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐奖',
  `service_reward` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务奖',
  `coupon_release` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卷释放比例',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '等级字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_level_dict
-- ----------------------------
INSERT INTO `user_level_dict` VALUES ('1', '服务商', 'user_level', 'U1020', '0.2', '0.2', '0.0027', '2024-09-03 21:03:30', '2024-09-03 21:03:36');
INSERT INTO `user_level_dict` VALUES ('1940939743063137024', '普通用户', 'user_level', 'U1000', '0', '0', '0', '2024-08-30 23:21:35', '2024-08-30 23:30:41');
INSERT INTO `user_level_dict` VALUES ('1940961939974233088', '推广员', 'user_level', 'U1010', '0.1', '0.2', '0.0027', '2024-08-31 00:49:11', '2024-08-31 01:07:25');
INSERT INTO `user_level_dict` VALUES ('2', '合伙人', 'user_level', 'U1030', '0.4', '0.2', '0.0027', '2024-09-03 21:03:32', '2024-09-03 21:03:38');

-- ----------------------------
-- Table structure for user_level_sale_order
-- ----------------------------
DROP TABLE IF EXISTS `user_level_sale_order`;
CREATE TABLE `user_level_sale_order`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型',
  `level_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级编码',
  `account_type1` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',
  `promotion_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广码',
  `promotion_user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广者',
  `promotion_login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广者手机',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '升级流水' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_level_sale_order
-- ----------------------------

-- ----------------------------
-- Table structure for user_level_system
-- ----------------------------
DROP TABLE IF EXISTS `user_level_system`;
CREATE TABLE `user_level_system`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `trade_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型',
  `level_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级编码',
  `account_type1` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',
  `rights1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权益1',
  `rights2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权益2',
  `rights3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权益3',
  `rights4` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权益4',
  `rights5` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权益5',
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片1',
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `image3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片3',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员体系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_level_system
-- ----------------------------
INSERT INTO `user_level_system` VALUES ('1941873958420022528', '服务商', 'buy_level', 'user_level', 'U1020', '10', 300000, '20', 90000, '', 0, '', '', '', '', '', '', '', '', '2024-09-02 13:13:43', '2024-09-05 05:34:46');
INSERT INTO `user_level_system` VALUES ('1941874180839724800', '推广员', 'buy_level', 'user_level', 'U1010', '10', 100000, '20', 30000, '', 0, '', '', '', '', '', '', '', '', '2024-09-02 13:14:34', '2024-09-06 00:44:57');
INSERT INTO `user_level_system` VALUES ('1943135015008662528', '合伙人', 'buy_level', 'user_level', 'U1030', '10', 1000000, '20', 300000, '', 0, '', '', '', '', '', '', '', '', '2024-09-06 00:44:08', '2024-09-06 00:44:08');

-- ----------------------------
-- Table structure for user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `user_money_log`;
CREATE TABLE `user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_release_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_release_coupon`;
CREATE TABLE `user_release_coupon`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `sum_coupon` int(20) NULL DEFAULT 0 COMMENT '总计打车卷',
  `release` int(20) NULL DEFAULT 0 COMMENT '可释放卷',
  `freeze` int(20) NULL DEFAULT 0 COMMENT '冻结卷',
  `finish` int(20) NULL DEFAULT 0 COMMENT '释放了',
  `release_times` int(20) NULL DEFAULT 0 COMMENT '释放次数',
  `u1010` int(20) NULL DEFAULT 0 COMMENT '推广员',
  `u1020` int(20) NULL DEFAULT 0 COMMENT '服务商',
  `u1030` int(20) NULL DEFAULT 0 COMMENT '合伙人',
  `next_date` date NULL DEFAULT NULL COMMENT '下次释放',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '打车卷释放' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_release_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_rule
-- ----------------------------
INSERT INTO `user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- ----------------------------
-- Table structure for user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `user_score_log`;
CREATE TABLE `user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_team
-- ----------------------------
DROP TABLE IF EXISTS `user_team`;
CREATE TABLE `user_team`  (
  `id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `user_id` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `parent1` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直推',
  `parent2` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '间推',
  `parent3` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶推',
  `parent4` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父4',
  `parent5` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父5',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '推荐',
  `agent1` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理1',
  `agent2` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理2',
  `agent3` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理3',
  `agent4` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理4',
  `agent5` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理5',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户团队' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_team
-- ----------------------------
INSERT INTO `user_team` VALUES ('1', '1142889689825594113', '13000000001', '13000000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(16) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员Token表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_token
-- ----------------------------
INSERT INTO `user_token` VALUES ('07629b6533811fca617cbc2b896abae01c7f1796', 2, 1725051011, 1727643011);
INSERT INTO `user_token` VALUES ('07e58c730e37b7d67987f5e3e14c8220d74a36a9', 7, 1725264022, 1727856022);
INSERT INTO `user_token` VALUES ('0877e3a0eb4a1e63c5c453e3aad8bedcc14bd299', 9, 1725475001, 1728067001);
INSERT INTO `user_token` VALUES ('16b3a66a2b38f44d4be8da0ea19deaf676495c22', 1, 1724839853, 1727431853);
INSERT INTO `user_token` VALUES ('1ae624d4a32dc6d0cee815aa06156c975e5662c9', 7, 1725183620, 1727775620);
INSERT INTO `user_token` VALUES ('1c9103948307c90ac56a7f6814b1c7bbd208ac24', 4, 1725050828, 1727642828);
INSERT INTO `user_token` VALUES ('1ef2048ef7097d88ad5cf4afedc00d20eff1ca34', 13, 1725496043, 1728088043);
INSERT INTO `user_token` VALUES ('2bab272dd4365f3d6b422d37f7ea8982b759534b', 1, 1724839884, 1727431884);
INSERT INTO `user_token` VALUES ('2e905c156fe5cc58e39987e18b120a251612eb95', 7, 1725251259, 1727843259);
INSERT INTO `user_token` VALUES ('468c5ebe85325245248df6ca1b22c207e9080b26', 3, 1725050745, 1727642745);
INSERT INTO `user_token` VALUES ('475b1d5bb0d0a2cf63ef32d6a4664d8a9e0df943', 7, 1725051733, 1727643733);
INSERT INTO `user_token` VALUES ('54cdfdc5228892d6cdd812230e2c7c7444f1c21e', 3, 1725051042, 1727643042);
INSERT INTO `user_token` VALUES ('5ca9572615166f0ea896c91522b5468c0fa1186c', 12, 1725492658, 1728084658);
INSERT INTO `user_token` VALUES ('7ceede41e275eb5746816f16e7e56d5d1baf1a41', 5, 1725050888, 1727642888);
INSERT INTO `user_token` VALUES ('820787aa785c7b68568e0e3b75d009d974201e09', 10, 1725483558, 1728075558);
INSERT INTO `user_token` VALUES ('8b0def096f73f170dc0fee46d247012a5d584564', 6, 1725051340, 1727643340);
INSERT INTO `user_token` VALUES ('8d9575886e7a5f27ab7fa2e2ed9b2565bc68eeeb', 9, 1725383367, 1727975367);
INSERT INTO `user_token` VALUES ('96a25583336c95608f5f27f1b46d27bf3fb54a23', 1, 1725493055, 1728085055);
INSERT INTO `user_token` VALUES ('a438daaa6b1021787781d794873ba632161477fc', 11, 1725484569, 1728076569);
INSERT INTO `user_token` VALUES ('adc21b8c54d6adf37b9390997620b3fa15226a5d', 7, 1725184059, 1727776059);
INSERT INTO `user_token` VALUES ('b27497ae87576060b06c81f0157548029ab7b923', 7, 1725184047, 1727776047);
INSERT INTO `user_token` VALUES ('b5b1f20aff42859f38a7046154cc7f7f0abb1ccd', 13, 1725496432, 1728088432);
INSERT INTO `user_token` VALUES ('b74bf33e7f567d9099222e5d3f26a05c4b39ed64', 7, 1725183609, 1727775609);
INSERT INTO `user_token` VALUES ('d1cdc42fbfe91fded283850a648da62a8286d16f', 8, 1725346326, 1727938326);
INSERT INTO `user_token` VALUES ('d3aa77424c0f91b3300830fb090ee88044724872', 7, 1725252244, 1727844244);
INSERT INTO `user_token` VALUES ('e2adb6198131236d102c706302bf746b574025f9', 4, 1725051110, 1727643110);
INSERT INTO `user_token` VALUES ('e50328611b21cad9e6b12851c13c2c4eb739c424', 3, 1725497345, 1728089345);
INSERT INTO `user_token` VALUES ('e6b147fcbd0aa8d7fe05e8b929abf458e8d641f1', 5, 1725051146, 1727643146);
INSERT INTO `user_token` VALUES ('f92980f2dc142e1b54cfe77d97e019fc77c932be', 2, 1725050538, 1727642538);
INSERT INTO `user_token` VALUES ('fee9aaaf65e698c2212f2a86df94c7408cac8f36', 1, 1724860604, 1727452604);
INSERT INTO `user_token` VALUES ('ffdbf267bcab32483eb8873b3792dfe87dd5b66d', 1, 1724860474, 1727452474);

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '版本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of version
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
