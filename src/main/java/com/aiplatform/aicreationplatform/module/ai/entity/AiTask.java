package com.aiplatform.aicreationplatform.module.ai.entity;

import lombok.Data;
import java.time.LocalDateTime;

/**
 * AI 任务实体类
 */
@Data
public class AiTask {
    private String taskId;
    private String userId;
    private String modelId;
    private String prompt;
    private String type; // text-文本对话，image-AI绘图
    private String status; // queueing-排队中，processing-处理中，completed-已完成，failed-失败
    private String result; // 生成结果（文本内容或图片URL）
    private Integer costTokens;
    private LocalDateTime createTime;
    private LocalDateTime finishTime;
}
