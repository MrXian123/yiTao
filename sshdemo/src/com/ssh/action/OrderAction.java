package com.ssh.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.GoodDaoImpl;
import com.ssh.dao.UserDaoImpl;
import com.ssh.entity.Goods;
import com.ssh.entity.OrdersGoods;
import com.ssh.entity.Ordertable;
import com.ssh.entity.User;
import com.ssh.service.OrderService;

public class OrderAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private OrderService orderService;

	private Ordertable ordertable;
	
	List<OrdersGoods> ordersGoodss=new ArrayList<OrdersGoods>();
	
	 
	public List<OrdersGoods> getOrdersGoodss() {
		return ordersGoodss;
	}

	public void setOrdersGoodss(List<OrdersGoods> ordersGoodss) {
		this.ordersGoodss = ordersGoodss;
	}

	public Ordertable getOrdertable() {
		return ordertable;
	}

	public void setOrdertable(Ordertable ordertable) {
		this.ordertable = ordertable;
	}

	@Action(value = "addorderAction", results = { @Result(name = "Failer", location = "/login.jsp"),
			@Result(name = "Success", location = "/") })
	public String addorder() {

		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer goodsId = Integer.parseInt(request.getParameter("id"));
		System.out.println("货物id" + goodsId);
		System.out.println(user2);

		if (user2 != null) {
			System.out.println("用户名" + user2.getLoginid());
			System.out.println("货物id" + goodsId);
			Ordertable ordertable1 = new Ordertable();
			System.out.println(goodsId);

			ordertable1.setUserId(user2.getId());
			ordertable1.setGoodsId(goodsId);

			 
			setOrdersGoodss(orderService.save(ordertable1));
			
			System.out.println("大小"+ordersGoodss.size());
			
			return "Success";
		} else {
			return "Failer";
		}

		//
		// List<Ordertable> list=orderService.getOrders(id);
		// System.out.println(list.size());
		// System.out.println("suss");

	}

	@Action(value = "selectOrderAction", results = { @Result(name = "Success", location = "/order.jsp"),
			@Result(name = "Failer", location = "/login.jsp"),@Result(name = "NoOrder", location = "/orderMangerFail.jsp") })
	public String selectOrder() { 
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();

		if (user2 != null) {
			System.out.println("用户名" + user2.getLoginid());
			List<OrdersGoods> ordersGoodss=orderService.getOrders(user2.getId());
			if (ordersGoodss.size()>0) {
				setOrdersGoodss(ordersGoodss);
				System.out.println("大小"+ordersGoodss.size());
				return "Success";
			}else {
				return "NoOrder";
			}
			 
			
		} else {
			return "Failer";
		}
	}
	
	@Action(value = "delOrderAction", results = { @Result(name = "Success", location = "/order.jsp"),
			@Result(name = "Failer", location = "/login.jsp"),@Result(name = "NoOrder", location = "/orderMangerFail.jsp") })
	public String delOrder() { 
		User user2 = (User) ActionContext.getContext().getSession().get("userid");
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		if (user2 != null) {
			System.out.println("用户名" + user2.getLoginid());
			 
			orderService.delOrders(orderId); 
			
			List<OrdersGoods> ordersGoodss=orderService.getOrders(user2.getId());
			if (ordersGoodss.size()>0) {
				setOrdersGoodss(ordersGoodss);
				System.out.println("大小"+ordersGoodss.size());
				return "Success";
			}else {
				return "NoOrder";
			}
			 
		} else {
			return "Failer";
		}
	}

}
