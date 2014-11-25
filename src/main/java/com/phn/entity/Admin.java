/**
 * 
 */
package com.phn.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author PHN
 * @Email phnlove@163.com
 * @Date 2014-9-1
 */
@Entity
@Table(name = "t_admin")
public class Admin {
	/**
	 * 编号
	 */
	private int id;
	/**
	 * 管理员登录名
	 */
	private String adminname;
	/**
	 * 管理员登录密码
	 */
	private String adminpassword;
	/**
	 * 管理员上次登录时间
	 */
	private Date adminlastlogintime;
	/**
	 * 管理员上次登录IP
	 */
	private String adminlastloginIP;
	/**
	 * 管理员上次登录地点
	 */
	private String adminlastloginarea;

	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(length = 32)
	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	@Column(length = 32)
	public String getAdminpassword() {
		return adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getAdminlastlogintime() {
		return adminlastlogintime;
	}

	public void setAdminlastlogintime(Date adminlastlogintime) {
		this.adminlastlogintime = adminlastlogintime;
	}

	@Column(length = 20)
	public String getAdminlastloginIP() {
		return adminlastloginIP;
	}

	public void setAdminlastloginIP(String adminlastloginIP) {
		this.adminlastloginIP = adminlastloginIP;
	}

	@Column(length = 50)
	public String getAdminlastloginarea() {
		return adminlastloginarea;
	}

	public void setAdminlastloginarea(String adminlastloginarea) {
		this.adminlastloginarea = adminlastloginarea;
	}

}
