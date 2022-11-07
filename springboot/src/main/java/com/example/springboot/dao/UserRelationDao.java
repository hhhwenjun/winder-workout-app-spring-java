package com.example.springboot.dao;

import com.example.springboot.entity.User;
import com.example.springboot.entity.UserRelation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserRelationDao {
    List<User> getMate(Integer userid) ;

    List<User> getYouLike(Integer userid) ;

    List<User> getYouMayLike(Integer userid) ;

    UserRelation getByuserid(Integer userid) ;

    int update(UserRelation userRelation);

    int insert(UserRelation userRelation);

}
