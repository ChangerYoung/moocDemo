package com.ssdut.demo.dao;

import java.util.List;

import com.ssdut.demo.pojo.coursedetails;
import com.ssdut.demo.pojo.coursedetailsKey;

public interface coursedetailsMapper {
    int deleteByPrimaryKey(int classid);

    int insert(coursedetails record);

    int insertSelective(coursedetails record);

    coursedetails selectByPrimaryKey(int classid);
    
    List<coursedetails> selectByCourseId(int courseid);

    int updateByPrimaryKeySelective(coursedetails record);

    int updateByPrimaryKey(coursedetails record);
}