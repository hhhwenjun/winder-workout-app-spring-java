package com.example.springboot.controller;

import com.example.springboot.dao.SportDao;
import com.example.springboot.entity.Sport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sport")
public class SportController {

    @Autowired
    private SportDao sportDao;

    @GetMapping
    public List<Sport> findAllSport() {
        return sportDao.findAllSport();
    }

    @GetMapping("/sportid/{id}")
    public Sport getBySportId(@PathVariable Integer id) {
        return sportDao.getBySportId(id);
    }

    @GetMapping("/sportname/{sportname}")
    public Sport getBySportName(@PathVariable String sportname) {
        return sportDao.getBySportName(sportname);
    }
}
