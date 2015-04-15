/**
 * 
 */
package com.phn.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

/**
 * @author phn
 * 
 */
public class FileUpload {
	DateFormat df = new SimpleDateFormat("yyyyMMdd-hh-mm-ss-");
	String questionTime = df.format(new Date());
	HttpServletRequest request = ServletActionContext.getRequest();

	public String PicUpload(File fileUpload, String fileUploadFileName,
			String fileUploadContentType, String savePath) throws Exception {
		// 以服务器的文件保存地址和原文件名建立上传文件输出流
		FileOutputStream fos = new FileOutputStream(ServletActionContext
				.getRequest().getRealPath(savePath)
				+ "\\"
				+ questionTime
				+ fileUploadFileName);
		// 以上传文件建立一个文件上传流
		FileInputStream fis = new FileInputStream(fileUpload);
		// 将上传文件的内容写入服务器
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		String savePicName = request.getContextPath() + savePath + "/"
				+ questionTime + fileUploadFileName.toString();
		return savePicName;
	}

}
