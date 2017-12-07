package com.ssh.service;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;

public interface UserService {

	// �ж��û��Ƿ����
	public User  isExitUser(String loginid);

	// �ж��û��Ƿ����
	public boolean isExitByNameAndPass(User user);

	// ����û�
	public void addUser(User user);

	// ��ѯ�����û�
	public List<User> getUsers();

	// ɾ���û�
	public void del(int id);

	// �޸��û�
	public void update(User user);

	// ����id���user
	public User getUserById(int id);
	


}
