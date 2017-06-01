package com.ssdut.demo.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class CommonUtil {
	public static String saveImage(MultipartFile image, String pathRoot) throws IOException {
		String path = "";// 创建的图片的图片全名
		if (!image.isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = image.getContentType();
			// 获得文件后缀名称
			String imageName = contentType.substring(contentType.indexOf("/") + 1);
			path = uuid + "." + imageName;
			image.transferTo(new File(pathRoot, path));
		}
		return path;
	}
}
