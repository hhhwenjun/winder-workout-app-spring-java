package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.dao.UserDao;
import com.example.springboot.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @GetMapping
    public List<User> findAll() {
        return userDao.findAll();
    }

    @GetMapping("/{id}")
    public User findById(@PathVariable Integer id){
        return userDao.getById(id);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result login(@RequestBody User user) {
        if (user.getUsername() == null || user.getPassword() == null) {
            return Result.error("Missing variable");
        }
        User result = userDao.getByUser(user.getUsername(), user.getPassword());
        if (result == null) {
            return Result.error("Wrong username or password");
        }
        return Result.success(result);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Result register(@RequestBody User user) {
        if (user.getUsername() == null || user.getPassword() == null) {
            return Result.error("Missing variable");
        }
        userDao.insert(user);
        User result = userDao.getByUser(user.getUsername(), user.getPassword());
        if (result == null) {
            return Result.error("Wrong username or password");
        }
        return Result.success(result);
    }

}
