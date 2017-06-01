package com.ssdut.demo.service;

import java.util.List;

import com.ssdut.demo.pojo.coursedetails;

public interface CourseDetailService {
	List<coursedetails> selectByCourseId(int courseid);
	int addCourseDetails(coursedetails record);
	coursedetails selectByClassId(int classid);
	int deleteByClassId(int classid);
}
