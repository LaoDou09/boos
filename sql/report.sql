/**
用户收益统计
1 推广收益,来自用户购买或者复购,记账码:K
2 盲盒收益,记账码:
3 分红收益
本表在用户购买时设置上限或者生成记录
限额来自level_system的price3
对外提供是否超限的服务
**/


DROP TABLE IF EXISTS `report_user_income`;
CREATE TABLE `report_user_income`  (
  `id` varchar(21)  NOT NULL COMMENT '标识',
  `user_id` varchar(21)  NOT NULL COMMENT '用户编号',
  `user_name` varchar(20)  NULL DEFAULT NULL COMMENT '用户姓名',
  `promotion` int(20)  NULL DEFAULT 0 COMMENT '推广收益',
  `blind` int(20)  NULL DEFAULT 0 COMMENT '盲盒收益',
  `profit` int(20)  NULL DEFAULT 0 COMMENT '分红收益',
  `limit` int(20)  NULL DEFAULT 0 COMMENT '收益限额',

  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收入统计' ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;