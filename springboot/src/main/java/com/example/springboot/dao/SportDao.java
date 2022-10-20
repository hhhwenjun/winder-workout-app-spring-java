package com.example.springboot.dao;

import com.example.springboot.entity.Sport;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SportDao {
    List<Sport> findAllSport();

    Sport getBySportId(Integer id);

    Sport getBySportName(String sportname);
}
