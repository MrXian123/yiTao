package com.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssh.dao.GoodDao;
import com.ssh.entity.Goods;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Resource
	private GoodDao goodDao;
	
	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodDao.addGoods(goods);
	}

}
