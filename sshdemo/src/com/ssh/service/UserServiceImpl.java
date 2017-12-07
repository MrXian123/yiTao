package com.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssh.dao.GoodDao;
import com.ssh.dao.UserDao;
import com.ssh.entity.Goods;
import com.ssh.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	private GoodDao goodDao;

	@Override
	public User  isExitUser(String loginid) {
		// TODO Auto-generated method stub
		return userDao.isExitByName(loginid);
	}

	@Override
	public boolean isExitByNameAndPass(User user) {
		// TODO Auto-generated method stub
		return userDao.isExitByNameAndPass(user);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		List<User> users = userDao.selectUser();
		return users;
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		userDao.delUser(id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserId(id);
	}

}
