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

	// �ϴ��ļ�������
	private String uploadContentType;
	// �ϴ��ļ�������
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
		
		// �����ļ��ϴ���·��
		String path = "D:/Users/lenovo/Java frameworkspace/sshdemo/WebContent/images";
		//String path = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/sshdemo/images";
		System.out.println(path);
		// ����·��������һ���ļ�
		File file = new File(path);
		// �ж�file�Ƿ���ڣ���������ڣ����Զ�����һ��
		if (!file.exists()) {
			file.mkdirs();
		}
		// ͨ������copyFile()������ָ�����ļ�copy��ָ����·����
		FileUtils.copyFile(upload, new File(file, uploadFileName));
		System.out.println(uploadFileName.substring(uploadFileName.lastIndexOf('\\') + 1));
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		goods.setImages(uploadFileName);
		goods.setUserId(String.valueOf(user2.getId()));
		
		goods.setStatus("δ���");
		goods.setDatetime(dateString);
		this.goodDao.addGoods(goods);
		return SUCCESS;
	}
}
