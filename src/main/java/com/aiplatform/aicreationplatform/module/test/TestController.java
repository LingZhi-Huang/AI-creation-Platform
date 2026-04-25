package com.aiplatform.aicreationplatform.module.test;

import com.aiplatform.aicreationplatform.common.result.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 测试控制器 - 用于验证框架是否正常
 */
@RestController
@RequestMapping("/api/v1/test")
public class TestController {

    @GetMapping("/hello")
    public Result<Map<String, String>> hello() {
        Map<String, String> data = new HashMap<>();
        data.put("message", "AI 创作平台后端框架搭建成功！");
        data.put("status", "running");
        return Result.success(data);
    }
}
