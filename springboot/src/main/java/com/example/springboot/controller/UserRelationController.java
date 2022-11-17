package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.dao.UserRelationDao;
import com.example.springboot.entity.User;
import com.example.springboot.entity.UserRelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/userrelation")
public class UserRelationController {
    @Autowired
    private UserRelationDao userRelationDao;

    // Get mates you have
    @GetMapping("/mate/{userid}")
    public List<User> getMate(@PathVariable Integer userid){
        return userRelationDao.getMate(userid);
    }

    // Get people who you like
    @GetMapping("/like/{userid}")
    public List<User> getYouLike(@PathVariable Integer userid){
        return userRelationDao.getYouLike(userid);
    }

    // Get people who like you, you can click "like" then you become mate
    @GetMapping("/may-like/{userid}")
    public List<User> getYouMayLike(@PathVariable Integer userid){
        return userRelationDao.getYouMayLike(userid);
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
