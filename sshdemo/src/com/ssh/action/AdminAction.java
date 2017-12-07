package com.ssh.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.dao.AdminGoodsDao;
import com.ssh.dao.GoodDao;
import com.ssh.dao.UserDao;
import com.ssh.entity.Goods;
import com.ssh.entity.OrdersGoods;
import com.ssh.entity.User;
import com.ssh.service.AdminService;

public class AdminAction {
	
	@Resource
	private AdminService adminService;
	
	@Resource
	private GoodDao goodDao;
	
	@Resource
	private UserDao userDao;
	
	
	private Goods goods;
	
	private User user1;
	
	List<Goods> admingoodslist = new ArrayList<Goods>();
	
	List<Goods> serchgoodslist = new ArrayList<Goods>();

	List<User> users = new ArrayList<User>(); 
	
	
	
	 
	public List<Goods> getSerchgoodslist() {
		return serchgoodslist;
	}
	public void setSerchgoodslist(List<Goods> serchgoodslist) {
		this.serchgoodslist = serchgoodslist;
	}
	public User getUser1() {
		return user1;
	}
	public void setUser1(User user1) {
		this.user1 = user1;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Goods> getAdmingoodslist() {
		return admingoodslist;
	}
	public void setAdmingoodslist(List<Goods> admingoodslist) {
		this.admingoodslist = admingoodslist;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	
	@Action(value = "adminSelectAction", //未审核
			results = { @Result(name = "searchSuccess", location = "/admin/product-brand.jsp")
					 })
	public String search() {
		setAdmingoodslist(this.adminService.selectAll());
			return "searchSuccess";
	}
	
	
	
	@Action(value = "adminSelectonAction1", //已审核
			results = { @Result(name = "searchSuccess", location = "/admin/product-category.jsp")
	 })
	public String searchon() {//热销中
		setAdmingoodslist(this.adminService.select());
			return "searchSuccess";
		 
	}
	
	
	@Action(value = "admindeletgoodsAction", 
			results = { @Result(name = "Success", location = "/admin/product-category.jsp"),
					@Result(name = "NoOrder", location = "/admin/product-category.jsp"),
					@Result(name = "Failer", location = "/admin/index.jsp")})
	public String del() {//删除商品
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer goodsId = Integer.parseInt(request.getParameter("id"));
		if (user2 != null) {
			System.out.println("用户名" + user2.getLoginid());
			this.adminService.del(goodsId);
			List<Goods>  Goodss=this.adminService.select();
			setAdmingoodslist(Goodss); 
			if (Goodss!=null) {
				System.out.println("大小"+Goodss.size());
				return "Success";
			}else {
				return "NoOrder";
			}
			 
		} else {
			return "Failer";
		}
	}
	
	
	@Action(value = "adminupdatagoodsAction", 
			results = { @Result(name = "Success", location = "/admin/product-brand.jsp"),
					@Result(name = "NoGoods", location = "/admin/product-brand.jsp"),
					@Result(name = "Failer", location = "/admin/index.jsp")})
	public String updata() {//一键审核
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer goodsId = Integer.parseInt(request.getParameter("id"));
		if (user2 != null) {
			System.out.println("用户名" + user2.getLoginid());
			Goods goods1=new Goods();
			System.out.println("获取要修改的数据"+goodsId);
			goods1=goodDao.getGoodsById(goodsId);
			goods1.setStatus("热销中");
			
			this.adminService.updata(goods1);
			
			List<Goods>  Goodss=this.adminService.selectAll();
			System.out.println("查询大小"+Goodss);
			setAdmingoodslist(Goodss); 
			if (Goodss!=null) {
				System.out.println("大小"+Goodss.size());
				return "Success";
			}else {
				return "NoGoods";
			}
			 
		} else {
			return "Failer";
		}
		 
	}
	@Action(value = "adminUsersAction",
			results = { @Result(name = "Success", location = "/admin/admin-role.jsp"),
					@Result(name = "Failer", location = "/admin/index.jsp")})
	public String selectAllUsers() {//用户查询
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		 
		if (user2 != null) {
			  
			List<User>  users=this.userDao.selectUser();
			System.out.println(users.size());
			setUsers(users); 
			return "Success";
			 
			 
		} else {
			return "Failer";
		}
	}
	
	@Action(value = "adminUsers",
			results = { @Result(name = "Success", location = "/admin/admin-list.jsp"),
					@Result(name = "Failer", location = "/admin/index.jsp")})
	public String selectadminUsers() {//用户查询
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		 
		if (user2 != null) {
			  
			List<User>  users=this.userDao.adminselectUser();
			System.out.println(users.size());
			setUsers(users); 
			return "Success";
			 
			 
		} else {
			return "Failer";
		}
	}
	//以用户名查询用户
	@Action(value = "usersearchAction", 
			results = { @Result(name = "searchSuccess", location = "/admin/admin-role.jsp"),
					@Result(name = "searchFailer", location = "/admin/index.jsp")})
	public String usersearch() {
		this.goodDao.isExitByName(goods);
		if (this.goodDao.isExitByName(goods)!=null) {
			
			return "searchSuccess";
		}else {
			return "searchFailer";
		}
	}
	
	@Action(value = "adminUserIdAction",
			results = { @Result(name = "Success", location = "/admin/admin-SerchUser.jsp"),
					@Result(name = "Failer", location = "/admin/login.jsp")})
	public String selectUsers() {//用户搜索查询
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		
		System.out.println("sdafjkklasdjf;laksadjfl;sdajflkjsdl;f");
		if (user2 != null) {
			  System.out.println("输出用户名"+user1.getLoginid());
			  setUser1(this.userDao.isExitByName(user1.getLoginid()));
 			return "Success";
			 
			 
		} else {
			return "Failer";
		}
	}
	
	
	
	@Action(value = "serchbyNameAction",
			results = { @Result(name = "Success", location = "/admin/product-category2.jsp"),
					@Result(name = "Failer", location = "/admin/login.jsp")})
	public String serchGoodsByName() {//商品搜索查询
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if (user2 != null) {
			  setSerchgoodslist(this.adminService.isExitByName(goods));
 			return "Success";
			 
			 
		} else {
			return "Failer";
		}
	}
	
	 
}
