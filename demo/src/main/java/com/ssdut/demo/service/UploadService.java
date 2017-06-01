package com.ssdut.demo.service;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
	/**
	 * 判断上传文件是否合法
	 * @param file 待判断的文件
	 * @return 0：合法     1：格式不允许    2：文件大小超过限制
	 */
	int isValid(MultipartFile file)  throws IOException;
}
