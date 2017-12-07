package com.ssh.util;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Log;
import com.ssh.util.MyHibernateDaoSupport;

@Repository("LogDao")
public class LogsDaoImpl extends MyHibernateDaoSupport implements LogsDao{

	 

	@Override
	public void save(Log log) {
		// TODO Auto-generated method stub
		Session session = this.getSession(true);
		Transaction tc = (Transaction) session.beginTransaction();
		session.save(log);
		try {
			tc.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}
	
}
