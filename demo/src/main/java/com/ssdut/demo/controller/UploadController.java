package com.ssdut.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssdut.demo.service.UploadService;
import com.ssdut.demo.util.PublicMethod;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@Autowired
	UploadService uploadService;
	
	//上传图片
	@RequestMapping(value="/fileUpload",method=RequestMethod.POST)
	@ResponseBody
	public Map fileUpload(@RequestParam("file") MultipartFile file,HttpServletRequest req,HttpSession httpSession) throws IllegalStateException, IOException{		
		Map<String,String>  map = new HashMap<String, String>();
		System.out.println("start!");
		int code = uploadService.isValid(file);//判断文件类型以及大小是否允许上传
		System.out.println("code!");
		String filename = "";//文件原名称
		String newFilename = "";//文件重命名之后的名称
		map.put("code",code+"");
		
		if(code >= 3){
			//如果文件可以上传才可以进行上传
			 //1：格式不允许    2：文件大小超过限制    3：上传的图片   4:上传的视频   5：上传的音频  6上传的pdf
			String path = req.getSession().getServletContext().getRealPath("/WEB-INF/static/images");//路径
			//String path = "http://localhost:8080"+req.getContextPath()+"/uploadfile/images";
			String fileExt = "";//文件格式
			if(file != null){
				int userid = (Integer) httpSession.getAttribute("userid");
				filename = file.getOriginalFilename();
				System.out.println("Filename:"+filename);
				fileExt = filename.substring(filename.lastIndexOf("\\")+1);
				newFilename = userid +"_"+ fileExt;//文件重命名之后的名称
				System.out.println("newFilename:"+newFilename);
				File target = new File(path,newFilename);
				FileUtils.copyInputStreamToFile(file.getInputStream(),target);	
			}			
		}
		map.put("filename", filename);
		map.put("newfilename", newFilename);
		return map;
	}
		/*
		 * 上传章节的ppt和video
		 */
		@RequestMapping(value="/uploadVideoAndPPT",method=RequestMethod.POST)
		@ResponseBody
		public Map uploadVideoAndPPT(@RequestParam("video") MultipartFile video,@RequestParam("ppt") MultipartFile ppt,HttpServletRequest req,HttpSession httpSession) throws IllegalStateException, IOException{		
			Map<String,String>  map = new HashMap<String, String>();
			System.out.println("start!");
			int code1 = uploadService.isValid(video);//判断文件类型以及大小是否允许上传
			int code2 = uploadService.isValid(ppt);//判断文件类型以及大小是否允许上传
			System.out.println("code!");
			String filename_video = "";//文件原名称
			String newFilename_video = "";//文件重命名之后的名称
			String filename_ppt = "";//文件原名称
			String newFilename_ppt = "";//文件重命名之后的名称
			map.put("code1",code1+"");
			map.put("code2",code2+"");
			
			if(code1 >= 3&&code2>=3){
				//如果文件可以上传才可以进行上传
				 //1：格式不允许    2：文件大小超过限制    3：上传的图片   4:上传的视频   5：上传的音频  6上传的pdf
				String path_video = req.getSession().getServletContext().getRealPath("/WEB-INF/static/videos");//路径
				String path_ppt = req.getSession().getServletContext().getRealPath("/WEB-INF/static/ppts");//路径
				//String path = "http://localhost:8080"+req.getContextPath()+"/uploadfile/images";
				String fileExt_video = "";//文件格式
				String fileExt_ppt = "";
				if(video != null){
					int userid = (Integer) httpSession.getAttribute("userid");
					filename_video = video.getOriginalFilename();
					System.out.println("Filename:"+filename_video);
					fileExt_video = filename_video.substring(filename_video.lastIndexOf("\\")+1);
					newFilename_video = userid +"_"+ fileExt_video;//文件重命名之后的名称
					System.out.println("newFilename:"+newFilename_video);
					File target = new File(path_video,newFilename_video);
					FileUtils.copyInputStreamToFile(video.getInputStream(),target);	
				}
				if(ppt != null){
					int userid = (Integer) httpSession.getAttribute("userid");
					filename_ppt = ppt.getOriginalFilename();
					System.out.println("Filename:"+filename_ppt);
					fileExt_ppt = filename_ppt.substring(filename_ppt.lastIndexOf("\\")+1);
					newFilename_ppt = userid +"_"+ fileExt_ppt;//文件重命名之后的名称
					System.out.println("newFilename_ppt:"+newFilename_ppt);
					File target = new File(path_ppt,newFilename_ppt);
					FileUtils.copyInputStreamToFile(ppt.getInputStream(),target);	
				}
			}
			map.put("filename_video", filename_video);
			map.put("newfilename_video", newFilename_video);
			map.put("filename_ppt", filename_ppt);
			map.put("newfilename_ppt", newFilename_ppt);
			return map;
		}
	
	//删除上传的图片
	@RequestMapping(value="/deleteFile",method=RequestMethod.GET)
	public void deleteByFileName(HttpServletRequest req){
		String filename = req.getParameter("filename");
		String path = req.getSession().getServletContext().getRealPath("/uploadfile/images");//路径
		PublicMethod.deleteFileByPathAndName(path, filename);
	}
	
}
