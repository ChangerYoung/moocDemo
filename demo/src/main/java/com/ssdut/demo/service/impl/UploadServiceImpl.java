package com.ssdut.demo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ResourceBundle;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssdut.demo.service.UploadService;
import com.ssdut.demo.util.PublicMethod;

@Service
public class UploadServiceImpl implements UploadService {

	/**
	 * 判断上传文件是否合法
	 * @param file 待判断的文件
	 * @return 非0：合法     1：格式不允许    2：文件大小超过限制    3：上传的图片   4:上传的视频   5：上传的音频  6上传的pdf
	 * @throws IOException 
	 */
	private final String  PROFILENAME = "uploadconf";
	public int isValid(MultipartFile file) throws IOException {
		// TODO Auto-generated method stub
		
		/*定义变量start**/
		String allowedExt = "" ;//允许上传的文件类型
		long allowedSize = 0L;//允许上传的文件大小
		String pic = "";//上传图片的类型
		String video = "";//上传视频的类型
		String audio = "";//上传音频的类型
		String pdf = "";//上传pdf的格式
		String fileExt = "";//上传文件的类型
		long fileSize = 0L;//上传文件的大小
		String fileName = file.getOriginalFilename();//上传文件的文件名
		/*定义变量end**/
		
		
		/*加载上传文件的配置文件 start**/
		allowedExt = PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.allowedext");//获取允许的文件拓展名
		allowedSize = Long.valueOf(PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.allowedsize"));//获取允许上传的最大单个文件大小
		pic =PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.pic");//允许的图片类型
		video = PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.video");//允许的视频类型
		audio = PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.audio");//允许的音频类型
		pdf = PublicMethod.getPropertiesByFileNameAndProName(PROFILENAME, "upload.pdf");//允许的文件类型
		
		/*加载上传文件的配置文件 end**/
		
		/**读取文件信息 start***/
		fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);//获取文件的类型
		fileSize = file.getSize();//获取文件的大小 以字节为单位                               1024B = 1KB  1024KB = 1MB 
		/**读取文件信息 end***/
		
		//判断上传的文件类型是否合法
		if (!PublicMethod.isExist(fileExt, allowedExt.split(","))){
			//如果文件类型不合法
			return 1;
		}
		if(fileSize > allowedSize){
			//如果上传的文件大小超过允许的大小
			return 2;
		}
		if(PublicMethod.isExist(fileExt, pic.split(","))){
			//上传的是图片
			return 3;
		}
		if(PublicMethod.isExist(fileExt, video.split(","))){
			//上传的是视频
			return 4;
		}
		if(PublicMethod.isExist(fileExt, audio.split(","))){
			//上传的是音频
			return 5;
		}
		if(PublicMethod.isExist(fileExt, pdf.split(","))){
			//上传的是pdf
			return 6;
		}
		return 0;
	}


}
