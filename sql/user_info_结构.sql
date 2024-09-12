SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

/**
  用户信息表
**/
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户id',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(2)  NULL DEFAULT NULL COMMENT '用户类型',
  `pay_passwd` varchar(20)  NULL DEFAULT NULL COMMENT '支付密码',
  `tariff_code` varchar(5)  NULL DEFAULT NULL COMMENT '资费编码',
  `user_level` varchar(20)  NULL DEFAULT 'U1000' COMMENT '用户等级',
  `agent_level` varchar(20)  NULL DEFAULT 'A1000' COMMENT '代理等级',
  `sys_level` varchar(20)  NULL DEFAULT 'S1000' COMMENT '系统等级',
  `cash_status` varchar(2)  NULL DEFAULT '00' COMMENT '用户提现',
  `token` varchar(200)  NULL DEFAULT NULL COMMENT '传递过来的Token',
  `cash_code` varchar(50)  NULL DEFAULT '' COMMENT '收款码',
  `promotion_code` varchar(50)  NULL DEFAULT '' COMMENT '推广码',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

/**/
DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',
  `account_no` varchar(50)  NULL DEFAULT NULL COMMENT '帐户',
  `account_name` varchar(50)  NULL DEFAULT NULL COMMENT '帐户名称',
  `bank_reserved_mobile` varchar(11)  NULL DEFAULT NULL COMMENT '预留手机号',
  `open_bank_name` varchar(100)  NULL DEFAULT NULL COMMENT '开户行名称',
  `bank_line_name` varchar(200)  NULL DEFAULT NULL COMMENT '联行号名称',
  `bank_code` varchar(20)  NULL DEFAULT NULL COMMENT '银行卡简称',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户银行卡' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

/**/
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',
  
  `title` varchar(30)  NULL DEFAULT NULL COMMENT '标题',
  `receiver` varchar(50)  NULL DEFAULT NULL COMMENT '收件人',
  `state` varchar(20)  NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(20)  NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(200)  NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50)  NULL DEFAULT NULL COMMENT '联系电话',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

/**/
DROP TABLE IF EXISTS `user_team`;
CREATE TABLE `user_team`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',
  
  `parent1` varchar(21)  NULL DEFAULT NULL COMMENT '直推',
  `parent2` varchar(21)  NULL DEFAULT NULL COMMENT '间推',
  `parent3` varchar(21)  NULL DEFAULT NULL COMMENT '顶推',
  `parent4` varchar(21)  NULL DEFAULT NULL COMMENT '父4',
  `parent5` varchar(21)  NULL DEFAULT NULL COMMENT '父5',
  `path` text  NULL DEFAULT NULL COMMENT '推荐',

  `agent1` varchar(21)  NULL DEFAULT NULL COMMENT '代理1',
  `agent2` varchar(21)  NULL DEFAULT NULL COMMENT '代理2',
  `agent3` varchar(21)  NULL DEFAULT NULL COMMENT '代理3',
  `agent4` varchar(21)  NULL DEFAULT NULL COMMENT '代理4',
  `agent5` varchar(21)  NULL DEFAULT NULL COMMENT '代理5',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户团队' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `user_level_dict`;
CREATE TABLE `user_level_dict`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `name` varchar(50)  NOT NULL COMMENT '名称',
  `level_key` varchar(20)  NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20)  NULL DEFAULT NULL COMMENT '编码',
  `promotion_reward` varchar(20)  NULL DEFAULT NULL COMMENT '推荐奖',
  `service_reward` varchar(20)  NULL DEFAULT NULL COMMENT '服务奖',
  `coupon_release` varchar(20)  NULL DEFAULT NULL COMMENT '卷释放比例',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '等级字典' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `user_level_system`;
CREATE TABLE `user_level_system`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `title` varchar(50)  NOT NULL COMMENT '标题',
  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型',
  `level_key` varchar(20)  NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20)  NULL DEFAULT NULL COMMENT '等级编码',
  `account_type1` char(2)   NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)   NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)   NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',
  `rights1` varchar(200)   NULL DEFAULT NULL COMMENT '权益1',
  `rights2` varchar(200)   NULL DEFAULT NULL COMMENT '权益2',
  `rights3` varchar(200)   NULL DEFAULT NULL COMMENT '权益3',
  `rights4` varchar(200)   NULL DEFAULT NULL COMMENT '权益4',
  `rights5` varchar(200)   NULL DEFAULT NULL COMMENT '权益5',

  `image1` varchar(255)   NULL DEFAULT NULL COMMENT '图片1',
  `image2` varchar(255)   NULL DEFAULT NULL COMMENT '图片2',
  `image3` varchar(255)   NULL DEFAULT NULL COMMENT '图片3',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员体系' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `user_level_sale_order`;
CREATE TABLE `user_level_sale_order`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `title` varchar(50)  NOT NULL COMMENT '标题',

  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',

  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型',
  `level_key` varchar(20)  NULL DEFAULT NULL COMMENT 'level_key',
  `code` varchar(20)  NULL DEFAULT NULL COMMENT '等级编码',
  `account_type1` char(2)  NOT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)  NOT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)  NOT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',

  `promotion_code` varchar(50)  NULL DEFAULT '' COMMENT '推广码',
  `promotion_user_id` varchar(21)  NULL DEFAULT '' COMMENT '推广者',
  `promotion_login_name` varchar(50)  NULL DEFAULT '' COMMENT '推广者手机',

  `status` char(2)  NOT NULL COMMENT '状态码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',

  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '升级流水' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

/**
用户打车卷释放
**/
DROP TABLE IF EXISTS `user_release_coupon`;
CREATE TABLE `user_release_coupon`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `sum_coupon` int(20)  NULL DEFAULT 0 COMMENT '总计打车卷',
  `release` int(20) NULL DEFAULT 0 COMMENT '可释放卷',
  `freeze` int(20)  NULL DEFAULT 0 COMMENT '冻结卷',
  `finish` int(20)  NULL DEFAULT 0 COMMENT '释放了',
  `release_times` int(20)  NULL DEFAULT 0 COMMENT '释放次数',
  `u1010` int(20)  NULL DEFAULT 0 COMMENT '推广员',
  `u1020` int(20)  NULL DEFAULT 0 COMMENT '服务商',
  `u1030` int(20)  NULL DEFAULT 0 COMMENT '合伙人',
  `next_date` date NULL DEFAULT NULL COMMENT '下次释放',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '打车卷释放' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;