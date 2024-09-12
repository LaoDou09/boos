SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;





DROP TABLE IF EXISTS `fin_balance`;
CREATE TABLE `fin_balance`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `account_id` varchar(21)  NOT NULL DEFAULT '1' COMMENT '帐套id',
  `account_type` char(2)  NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2)  NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `process_id` varchar(21)  NOT NULL COMMENT '记账主体....',
  `balance` bigint(20) NULL DEFAULT 0 COMMENT '余额',
  `open_balance` bigint(20) NULL DEFAULT 0 COMMENT '期初余额',
  `occurred_amount` bigint(20) NULL DEFAULT 0 COMMENT '发生额',
  `direction` char(2)  NULL DEFAULT '' COMMENT '方向:收入,支出...',
  `close_order` varchar(100)  NULL DEFAULT '' COMMENT '记账流水',
  `sign` varchar(255)  NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id_idx`(`process_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户余额表' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `fin_book_order`;
CREATE TABLE `fin_book_order`  (
  `id` varchar(21)  NOT NULL COMMENT 'ID',
  `book_title` varchar(100)  NOT NULL COMMENT '标题',
  `account_id` varchar(21) NOT NULL COMMENT '账套号',
  `batch_id` varchar(21)  NOT NULL COMMENT '记账批次ID',
  `batch_detail_id` varchar(10) NOT NULL COMMENT '记账批次明细ID',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `account_type` char(2)  NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2)  NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1)  NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `process_id` varchar(21)  NOT NULL COMMENT '记账主体....',
  `debit_amount` bigint(20) NULL DEFAULT NULL COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT NULL COMMENT '贷方金额',
  `direction` varchar(10)  NOT NULL COMMENT '借贷方向',
  `remark` varchar(255)  NULL DEFAULT NULL COMMENT '摘要',
  `sign` varchar(255)  NULL DEFAULT NULL COMMENT '验签',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` char(2)  NULL DEFAULT NULL COMMENT '记账状态10初始未更新 00 更新成功',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id`(`process_id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `idx_group`(`process_id`, `account_type`, `account_object`, `account_id`) USING BTREE 
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账凭证表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `fin_book_order_history`;
CREATE TABLE `fin_book_order_history`  (
  `id` varchar(21)  NOT NULL COMMENT 'ID',
  `book_title` varchar(100)  NOT NULL COMMENT '标题',
  `account_id` varchar(21) NOT NULL COMMENT '账套号',
  `batch_id` varchar(21)  NOT NULL COMMENT '记账批次ID',
  `batch_detail_id` varchar(10) NOT NULL COMMENT '记账批次明细ID',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `account_type` char(2)  NOT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2)  NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1)  NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `process_id` varchar(21)  NOT NULL COMMENT '记账主体....',
  `debit_amount` bigint(20) NULL DEFAULT NULL COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT NULL COMMENT '贷方金额',
  `direction` varchar(10)  NOT NULL COMMENT '借贷方向',
  `remark` varchar(255)  NULL DEFAULT NULL COMMENT '摘要',
  `sign` varchar(255)  NULL DEFAULT NULL COMMENT '验签',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` char(2)  NULL DEFAULT NULL COMMENT '记账状态10初始未更新 00 更新成功',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `process_id`(`process_id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `idx_group`(`process_id`, `account_type`, `account_object`, `account_id`) USING BTREE 
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账凭证表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `fin_book_template`;
CREATE TABLE `fin_book_template`  (
  `id` varchar(21)  NOT NULL COMMENT 'id',
  `book_title` varchar(100)  NOT NULL COMMENT '标题',
  `book_code` char(8)  NOT NULL COMMENT '记账码',
  `account_bean` varchar(255)  NULL DEFAULT '' COMMENT '帐套bean',
  `batch_detail_id` varchar(10) NOT NULL COMMENT '记账批次明细ID',
  `book_bean` varchar(255)  NULL DEFAULT '' COMMENT '记账bean',
  `process_id` varchar(21)  NULL DEFAULT '' COMMENT '记账主体....',
  `process_bean` varchar(255)  NULL DEFAULT '' COMMENT '记账主体bean....',
  `account_type` char(2)  NULL DEFAULT NULL COMMENT '帐户类型:资金账户,交易账户...',
  `account_object` char(2)  NOT NULL COMMENT '帐户对象:商户,私有,代理商,用户...',
  `book_category` char(1)  NOT NULL COMMENT '记账分类:资产,负债,主营收入...',
  `debit_amount` bigint(20) NULL DEFAULT 0 COMMENT '借方金额',
  `credit_amount` bigint(20) NULL DEFAULT 0 COMMENT '贷方金额',
  `debit_amount_bean` varchar(255)  NULL DEFAULT '' COMMENT '借方bean',
  `credit_amount_bean` varchar(255)  NULL DEFAULT '' COMMENT '贷方bean',
  `direction` varchar(10)  NOT NULL COMMENT '借贷方向....',
  `remark` varchar(255)  NULL DEFAULT '' COMMENT 'remark',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(100)  NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(100)  NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账模版表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;

/**
收银策略表
**/
DROP TABLE IF EXISTS `fin_cash_policy`;
CREATE TABLE `fin_cash_policy`  (
  `id` varchar(21)  NOT NULL DEFAULT '' COMMENT 'id',
  `policy_name` varchar(50)  NOT NULL COMMENT '策略名称',
  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型:字典表',
  `bean_type` varchar(10)  NOT NULL COMMENT 'bean类型',
  `bean_name` varchar(255)  NOT NULL COMMENT 'bean名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `fin_cash_order`;
CREATE TABLE `fin_cash_order`  (
  `id` varchar(21)  NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21)  NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11)  NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `relation_id` varchar(50)  NULL DEFAULT '' COMMENT '关联表id',
  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `trans_amt` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `discount` bigint(20) NULL DEFAULT 0 COMMENT '优惠',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '总金额',
  `to_user_id` varchar(21)  NULL DEFAULT '' COMMENT 'to用户id',
  `details` text  NULL COMMENT '详情',
  `status` char(2)  NOT NULL COMMENT '状态码',
  `fail` varchar(100)  NULL DEFAULT ''  COMMENT '失败原因',
  `sign` varchar(255)  NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `to_user_name` varchar(100)  NULL DEFAULT NULL COMMENT 'to用户名称',
  `remark` varchar(255)  NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;
/**
  收银记录备份表
**/
DROP TABLE IF EXISTS `fin_cash_order_history`;
CREATE TABLE `fin_cash_order_history`  (
  `id` varchar(21)  NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21)  NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11)  NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `relation_id` varchar(50)  NULL DEFAULT '' COMMENT '关联表id',
  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `trans_amt` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `discount` bigint(20) NULL DEFAULT 0 COMMENT '优惠',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '总金额',
  `to_user_id` varchar(21)  NULL DEFAULT '' COMMENT 'to用户id',
  `details` text  NULL COMMENT '详情',
  `status` char(2)  NOT NULL COMMENT '状态码',
  `fail` varchar(100)  NOT NULL COMMENT '失败原因',
  `sign` varchar(255)  NOT NULL DEFAULT '' COMMENT 'sign',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `to_user_name` varchar(100)  NULL DEFAULT NULL COMMENT 'to用户名称',
  `remark` varchar(255)  NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_trade_idx`(`trade_type`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银流水表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;
/**
    收银申请流程
**/
DROP TABLE IF EXISTS `fin_cash_request`;
CREATE TABLE `fin_cash_request`  (
  `id` varchar(21)  NOT NULL DEFAULT '' COMMENT 'id',
  `user_id` varchar(21)  NOT NULL COMMENT '用户id',
  `user_mobile` varchar(11)  NULL DEFAULT '' COMMENT '用户手机',
  `user_name` varchar(30)  NULL DEFAULT '' COMMENT '用户名',
  `trade_type` varchar(30)  NOT NULL COMMENT '交易类型:字典表',
  `book_code` char(5)  NULL DEFAULT '' COMMENT '记账码',
  `amount` bigint(20) NULL DEFAULT 0 COMMENT '交易金额',
  `to_user_id` varchar(21)  NULL DEFAULT '' COMMENT 'to用户id',
  `details` text  NULL COMMENT '详情',
  `status` char(2)  NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(100)  NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(100)  NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(255)  NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收银申请表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `fin_book_policy`;
CREATE TABLE `fin_book_policy`  (
  `id` varchar(21)  NOT NULL COMMENT 'id',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `policy_name` varchar(50)  NOT NULL COMMENT '策略名称',
  `policy_bean` varchar(255)  NULL DEFAULT NULL COMMENT '策略BEAN',
  `operators` varchar(20)  NOT NULL COMMENT '操作符',
  `policy_value` varchar(20)  NULL DEFAULT NULL COMMENT '策略值',
  `response_code` varchar(5)  NULL DEFAULT NULL COMMENT '记账返回码',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(2)  NOT NULL COMMENT '状态',
  `remark` varchar(200)  NULL DEFAULT NULL COMMENT '摘要',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(20)  NOT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `updated_by` varchar(20)  NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账策略表' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `fin_risk_template`;
CREATE TABLE `fin_risk_template`  (
  `id` varchar(21)  NOT NULL COMMENT 'id',
  `title` varchar(50)  NOT NULL COMMENT '标题',
  `risk_bean` varchar(255)  NULL DEFAULT NULL COMMENT '风控BEAN',
  `book_code` char(5)  NOT NULL COMMENT '记账码',
  `operators` varchar(20)  NULL DEFAULT NULL COMMENT '操作符',
  `value` varchar(20)  NULL DEFAULT NULL COMMENT '策略值',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(2)  NOT NULL DEFAULT '00' COMMENT '状态',
  `remark` varchar(200)  NULL DEFAULT NULL COMMENT '摘要',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_code_idx`(`book_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '风控模板' ROW_FORMAT = DYNAMIC;
SET FOREIGN_KEY_CHECKS = 1;