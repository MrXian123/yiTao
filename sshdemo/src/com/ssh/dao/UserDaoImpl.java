package com.ssh.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.entity.Goods;
import com.ssh.entity.User;
import com.ssh.util.MyHibernateDaoSupport;

@Repository("userDao")
public class UserDaoImpl extends MyHibernateDaoSupport implements UserDao {

	
	@Override
	public void addUser(User user) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		session.save(user);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}

	@Override
	public void delUser(int id) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		User u = new User(id);
		session.delete(u);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}

	@Override
	public void updateUser(User user) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		session.update(user);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();

	}

	@Override
	public List<User> selectUser() {
		List<User> users = new ArrayList<User>();
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List list = session.createQuery("From User").list();
		if (list.size()>0) {
			System.out.println("用户列表"+list.size());
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				User u = (User) iterator.next();
				users.add(u);
			}
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return users;
		}
		System.out.println("hhhhhhhhhh"+list.size());

		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
		
	}

	@Override
	public User getUserByUserId(int id) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		// load 是说明数据库中一定存在这条记录，没有则报出：ObjectNotFoundException
		// get 如果查不到记录，返回的是一个null
		User user = (User) session.load(User.class, id);
		System.out.println(user.getId());
		System.out.println(user.getLoginid());
		System.out.println(user.getPassword());
		System.out.println(user.getRole());
		System.out.println(user.getName());
		System.out.println(user.getPhone());
		System.out.println(user.getAddress());
		System.out.println(user.getMail());
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return user;
	}

	@Override
	public User isExitByName(String loginid) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List  users=   session.createQuery("From User u where u.loginid=:loginid").setString("loginid", loginid)
				.list();
		if (users.size()>0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return (User) users.get(0);
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return null;
	}
	//登录
	@Override
	public boolean isExitByNameAndPass(User user) {
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List users = (List) session.createQuery("From User u where u.loginid=:loginid and u.password=:password")
				.setString("loginid", user.getLoginid()).setString("password", user.getPassword()).list();
		System.out.println(user.getLoginid());
		
		if (users.size() > 0) {
			try {
				tc.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
			User user2=(User) users.get(0);
			user2.getId();
			user2.getLoginid();
			user2.getPassword();
			user2.getRole();
			user2.getName();
			user2.getPhone();
			user2.getAddress();
			user2.getMail();
//			ActionContext.getContext().put("userid", user2);
			System.out.println(user2.getLoginid());
			ActionContext.getContext().getSession().put("userid", user2);
			session.close();
			System.out.println(user2.getId());
			return true;
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return false;
	}

	@Override
	public List<User> adminselectUser() {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<User>();
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		List list = session.createQuery("From User where role = 0 ").list();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			User u = (User) iterator.next();
			users.add(u);
		}
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return users;
	}
	//用户名查询用户
	@Override
	public User isByName(User user) {
		// TODO Auto-generated method stub
		
		return null;
	}

}
