package com.ssh.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.GoodDao;
import com.ssh.entity.Goods;

public class DetailAction extends ActionSupport {

	@Resource
	private GoodDao goodDao;
	private Goods goods;
	List<Goods> goodslist = new ArrayList<Goods>();

	public List<Goods> getGoodslist() {
		return goodslist;
	}

	public void setGoodslist(List<Goods> goodslist) {
		this.goodslist = goodslist;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Action(value = "detailAction", results = { @Result(name = "detailSuccess", location = "/details.jsp") })
	public String search() {
		 HttpServletRequest request = ServletActionContext.getRequest();
		 int id = Integer.parseInt(request.getParameter("id"));
		 System.out.println(id);
		 setGoods(goodDao.getGoodsById(id));
		 int id1 = goods.getId();
		 String images = goods.getImages();
		 String name=goods.getGoodsname();
		 String introduce = goods.getIntroduce();
		 String newprice = goods.getNewprice();
		 String category = goods.getCategory();
		 String status = goods.getStatus();
		 System.out.println("id:"+id1);
		 
		 ActionContext.getContext().getSession().put("goodsId",id1);
		 ActionContext.getContext().getSession().put("images",images);
		 ActionContext.getContext().getSession().put("goodsname",name);
		 ActionContext.getContext().getSession().put("introduce",introduce);
		 ActionContext.getContext().getSession().put("newprice",newprice);
		 ActionContext.getContext().getSession().put("category",category);
		 ActionContext.getContext().getSession().put("status",status);
		 return "detailSuccess";

	}

}
