package com.ssdut.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssdut.demo.dao.coursedetailsMapper;
import com.ssdut.demo.dao.user_infoMapper;
import com.ssdut.demo.pojo.coursedetails;
import com.ssdut.demo.service.CourseDetailService;

@Service
public class CourseDetailServiseImpl implements CourseDetailService{
	@Autowired
	private coursedetailsMapper course_detailMapper;
	public List<coursedetails> selectByCourseId(int courseid){
		return course_detailMapper.selectByCourseId(courseid);
	}
	public int addCourseDetails(coursedetails record){
		return course_detailMapper.insert(record);
	} 
	public coursedetails selectByClassId(int classid){
		return course_detailMapper.selectByPrimaryKey(classid);
	}
	public int deleteByClassId(int classid){
		return course_detailMapper.deleteByPrimaryKey(classid);
	}
}
