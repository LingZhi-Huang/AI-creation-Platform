package com.aiplatform.aicreationplatform.module.ai.entity;

import lombok.Data;
import java.time.LocalDateTime;

/**
 * AI 模型实体类
 */
@Data
public class AiModel {
    private String modelId;
    private String modelName;
    private String modelType; // text-文本模型，image-图像模型
    private Integer costPerCall; // 每次调用消耗的算力点数
    private String description;
    private Integer status; // 0-禁用，1-启用
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
