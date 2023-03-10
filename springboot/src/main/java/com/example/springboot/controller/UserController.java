package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.DTO.UserQueryDTO;
import com.example.springboot.dao.UserDao;
import com.example.springboot.entity.Sport;
import com.example.springboot.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @GetMapping
    public List<User> findAll() {
        return userDao.findAll();
    }

    @GetMapping("/userid/{id}")
    public User findById(@PathVariable Integer id){
        return userDao.getById(id);
    }

    @GetMapping("/username/{username}")
    public User getByName(@PathVariable String username){
        return userDao.getByName(username);
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
        User result = userDao.getByName(user.getUsername());
        if (result != null) {
            return Result.error("Username exists! Try another.");
        }
        userDao.insert(user);
        result = userDao.getByName(user.getUsername());
        if (result == null) {
            return Result.error("Create failed");
        }
        return Result.success(result);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Result update(@RequestBody User user) {
        if (user.getUsername() == null || user.getPassword() == null) {
            return Result.error("Missing variable");
        }
        userDao.update(user);
        User result = userDao.getByName(user.getUsername());
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        if (id == null || id == 0) {
            return Result.error("Wrong Id");
        }
        return Result.success(userDao.deleteById(id) == 1);
    }

    @GetMapping("/match")  //   /user/page?currentPage=1&pageSize=10
    public List<User> match(UserQueryDTO userQueryDTO) {
        return userDao.match(userQueryDTO);
    }

    @GetMapping("/sport/{userid}")
    public List<Sport> getSport(@PathVariable Integer userid){
        return userDao.getSport(userid);
    }


}
