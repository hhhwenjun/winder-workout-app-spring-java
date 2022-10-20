package com.example.springboot.entity;

import lombok.Data;

@Data
public class Event {

    private Integer id;
    private String name;
    private Integer createrid;

    private String time;
    private String location;
    private String description;
    private String participantid;
    private Integer sportid;
}