package com.aiplatform.aicreationplatform.module.order.entity;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 订单实体类
 */
@Data
public class Order {
    private String orderNo;
    private String userId;
    private String packageId;
    private BigDecimal price;
    private Integer tokens;
    private Integer status; // 0-待支付，1-已支付，2-已关闭，3-已完成
    private LocalDateTime payTime;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
