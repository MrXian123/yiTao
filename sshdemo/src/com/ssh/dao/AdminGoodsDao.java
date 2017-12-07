package com.ssh.dao;

import java.util.List;

import com.ssh.entity.Goods;
import com.ssh.entity.User;

public interface AdminGoodsDao {
	 
	public void updata(Goods goods);
	public void del(int id);
	public List<Goods> selectAll();
	public List<Goods> select();
	public  List<Goods>  isExitByName(Goods goods);
}
