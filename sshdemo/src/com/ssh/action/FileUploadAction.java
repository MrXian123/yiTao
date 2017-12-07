package com.ssh.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.GoodDao;
import com.ssh.entity.Goods;
import com.ssh.entity.User;
import com.ssh.service.GoodsServiceImpl;

public class FileUploadAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private File upload;
	
	@Resource
	private GoodDao goodDao;
	private Goods goods;
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public GoodDao getGoodDao() {
		return goodDao;
	}

	public void setGoodDao(GoodDao goodDao) {
		this.goodDao = goodDao;
	}

	// 上传文件的类型
	private String uploadContentType;
	// 上传文件的名称
	private String uploadFileName;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String dateString = formatter.format(new Date());
//    String username = (String)session.getAttribute("username");
	@Override
	public String execute() throws Exception {
		
		// 声明文件上传的路径
		String path = "D:/Users/lenovo/Java frameworkspace/sshdemo/WebContent/images";
		//String path = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/sshdemo/images";
		System.out.println(path);
		// 根据路径名创建一个文件
		File file = new File(path);
		// 判断file是否存在，如果不存在，则自动创建一个
		if (!file.exists()) {
			file.mkdirs();
		}
		// 通过调用copyFile()方法将指定的文件copy到指定的路径中
		FileUtils.copyFile(upload, new File(file, uploadFileName));
		System.out.println(uploadFileName.substring(uploadFileName.lastIndexOf('\\') + 1));
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		goods.setImages(uploadFileName);
		goods.setUserId(String.valueOf(user2.getId()));
		
		goods.setStatus("未审核");
		goods.setDatetime(dateString);
		this.goodDao.addGoods(goods);
		return SUCCESS;
	}
}
