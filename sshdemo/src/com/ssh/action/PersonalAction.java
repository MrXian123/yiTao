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
import com.ssh.entity.Goods;
import com.ssh.entity.User;

public class PersonalAction extends ActionSupport {
	@Resource
	private UserDao userDao;
	private User user;
	
	List<User> userlist = new ArrayList<User>();

	public List<User> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@Action(value = "personalAction", results = { @Result(name = "Success", location = "/personal.jsp") })
	public String search() {
		 HttpServletRequest request = ServletActionContext.getRequest();
		 int id = Integer.parseInt(request.getParameter("id"));
		 System.out.println(id);
		 User user2 = (User) ActionContext.getContext().getSession().get("userid");
		 setUser(userDao.getUserByUserId(id));
		 int id1 = user2.getId();
		 String loginid = user2.getLoginid();
		 String password = user2.getPassword();
		 String role = user2.getRole();
		 String name = user2.getName();
		 String phone = user2.getPhone();
		 String address = user2.getAddress();
		 String mail = user2.getMail();
		 
		 ActionContext.getContext().getSession().put("id1",id1);
		 ActionContext.getContext().getSession().put("loginid",loginid);		 
		 ActionContext.getContext().getSession().put("password",password);
		 ActionContext.getContext().getSession().put("role",role);
		 ActionContext.getContext().getSession().put("name",name);
		 ActionContext.getContext().getSession().put("phone",phone);
		 ActionContext.getContext().getSession().put("address",address);
		 ActionContext.getContext().getSession().put("mail",mail);
		 return "Success";

	}

}
