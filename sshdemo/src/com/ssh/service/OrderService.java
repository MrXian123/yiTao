package com.ssh.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssh.entity.OrdersGoods;
import com.ssh.entity.Ordertable;
import com.ssh.entity.User;

 
public interface OrderService {
	public List<OrdersGoods> save(Ordertable ordertable);
	public List<OrdersGoods> getOrders(int userId);
	public void delOrders(int orderId);

}
