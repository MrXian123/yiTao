package com.ssh.dao;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;


public interface UserDao {
	//���
	public void addUser(User user);
	//ɾ��
	public void delUser(int id);
	//�޸�
	public void updateUser(User user);
	//��ѯ�����û�
	public List<User> selectUser();
	
	//��ѯ����Ա
	public List<User> adminselectUser();
	
	//���û�����ѯ�û�
	public User isByName(User user);
	
	//����id���user
	public User getUserByUserId(int id);

	public User  isExitByName(String loginid);
	//��¼
	public boolean isExitByNameAndPass(User user);
}
