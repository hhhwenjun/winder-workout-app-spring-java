package com.example.springboot.controller.DTO;

import lombok.Data;

@Data
public class UserQueryDTO {
    private Integer userId;
    private String sex;
    private Integer ageLower;
    private Integer ageUpper;

}
