package com.ssdut.demo.dao;

import com.ssdut.demo.pojo.courseselect;
import com.ssdut.demo.pojo.courseselectKey;

public interface courseselectMapper {
    int deleteByPrimaryKey(courseselectKey key);

    int insert(courseselect record);

    int insertSelective(courseselect record);

    courseselect selectByPrimaryKey(courseselectKey key);

    int updateByPrimaryKeySelective(courseselect record);

    int updateByPrimaryKey(courseselect record);
}