package com.aiplatform.aicreationplatform.module.user.entity;

import lombok.Data;
import java.time.LocalDateTime;

/**
 * 用户实体类
 */
@Data
public class User {
    private String userId;
    private String username;
    private String email;
    private String password;
    private String avatar;
    private String bio;
    private Integer tokensBalance;
    private Integer status; // 0-禁用，1-启用
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
