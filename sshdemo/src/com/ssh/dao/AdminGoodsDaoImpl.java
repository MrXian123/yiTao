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

@Repository("adminGoodsDao")
public class AdminGoodsDaoImpl extends MyHibernateDaoSupport implements AdminGoodsDao {


	@Override
	public void updata(Goods goods) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		System.out.println("dao中获取"+goods.getId());
		session.update(goods);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
			
		int t= session.createQuery("delete From Goods g where g.id=:id").setInteger("id", id).executeUpdate();
		 
		System.out.println("删除"+t);
		 
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	 

		session.close();
	}

	@Override
	public List<Goods> selectAll() {
		// TODO Auto-generated method stub
		
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List goods = (List) session.createQuery("From Goods g where g.status=:status")
				.setString("status", "未审核").list();
		System.out.println(goods.size());
		if (goods.size() > 0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return goods;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
		 
	}

	@Override
	public List<Goods> select() {
		// TODO Auto-generated method stub

		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List goods = (List) session.createQuery("From Goods g where g.status=:status")
				.setString("status", "热销中").list();
		System.out.println(goods.size());
		if (goods.size() > 0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return goods;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
	}
	
	@Override
	public  List<Goods>  isExitByName(Goods goods) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		
		String hql="FROM Goods  where goodsname like ? ";
		org.hibernate.Query query = session.createQuery(hql); 
		query.setString(0, "%"+goods.getGoodsname()+"%");
		 List goods2=  query.list();
		System.out.println(goods2.size());
		 
		if (goods2.size()>0  ) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return   goods2 ;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
	}
	 
}
