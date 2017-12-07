package com.ssh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "log")
public class Log {
	 
	
		private int id;
		private int userid;
		private String username;
		private String datatime;
		private String method;
		 
		
		
		@Id
		@Column(name = "id")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		@Column(name = "userid")
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		
		@Column(name = "username")
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		
		@Column(name = "datatime")
		public String getDatatime() {
			return datatime;
		}
		public void setDatatime(String datatime) {
			this.datatime = datatime;
		}
		
		@Column(name = "method")
		public String getMethod() {
			return method;
		}
		public void setMethod(String method) {
			this.method = method;
		}
		
		
		 
	
	
}
