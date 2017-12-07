package com.ssh.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.UserDao;
import com.ssh.entity.User;

public class PasswordAction extends ActionSupport {
	@Resource
	private UserDao userDao;
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Action(value = "passwordAction", results = { @Result(name = "Success", location = "/personal.jsp") })
	public String search() {
		User user1 = (User) ActionContext.getContext().getSession().get("userid");
		user.setId(user1.getId());
		this.userDao.updateUser(user);
		
		return "Success";

	}
}
