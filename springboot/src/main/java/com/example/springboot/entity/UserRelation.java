package com.example.springboot.entity;

import lombok.Data;

@Data
public class UserRelation {

    private Integer id;
    private Integer userid;
    // mate of each other
    private String mateid;

    // like: the people you like
    private String likeid;

    // people who like you, you may like them
    private String maylikeid;
}
