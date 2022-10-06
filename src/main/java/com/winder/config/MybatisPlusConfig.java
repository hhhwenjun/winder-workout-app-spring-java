package com.winder.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.winder.mapper")
public class MybatisPlusConfig {
}
