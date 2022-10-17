package com.example.springboot.dao;

import com.example.springboot.controller.DTO.EventQueryDTO;
import com.example.springboot.entity.Event;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventDao {

    List<Event> getBycreater(Integer createrid) ;

    List<Event> getByparticipant(Integer userid);

    Event getByid(Integer id);

    int insert(Event event);

    int update(Event event);

    int deleteById(Integer id);

    List<Event> find(EventQueryDTO eventQueryDTO);
}
