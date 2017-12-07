package com.ssh.dao;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;


public interface UserDao {
	//添加
	public void addUser(User user);
	//删除
	public void delUser(int id);
	//修改
	public void updateUser(User user);
	//查询所有用户
	public List<User> selectUser();
	
	//查询管理员
	public List<User> adminselectUser();
	
	//已用户名查询用户
	public User isByName(User user);
	
	//根据id获得user
	public User getUserByUserId(int id);

	public User  isExitByName(String loginid);
	//登录
	public boolean isExitByNameAndPass(User user);
}
