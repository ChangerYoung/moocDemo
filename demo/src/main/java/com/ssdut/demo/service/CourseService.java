package com.ssdut.demo.service;

import java.util.List;

import com.ssdut.demo.pojo.course;

public interface CourseService {
	List<course> getCourseByTeacherId(int teacher_id);
	int addCourse(course record);
	int deleteCourseById(int id);
	course getCourseByCourseId(int id);
	int updateCourse(course record);
	List<course> getCourseByType(int type);
}

