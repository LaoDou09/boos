SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `shop_blind_goods`;
CREATE TABLE `shop_blind_goods`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `title` varchar(21)  NOT NULL COMMENT '标题',
  `goods_name` varchar(50)  NOT NULL COMMENT '产品名称',
  `account_type1` char(2)   NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)   NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)   NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',
  `memo` text   NULL DEFAULT NULL COMMENT '说明',

  `sucess` varchar(21)  NOT NULL COMMENT '成功交易',
  `failed` varchar(21)  NOT NULL COMMENT '失败交易',

  `image1` varchar(255)   NULL DEFAULT NULL COMMENT '图片1',
  `image2` varchar(255)   NULL DEFAULT NULL COMMENT '图片2',
  `image3` varchar(255)   NULL DEFAULT NULL COMMENT '图片3',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '盲盒产品' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `shop_blind_order`;
CREATE TABLE `shop_blind_order`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `title` varchar(21)  NOT NULL COMMENT '标题',

  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',

  `goods_name` varchar(50)  NOT NULL COMMENT '产品名称',
  `account_type1` char(2)   NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)   NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)   NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',

  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型',
  `status` char(2)  NOT NULL COMMENT '状态码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',

  `receiver` varchar(50)  NULL DEFAULT NULL COMMENT '收件人',
  `state` varchar(20)  NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(20)  NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(200)  NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50)  NULL DEFAULT NULL COMMENT '联系电话',

  `deliver_com` varchar(200)  NULL DEFAULT NULL COMMENT '快递公司',
  `deliver_no` varchar(200)  NULL DEFAULT NULL COMMENT '单号',


  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '盲盒订单' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `goods_name` varchar(50)  NOT NULL COMMENT '产品名称',
  `tag` varchar(255)  NULL DEFAULT NULL COMMENT '标签',

  `account_type1` char(2)   NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)   NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)   NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',
  `memo` text   NULL DEFAULT NULL COMMENT '说明',

  `trade_type` varchar(21)  NOT NULL COMMENT '交易类型',

  `image1` varchar(255)   NULL DEFAULT NULL COMMENT '图片1',
  `image2` varchar(255)   NULL DEFAULT NULL COMMENT '图片2',
  `image3` varchar(255)   NULL DEFAULT NULL COMMENT '图片3',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城产品' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `goods_name` varchar(50)  NOT NULL COMMENT '产品名称',
  `tag` varchar(255)  NULL DEFAULT NULL COMMENT '标签',

  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(20)  NULL DEFAULT NULL COMMENT '手机号',

  `account_type1` char(2)   NULL DEFAULT NULL COMMENT '帐户类型1',
  `price1` int(11) NULL DEFAULT NULL COMMENT '金额1',
  `account_type2` char(2)   NULL DEFAULT NULL COMMENT '帐户类型2',
  `price2` int(11) NULL DEFAULT NULL COMMENT '金额2',
  `account_type3` char(2)   NULL DEFAULT NULL COMMENT '帐户类型3',
  `price3` int(11) NULL DEFAULT NULL COMMENT '金额3',

  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型',
  `status` char(2)  NOT NULL COMMENT '状态码',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',

  `receiver` varchar(50)  NULL DEFAULT NULL COMMENT '收件人',
  `state` varchar(20)  NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(20)  NULL DEFAULT NULL COMMENT '城市',
  `address` varchar(200)  NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50)  NULL DEFAULT NULL COMMENT '联系电话',

  `deliver_com` varchar(200)  NULL DEFAULT NULL COMMENT '快递公司',
  `deliver_no` varchar(200)  NULL DEFAULT NULL COMMENT '单号',

  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `login_name`(`login_name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城订单' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;