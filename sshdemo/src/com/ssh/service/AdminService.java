package com.ssh.service;

import java.util.List;

import com.ssh.entity.Goods;

public interface AdminService {

	public void updata(Goods goods);
	public void del(int id);
	public List<Goods> selectAll( );
	public List<Goods> select();
	public  List<Goods> isExitByName(Goods goods);
	
}
