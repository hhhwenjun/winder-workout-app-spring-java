package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.dao.EventDao;
import com.example.springboot.entity.Event;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventDao eventDao;


    @GetMapping("/creater/{id}")
    public List<Event> getBycreater(@PathVariable Integer id){
        return eventDao.getBycreater(id);
    }

    @GetMapping("/participate/{id}")
    public List<Event> getByparticipant(@PathVariable Integer id){
        return eventDao.getByparticipant(id);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Result create(@RequestBody Event event) {
        if (event.getName() == null) {
            return Result.error("Missing name");
        }
        eventDao.insert(event);
        Event result = eventDao.getByid(event.getId());
        return Result.success(result);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Result update(@RequestBody Event event) {
        if (event.getName() == null) {
            return Result.error("Missing name");
        }
        eventDao.update(event);
        Event result = eventDao.getByid(event.getId());
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        if (id == null || id == 0) {
            return Result.error("Wrong id");
        }
        return Result.success(eventDao.deleteById(id) == 1);
    }

}
