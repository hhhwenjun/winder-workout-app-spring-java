package com.example.springboot.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class Event {

    private Integer id;
    private String name;
    private Integer createrid;

    private String date;
    private String time;
    private String location;
    private String description;
    private String participantid;
    private Integer sportid;
}