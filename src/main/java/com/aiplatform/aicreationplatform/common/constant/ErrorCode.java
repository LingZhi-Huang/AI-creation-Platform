package com.aiplatform.aicreationplatform.common.constant;

import lombok.Getter;

/**
 * 错误码枚举
 */
@Getter
public enum ErrorCode {
    SUCCESS(200, "请求成功"),
    BAD_REQUEST(400, "请求参数错误"),
    UNAUTHORIZED(401, "未登录 / Token 过期"),
    FORBIDDEN(403, "无操作权限"),
    NOT_FOUND(404, "资源不存在"),
    SERVER_ERROR(500, "服务器内部异常"),
    INSUFFICIENT_TOKENS(601, "算力点数不足"),
    TASK_FAILED(602, "任务处理失败/大模型调用异常"),
    RATE_LIMITED(603, "操作频繁（触发限流）");

    private final Integer code;
    private final String message;

    ErrorCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
