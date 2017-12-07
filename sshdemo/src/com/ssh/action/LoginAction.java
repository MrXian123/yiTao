package com.ssh.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.UserDao;
import com.ssh.entity.User;
import com.ssh.service.UserServiceImpl;

public class LoginAction extends ActionSupport {

	@Resource
	private UserDao userDao;
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Autowired
	private UserServiceImpl UserServiceImpl;

	@Action(value = "loginAction", results = { @Result(name = "loginSuccess", location = "/default.jsp"),
			@Result(name = "loginFailer", location = "/loginerror.jsp"), 
			@Result(name = "adminFailer", location = "/adminerror.jsp")})
	// 登录
	public String login() {
		boolean flag = UserServiceImpl.isExitByNameAndPass(user);
		if (flag) {
			User user2 = (User) ActionContext.getContext().getSession().get("userid");
			int id = user2.getId();
			String loginid = user2.getLoginid();
			String password = user2.getPassword();
			String role = user2.getRole();
			String name = user2.getName();
			String phone = user2.getPhone();
			String address = user2.getAddress();
			String mail = user2.getMail();

			ActionContext.getContext().getSession().put("id", id);
			ActionContext.getContext().getSession().put("loginid", loginid);
			ActionContext.getContext().getSession().put("password", password);
			ActionContext.getContext().getSession().put("role", role);
			ActionContext.getContext().getSession().put("name", name);
			ActionContext.getContext().getSession().put("phone", phone);
			ActionContext.getContext().getSession().put("address", address);
			ActionContext.getContext().getSession().put("mail", mail);
			User user3 = (User) ActionContext.getContext().getSession().get("userid");
			String role1= user3.getRole() ;
			if (role1.equals("1")) {
				System.out.println("普通用户");
				return "loginSuccess";
			} else {
				System.out.println("管理员用户");
				return "adminFailer";
			}
		}
		return "loginFailer";
	}
	
	@Action(value = "adminAction", results = {  
			@Result(name = "Admin", location = "/admin/index.jsp"),
			@Result(name = "Failer", location = "/admin/login.jsp") })
	//管理员登录
	public String loginadmin() {
		boolean flag = UserServiceImpl.isExitByNameAndPass(user);
		if (flag) {
			User user2 = (User) ActionContext.getContext().getSession().get("userid");
			String role= user2.getRole() ;
			if (role.equals("0")) {
				System.out.println("管理员用户");
				return "Admin";
			} else {
				System.out.println("普通用户");
				return "Failer";
			}
		}
		System.out.println("fail");
		return "Failer";
	}

	@Action(value = "registerAction", results = {
			@Result(name = "registerSuccess", location = "/registersuccess.jsp") })
	// 注册
	public String register() {
		user.setRole("1");
		this.UserServiceImpl.addUser(user);
		return "registerSuccess";

	}
	@Action(value = "addadmin", results = {
			@Result(name = "registerSuccess", location = "/admin/index.jsp") })
	//后台添加用户
	public String admin() {
		this.UserServiceImpl.addUser(user);
		return "registerSuccess";

	}

}
