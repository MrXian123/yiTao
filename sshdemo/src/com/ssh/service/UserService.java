package com.ssh.service;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;

public interface UserService {

	// 判断用户是否存在
	public User  isExitUser(String loginid);

	// 判断用户是否存在
	public boolean isExitByNameAndPass(User user);

	// 添加用户
	public void addUser(User user);

	// 查询所有用户
	public List<User> getUsers();

	// 删除用户
	public void del(int id);

	// 修改用户
	public void update(User user);

	// 根据id获得user
	public User getUserById(int id);
	


}
