package com.ssdut.demo.dao;

import java.util.List;

import com.ssdut.demo.pojo.course;

public interface courseMapper {
    int deleteByPrimaryKey(Integer courseid);

    int insert(course record);

    int insertSelective(course record);

    course selectByPrimaryKey(Integer courseid);

    int updateByPrimaryKeySelective(course record);

    int updateByPrimaryKey(course record);
    
    List<course> getCoursesByTeacherId(Integer teacher_id);
    
    List<course> getCoursesByType(Integer type);
}