package com.ssh.dao;

import java.util.List;

import org.hibernate.criterion.Order;

import com.ssh.entity.Log;
import com.ssh.entity.OrdersGoods;
import com.ssh.entity.Ordertable;
import com.ssh.entity.User;

public interface OrderDao {
	
	public List<OrdersGoods> addOrder(Ordertable ordertable);
	 
	public void delOrder(int orderId);
 
	public void updateUser(Ordertable ordertable);
	
	public List<OrdersGoods> selectOrder(int userId);
	 
	public void save(Log log);

}
