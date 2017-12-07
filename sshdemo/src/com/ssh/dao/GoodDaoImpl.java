package com.ssh.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Goods;
import com.ssh.entity.User;
import com.ssh.util.MyHibernateDaoSupport;

@Repository("goodDao")
public class GoodDaoImpl extends MyHibernateDaoSupport implements GoodDao {
	// 以商品类型查询
	@Override
	public List<Goods> isExitByName(Goods goods) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		// String hql = "From Goods where goosname like '%" + goods + "%'";
		// List users = (List) session.createQuery("From Goods u where
		// u.goodsname=:goodsname").setString("goodsname",
		// goods.getGoodsname()).list();
//		List users = (List) session.createQuery("From Goods u where u.category=:category")
//				.setString("category", goods.getCategory()).list();
//		
		
		String hql="FROM Goods  where goodsname like ? ";
		org.hibernate.Query query = session.createQuery(hql); 
		query.setString(0, "%"+goods.getCategory()+"%");
		 List users=  query.list();
		 
		System.out.println(users.size());
		if (users.size() > 0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return users;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
	}

	// 以商品名称模糊查询
	@Override
	public List<Goods> isGoodsname(String goodsname) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		String hql = "From Goods where goodsname like '%" + goodsname + "%'";
		Query query = session.createQuery(hql);
		List users = query.list();
		System.out.println(users.size());
		if (users.size() > 0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return users;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
	}

	// 以商品id查询
	@Override
	public Goods getGoodsById(int id) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		Goods goods = (Goods) session.load(Goods.class, id);
		System.out.println(goods.getId());
		System.out.println(goods.getImages());
		System.out.println(goods.getGoodsname());
		System.out.println(goods.getIntroduce());
		System.out.println(goods.getNewprice());
		System.out.println(goods.getCategory());
		System.out.println(goods.getStatus());
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return goods;
	}

	// 发布商品
	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();

		session.save(goods);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}

	@Override
	public List<Goods> selectGoods() {
		// TODO Auto-generated method stub
		List<Goods> goods = new ArrayList<Goods>();
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		Query query = session.createQuery("From Goods where status='热销中' order by datetime desc");
		query.setFirstResult(0);
		query.setMaxResults(8);
		List list = query.list();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Goods u = (Goods) iterator.next();
			goods.add(u);
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return goods;
	}
}
