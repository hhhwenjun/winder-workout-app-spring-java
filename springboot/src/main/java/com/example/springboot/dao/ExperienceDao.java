package com.example.springboot.dao;

import com.example.springboot.entity.Experience;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExperienceDao {
    List<Experience> getAllExperience(Integer experienceId) ;

    List<Experience> getExperienceByUserId(Integer userId) ;

    int update(Experience Experience);

    int insert(Experience Experience);
}
