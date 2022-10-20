package com.example.springboot.dao;

import com.example.springboot.entity.Experience;
import com.example.springboot.entity.Sport;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ExperienceDao {
    List<Experience> getAllExperience() ;

    List<Experience> getExperienceByUserId(Integer userid) ;

    Experience getUserSportLevel(@Param("userid") Integer userid, @Param("sportid") Integer sportid) ;

    List<Sport> getNewSportByUserId(Integer userid);

    int update(Experience experience);

    int insert(Experience experience);
}
