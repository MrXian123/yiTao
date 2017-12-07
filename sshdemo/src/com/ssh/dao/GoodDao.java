package com.ssh.dao;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;

public interface GoodDao {
	// 以商品类型查询
	public List<Goods> isExitByName(Goods goods);
	
	//以商品名称模糊查询
	public List<Goods> isGoodsname(String goodsname);

	// 以商品id查询
	public Goods getGoodsById(int id);
	//发布商品
	public void addGoods(Goods goods);
	//查询商品
	public List<Goods> selectGoods();
}
