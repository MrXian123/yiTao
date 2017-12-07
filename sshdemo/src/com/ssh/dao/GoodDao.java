package com.ssh.dao;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;

public interface GoodDao {
	// ����Ʒ���Ͳ�ѯ
	public List<Goods> isExitByName(Goods goods);
	
	//����Ʒ����ģ����ѯ
	public List<Goods> isGoodsname(String goodsname);

	// ����Ʒid��ѯ
	public Goods getGoodsById(int id);
	//������Ʒ
	public void addGoods(Goods goods);
	//��ѯ��Ʒ
	public List<Goods> selectGoods();
}
