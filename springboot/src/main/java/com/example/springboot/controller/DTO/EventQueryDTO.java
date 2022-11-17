package com.example.springboot.controller.DTO;

import lombok.Data;

@Data
public class EventQueryDTO {
    private Integer userid;
    private Integer sportid;
    private String date_from;
    private String date_to;
    private String time_from;
    private String time_to;
}
