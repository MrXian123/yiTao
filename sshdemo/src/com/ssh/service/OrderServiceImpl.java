package com.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssh.dao.OrderDao;
import com.ssh.entity.OrdersGoods;
import com.ssh.entity.Ordertable;

@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderDao orderDao;
	
	
	@Override
	public List<OrdersGoods> save(Ordertable ordertable) {
		
		return orderDao.addOrder(ordertable);
	}


	@Override
	public List<OrdersGoods> getOrders(int userId) {
		// TODO Auto-generated method stub
		return orderDao.selectOrder(userId);
	}


	@Override
	public void delOrders(int orderId) {
		// TODO Auto-generated method stub
		orderDao.delOrder(orderId); 
	}

}
