package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.dao.UserRelationDao;
import com.example.springboot.entity.Event;
import com.example.springboot.entity.User;
import com.example.springboot.entity.UserRelation;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/userrelation")
public class UserRelationController {
    @Autowired
    private UserRelationDao userRelationDao;

    @GetMapping("/mate/{userid}")
    public List<User> getMate(@PathVariable Integer userid){
        return userRelationDao.getMate(userid);
    }

    @GetMapping("/relation/{userid}")
    public UserRelation getByuserid(@PathVariable Integer userid){
        return userRelationDao.getByuserid(userid);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Result create(@RequestBody UserRelation userRelation) {
        if (userRelation.getUserid() == null) {
            return Result.error("Missing user");
        }
        userRelationDao.insert(userRelation);
        UserRelation result = userRelationDao.getByuserid(userRelation.getUserid());
        if (result == null) {
            return Result.error("Create failed");
        }
        return Result.success(result);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Result update(@RequestBody UserRelation userRelation) {
        if (userRelation.getUserid() == null) {
            return Result.error("Missing value");
        }
        userRelationDao.update(userRelation);
        UserRelation result = userRelationDao.getByuserid(userRelation.getUserid());
        return Result.success(result);
    }
}
