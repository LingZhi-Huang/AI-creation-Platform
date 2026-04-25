package com.aiplatform.aicreationplatform.module.order.entity;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 充值套餐实体类
 */
@Data
public class RechargePackage {
    private String packageId;
    private String name;
    private BigDecimal price;
    private Integer tokens;
    private String description;
    private Integer status; // 0-下架，1-上架
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
