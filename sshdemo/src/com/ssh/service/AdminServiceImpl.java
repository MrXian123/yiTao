package com.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssh.dao.AdminGoodsDao;
import com.ssh.dao.UserDao;
import com.ssh.entity.Goods;
import com.ssh.entity.User;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private AdminGoodsDao adminGoodsDao;

	@Override
	public void updata(Goods goods) {
		// TODO Auto-generated method stub
		adminGoodsDao.updata(goods);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		adminGoodsDao.del(id);
	}

	@Override
	public List<Goods> selectAll( ) {
		// TODO Auto-generated method stub
	
		return 	adminGoodsDao.selectAll();
	}

	@Override
	public List<Goods> select() {
		// TODO Auto-generated method stub
		return 	adminGoodsDao.select();
	}

	@Override
	public  List<Goods>  isExitByName(Goods goods) {
		// TODO Auto-generated method stub
		return adminGoodsDao.isExitByName(goods);
	}
	
	 

}
