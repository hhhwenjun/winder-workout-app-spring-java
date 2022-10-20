package com.example.springboot.dao;

import com.example.springboot.controller.DTO.UserQueryDTO;
import com.example.springboot.entity.User;
import com.example.springboot.entity.Sport;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserDao {

    List<User> findAll();

    User getById(Integer id);

    List<Sport> getSport(Integer userid);

    User getByName(String username);

    User getByUser(@Param("username") String username, @Param("password") String password);

    int insert(User user);

    int update(User user);

    int deleteById(Integer id);

    List<User> match(UserQueryDTO userQueryDTO);

}
