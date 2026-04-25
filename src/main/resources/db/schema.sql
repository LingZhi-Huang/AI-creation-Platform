-- AI 创作与算力租赁平台数据库表结构

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
    `user_id` VARCHAR(64) PRIMARY KEY COMMENT '用户ID',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `email` VARCHAR(100) NOT NULL UNIQUE COMMENT '邮箱',
    `password` VARCHAR(255) COMMENT '密码（MD5加密）',
    `avatar` VARCHAR(255) COMMENT '头像URL',
    `bio` VARCHAR(500) COMMENT '个人简介',
    `tokens_balance` INT DEFAULT 0 COMMENT '算力点数余额',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX `idx_email` (`email`),
    INDEX `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- AI 模型表
CREATE TABLE IF NOT EXISTS `ai_model` (
    `model_id` VARCHAR(64) PRIMARY KEY COMMENT '模型ID',
    `model_name` VARCHAR(100) NOT NULL COMMENT '模型名称',
    `model_type` VARCHAR(20) NOT NULL COMMENT '模型类型：text-文本，image-图像',
    `cost_per_call` INT NOT NULL DEFAULT 1 COMMENT '每次调用消耗的算力点数',
    `description` VARCHAR(500) COMMENT '模型描述',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI模型表';

-- AI 任务表
CREATE TABLE IF NOT EXISTS `ai_task` (
    `task_id` VARCHAR(64) PRIMARY KEY COMMENT '任务ID',
    `user_id` VARCHAR(64) NOT NULL COMMENT '用户ID',
    `model_id` VARCHAR(64) NOT NULL COMMENT '模型ID',
    `prompt` TEXT NOT NULL COMMENT '提示词',
    `type` VARCHAR(20) NOT NULL COMMENT '任务类型：text-文本，image-图像',
    `status` VARCHAR(20) NOT NULL DEFAULT 'queueing' COMMENT '状态：queueing-排队中，processing-处理中，completed-已完成，failed-失败',
    `result` TEXT COMMENT '生成结果',
    `cost_tokens` INT NOT NULL COMMENT '消耗的算力点数',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `finish_time` DATETIME COMMENT '完成时间',
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_status` (`status`),
    INDEX `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI任务表';

-- 充值套餐表
CREATE TABLE IF NOT EXISTS `recharge_package` (
    `package_id` VARCHAR(64) PRIMARY KEY COMMENT '套餐ID',
    `name` VARCHAR(100) NOT NULL COMMENT '套餐名称',
    `price` DECIMAL(10, 2) NOT NULL COMMENT '价格',
    `tokens` INT NOT NULL COMMENT '算力点数',
    `description` VARCHAR(500) COMMENT '套餐描述',
    `status` TINYINT DEFAULT 1 COMMENT '状态：0-下架，1-上架',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值套餐表';

-- 订单表
CREATE TABLE IF NOT EXISTS `orders` (
    `order_no` VARCHAR(64) PRIMARY KEY COMMENT '订单号',
    `user_id` VARCHAR(64) NOT NULL COMMENT '用户ID',
    `package_id` VARCHAR(64) NOT NULL COMMENT '套餐ID',
    `price` DECIMAL(10, 2) NOT NULL COMMENT '支付金额',
    `tokens` INT NOT NULL COMMENT '算力点数',
    `status` TINYINT DEFAULT 0 COMMENT '状态：0-待支付，1-已支付，2-已关闭，3-已完成',
    `pay_time` DATETIME COMMENT '支付时间',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_status` (`status`),
    INDEX `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 签到记录表
CREATE TABLE IF NOT EXISTS `sign_in_record` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    `user_id` VARCHAR(64) NOT NULL COMMENT '用户ID',
    `sign_in_date` DATE NOT NULL COMMENT '签到日期',
    `reward_tokens` INT NOT NULL DEFAULT 10 COMMENT '奖励算力点数',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    UNIQUE KEY `uk_user_date` (`user_id`, `sign_in_date`),
    INDEX `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到记录表';
