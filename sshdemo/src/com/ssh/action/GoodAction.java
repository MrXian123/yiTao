package com.ssh.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.GoodDao;
import com.ssh.entity.Goods;
import com.ssh.service.UserService;
import com.ssh.service.UserServiceImpl;

public class GoodAction extends ActionSupport {
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

	@Action(value = "searchAction", results = { @Result(name = "searchSuccess", location = "/search.jsp"),
			@Result(name = "searchFailer", location = "/searchFailer.jsp") })
	public String search() {
		setGoodslist(this.goodDao.isExitByName(goods));
		if (this.goodDao.isExitByName(goods) != null) {

			return "searchSuccess";
		} else {
			return "searchFailer";
		}
	}

	@Action(value = "namesearchAction", results = { @Result(name = "namesearchSuccess", location = "/search.jsp"),
			@Result(name = "namesearchFailer", location = "/searchFailer.jsp") })
	public String goodsnamesearch() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		setGoodslist(this.goodDao.isGoodsname(name));
		if (this.goodDao.isGoodsname(name) != null) {

			return "namesearchSuccess";
		} else {
			return "namesearchFailer";
		}
	}
	
	@Action(value = "loadsearchAction", results = { @Result(name = "loadsearchSuccess", location = "/index.jsp"),
			@Result(name = "loadsearchFailer", location = "/searchFailer.jsp") })
	public String loadsearch() {
		setGoodslist(this.goodDao.selectGoods());
		if (this.goodDao.selectGoods() != null) {
			return "loadsearchSuccess";
		} else {
			return "loadsearchFailer";
		}
	}

}
