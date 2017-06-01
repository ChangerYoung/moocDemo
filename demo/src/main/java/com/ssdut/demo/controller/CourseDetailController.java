package com.ssdut.demo.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/courseDetail")
public class CourseDetailController {
	@Autowired
	private CourseDetailServiseImpl coursedetailService;
	@Autowired
	private UserServiceImpl userInfoService;
	@Autowired
	private CourseServiceImpl courseService;
	/*
	 * 跳转到编辑章节界面
	 */
	@RequestMapping("/editChapter")
	public ModelAndView addCourse(int courseId,HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		course cou = courseService.getCourseByCourseId(courseId);
		//System.out.println(user.getUserid());
		List<coursedetails> coursedetails_list = coursedetailService.selectByCourseId(courseId);
		ModelAndView modelAndView = new ModelAndView("teacher/add_chapter");
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("coursedetails_list",coursedetails_list);
		modelAndView.addObject("user",user);
		modelAndView.addObject("course",cou);
		modelAndView.addObject("number",coursedetails_list.size());
		return modelAndView;
	}
	/*
	 * 新增章节
	 */
	@RequestMapping("/addChapter")
	public ModelAndView addChapter(coursedetails detail,HttpSession httpSession) {
		int userid = (Integer)httpSession.getAttribute("userid");
		String ppt_url = detail.getPpturl();
		ppt_url = userid+"_"+ppt_url.substring(ppt_url.lastIndexOf("\\")+1);
		detail.setPpturl(ppt_url);
		String video_url = detail.getVideourl();
		video_url = userid+"_"+video_url.substring(video_url.lastIndexOf("\\")+1);
		detail.setVideourl(video_url);
		coursedetailService.addCourseDetails(detail);
		String username = (String) httpSession.getAttribute("username");
		int courseId = detail.getCourseid();
		user_info user = userInfoService.getUserByUserName(username);
		course cou = courseService.getCourseByCourseId(courseId);
		//System.out.println(user.getUserid());
		List<coursedetails> coursedetails_list = coursedetailService.selectByCourseId(courseId);
		ModelAndView modelAndView = new ModelAndView("teacher/add_chapter");
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("coursedetails_list",coursedetails_list);
		modelAndView.addObject("user",user);
		modelAndView.addObject("course",cou);
		modelAndView.addObject("number",coursedetails_list.size());
		return modelAndView;
	}
	/*
	 * 跳转到制定章节，进行学习
	 */
	@RequestMapping("/studyChapter")
	public ModelAndView studyChapter(int classid,HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		user_info user = userInfoService.getUserByUserName(username);
		//course cou = courseService.getCourseByCourseId(courseId);
		//System.out.println(user.getUserid());
		//List<coursedetails> coursedetails_list = coursedetailService.selectByCourseId(courseId);
		coursedetails cou_detail = coursedetailService.selectByClassId(classid);
		ModelAndView modelAndView = new ModelAndView("student/course_learn_on");
		//还需要获取user所有的课程，传递给home
		modelAndView.addObject("coursedetails",cou_detail);
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	/*
	 * 删除章节
	 */
	@RequestMapping("/deleteChapter")
	@ResponseBody
	public List<Integer> deleteChapter(int classid) {
		int result = coursedetailService.deleteByClassId(classid);
		System.out.println(classid+"..."+result);
		List<Integer> list = new ArrayList<Integer>();
		list.add(result);
		return list;
	}
	/*
	 * 下载章节的ppt
	 */
	@RequestMapping("/download")
	 public void download(int classid,HttpServletRequest request,HttpServletResponse response) throws Exception{  
        //获取文件名
		coursedetails cou_detail = coursedetailService.selectByClassId(classid);
		//模拟文件，myfile.txt为需要下载的文件  
        String fileName = request.getSession().getServletContext().getRealPath("WEB-INF/static/ppts")+"\\"+cou_detail.getPpturl();  
        //获取输入流  
        System.out.println("fileName:"+fileName);
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
        //假如以中文名下载的话  
        String filename = cou_detail.getCourseid()+"_"+cou_detail.getClassid()+".pdf";  
        //转码，免得文件名中文乱码  
        filename = URLEncoder.encode(filename,"UTF-8");  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();  
    }  
}
