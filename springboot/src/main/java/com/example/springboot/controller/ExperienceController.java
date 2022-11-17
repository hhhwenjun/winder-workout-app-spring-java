package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.dao.ExperienceDao;
import com.example.springboot.entity.Experience;
import com.example.springboot.entity.Sport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/experience")
public class ExperienceController {

    @Autowired
    private ExperienceDao experienceDao;

    @GetMapping
    public List<Experience> getAllExperience() {
        return experienceDao.getAllExperience();
    }

    @GetMapping("/user-experience/{userid}")
    public List<Experience> getExperienceByUserId(@PathVariable Integer userid) {
        return experienceDao.getExperienceByUserId(userid);
    }

    @GetMapping("/new-sport/{userid}")
    public List<Sport> getNewSportByUserId(@PathVariable Integer userid) {
        return experienceDao.getNewSportByUserId(userid);
    }

    @DeleteMapping("/delete-experience/{userid}/{sportid}")
    public Result deleteByUserSportId(@PathVariable Integer userid, @PathVariable Integer sportid) {
        if (userid == null || sportid == null || userid == 0 || sportid == 0) {
            return Result.error("Wrong Id");
        }
        return Result.success(experienceDao.deleteByUserSportId(userid, sportid) == 1);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Result update(Experience experience) {
        List<Experience> userSports = getExperienceByUserId(experience.getUserid());
        if (userSports != null){
            for (Experience userSport : userSports){
                if (userSport.getSportid() == experience.getSportid()
                        && userSport.getUserid() == experience.getUserid()){
                    // update
                    experienceDao.update(experience);
                    Experience result = experienceDao.getUserSportLevel(experience.getUserid(), experience.getSportid());
                    return Result.success(result);
                }
            }
        }
        return Result.error("Missing user or sport");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Result create(@RequestBody Experience experience) {
        Integer sportId = experience.getSportid();
        List<Experience> userSports = getExperienceByUserId(experience.getUserid());
        if (userSports != null){
            for (Experience userSport : userSports){
                if (Objects.equals(userSport.getSportid(), sportId)){
                    // already created it, no need to create, but need to update
                    return Result.error("Exist user and this sport");
                }
            }
        }
        experienceDao.insert(experience);
        Experience result = experienceDao.getUserSportLevel(experience.getUserid(), experience.getSportid());
        if (result == null) {
            return Result.error("Create failed");
        }
        return Result.success(result);
    }
}
