package com.ssdut.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssdut.demo.pojo.course;
import com.ssdut.demo.pojo.coursedetails;
import com.ssdut.demo.pojo.user_info;
import com.ssdut.demo.service.impl.CourseDetailServiseImpl;
import com.ssdut.demo.service.impl.CourseServiceImpl;
import com.ssdut.demo.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private CourseServiceImpl courseService;
	@Autowired
	private UserServiceImpl userInfoService;
	@Autowired
	private CourseDetailServiseImpl coursedetailService;
	@RequestMapping("/addCourse")
	public ModelAndView addCourse(course record,HttpSession httpSession) {
		//根据上传的piurl获得图片名
		int userid = (Integer)httpSession.getAttribute("userid");
		String picurl = record.getPicurl();
		//System.out.println("picurl:"+picurl);
		picurl = userid+"_"+picurl.substring(picurl.lastIndexOf("\\")+1);
		System.out.println("picurl:"+picurl);
		record.setPicurl(picurl);
		if(record.getCourseid()!=null){
			courseService.updateCourse(record);
		}
		else{
			courseService.addCourse(record);
		}
		String username = (String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		//System.out.println(user.getUserid());
		List<course> course_list = courseService.getCourseByTeacherId(user.getUserid());
		ModelAndView modelAndView = new ModelAndView("teacher/home");
		modelAndView.addObject("usertype","教师");
		modelAndView.addObject("user",user);
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("course_list",course_list);
		return modelAndView;
	}
	/*
	 * 删除当前课程
	 */
	@RequestMapping("/deleteCourse")
	public ModelAndView deleteCourse(int courseId,HttpSession httpSession) {
		//根据上传的piurl获得图片名
		//Integer id = (Integer) request.getAttribute("courseId");
		//request.get
		System.out.println("id:"+courseId);
		//if(courseId!=null){
			courseService.deleteCourseById(courseId);
		//}
		String username = (String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		//System.out.println(user.getUserid());
		List<course> course_list = courseService.getCourseByTeacherId(user.getUserid());
		ModelAndView modelAndView = new ModelAndView("teacher/home");
		modelAndView.addObject("usertype","教师");
		modelAndView.addObject("user",user);
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("course_list",course_list);
		return modelAndView;
	}
	/*
	 * 返回我的课程界面
	 * 
	 */
	@RequestMapping("/toMyCourse")
	public ModelAndView toMyCourse(HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		//System.out.println(user.getUserid());
		List<course> course_list = courseService.getCourseByTeacherId(user.getUserid());
		ModelAndView modelAndView = new ModelAndView("teacher/home");
		modelAndView.addObject("usertype","教师");
		modelAndView.addObject("user",user);
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("course_list",course_list);
		return modelAndView;
	}
	/*
	 * 编辑当前课程
	 */
	@RequestMapping("/editCourse")
	public ModelAndView editCourse(int courseId,HttpSession httpSession) {
		//根据courseid查找课程
		course cou = courseService.getCourseByCourseId(courseId);
		ModelAndView modelAndView = new ModelAndView("teacher/add_course");
		modelAndView.addObject("course",cou);
		return modelAndView;
	}
	/*
	 * 显示课程章节列表
	 */
	@RequestMapping("/showCourseList")
	public ModelAndView showCourseList(int courseId,HttpSession httpSession) {
		//根据courseid查找课程
		course cou = courseService.getCourseByCourseId(courseId);
		List<coursedetails> cou_details_list = coursedetailService.selectByCourseId(courseId);
		ModelAndView modelAndView = new ModelAndView("student/course_content");
		modelAndView.addObject("cou_details_list",cou_details_list);
		modelAndView.addObject("course",cou);
		return modelAndView;
	}
	/*
	 * 跳转到index页面
	 */
	@RequestMapping("/toIndex")
	public ModelAndView toIndex(HttpSession httpSession) {
		String username=(String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		ModelAndView modelAndView=new ModelAndView("index");
		modelAndView.addObject("user",user);
		//当前四种类型的所有课程
		List<course> course_list0 =courseService.getCourseByType(0); 
		List<course> course_list1 =courseService.getCourseByType(1);
		List<course> course_list2 =courseService.getCourseByType(2);
		List<course> course_list3 =courseService.getCourseByType(3);
		modelAndView.addObject("course_list0",course_list0);
		modelAndView.addObject("course_list1",course_list1);
		modelAndView.addObject("course_list2",course_list2);
		modelAndView.addObject("course_list3",course_list3);
		return modelAndView;
	}
}
