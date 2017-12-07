package com.ssh.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Goods;
import com.ssh.entity.Log;
import com.ssh.entity.OrdersGoods;
import com.ssh.entity.Ordertable;
import com.ssh.entity.User;
import com.ssh.util.MyHibernateDaoSupport;

@Repository("orderDao")
public class OrderDaoIml extends MyHibernateDaoSupport implements OrderDao {

	@Override
	public List<OrdersGoods> addOrder(Ordertable ordertable) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();

		Goods goods = (Goods) session.load(Goods.class, ordertable.getGoodsId());
		User user = (User) session.load(User.class, ordertable.getUserId());

		ordertable.setAddress(user.getAddress());
		ordertable.setGoodsname(goods.getGoodsname());
		ordertable.setPrice(goods.getNewprice());
		ordertable.setStatus("Î´Ö§¸¶");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(new Date());
		ordertable.setBuytime(dateString);

		session.save(ordertable);

		Criteria criteria = session.createCriteria(Ordertable.class);
		criteria.add(Restrictions.eq("userId", ordertable.getUserId()));

		List<Ordertable> list2 = criteria.list();
		List<OrdersGoods> ordersGoodslist = new ArrayList<OrdersGoods>();
		for (Ordertable or : list2) {
			OrdersGoods ordersGoods = new OrdersGoods();
			ordersGoods.setId(or.getId());
			ordersGoods.setGoodsname(or.getGoodsname());
			ordersGoods.setAddress(or.getAddress());
			ordersGoods.setBuytime(or.getBuytime());
			ordersGoods.setUserId(or.getUserId());
			ordersGoods.setGoodsId(or.getGoodsId());
			ordersGoods.setStatus(or.getStatus());
			System.out.println(or.getGoodsId());
			Goods goods1 = (Goods) session.load(Goods.class, or.getGoodsId());
			User user1 = (User) session.load(User.class, or.getUserId());

			ordersGoods.setNewprice(goods1.getNewprice());
			ordersGoods.setIntroduce(goods1.getIntroduce());
			ordersGoods.setCategory(goods1.getCategory());
			ordersGoods.setImages(goods1.getImages());

			ordersGoods.setName(user1.getName());
			ordersGoods.setPhone(user1.getPhone());

			ordersGoodslist.add(ordersGoods);
		}

		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return ordersGoodslist;
	}

	@Override
	public void updateUser(Ordertable ordertable) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<OrdersGoods> selectOrder(int userId) {
		// TODO Auto-generated method stub

		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		Criteria criteria = session.createCriteria(Ordertable.class);
		criteria.add(Restrictions.eq("userId", userId));

		List<Ordertable> list2 = criteria.list();
		List<OrdersGoods> ordersGoodslist = new ArrayList<OrdersGoods>();
		for (Ordertable or : list2) {
			OrdersGoods ordersGoods = new OrdersGoods();
			ordersGoods.setId(or.getId());
			ordersGoods.setGoodsname(or.getGoodsname());
			ordersGoods.setAddress(or.getAddress());
			ordersGoods.setBuytime(or.getBuytime());
			ordersGoods.setUserId(or.getUserId());
			ordersGoods.setGoodsId(or.getGoodsId());
			ordersGoods.setStatus(or.getStatus());

			Goods goods1 = (Goods) session.load(Goods.class, or.getGoodsId());
			User user1 = (User) session.load(User.class, or.getUserId());

			ordersGoods.setNewprice(goods1.getNewprice());
			ordersGoods.setIntroduce(goods1.getIntroduce());
			ordersGoods.setCategory(goods1.getCategory());
			ordersGoods.setImages(goods1.getImages());

			ordersGoods.setName(user1.getName());
			ordersGoods.setPhone(user1.getPhone());

			ordersGoodslist.add(ordersGoods);
		}

		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();

		return ordersGoodslist;
	}

	@Override
	public void delOrder(int orderId) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();

		int t = session.createQuery("delete From Ordertable o where o.id=:id").setInteger("id", orderId)
				.executeUpdate();

		System.out.println("É¾³ý" + t);

		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
	}

	@Override
	public void save(Log log) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		session.save(log);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}

}
