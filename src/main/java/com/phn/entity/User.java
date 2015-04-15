/**
 * 
 */
package com.phn.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author PHN
 * @Email phnlove@163.com
 * @Date 2014-9-1
 */
@Entity
@Table(name = "t_user")
public class User {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length = 16)
	private String username;
	@Column(length = 16)
	private String userpassword;
	@Column(length = 30)
	private String usernickname;
	@Column(length = 20)
	private String userphone;
	@Column(length = 20)
	private String userqq;
	@Column(length = 1)
	private int userstatus;

	// @OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REMOVE})
	// mappedBy="order": 指明Order类为双向关系维护端，负责外键的更新
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodsuser")
	private Set<Goods> usergoods = new HashSet<Goods>();

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "commentuser")
	private Set<Comment> usercomments = new HashSet<Comment>();

	public User(){
		this.usernickname="";
		this.userphone="";
		this.userqq="";
		this.userstatus=0;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUsernickname() {
		return usernickname;
	}

	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}


	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUserqq() {
		return userqq;
	}

	public void setUserqq(String userqq) {
		this.userqq = userqq;
	}

	public int getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(int userstatus) {
		this.userstatus = userstatus;
	}

	public Set<Goods> getUsergoods() {
		return usergoods;
	}

	public void setUsergoods(Set<Goods> usergoods) {
		this.usergoods = usergoods;
	}

	public Set<Comment> getUsercomments() {
		return usercomments;
	}

	public void setUsercomments(Set<Comment> usercomments) {
		this.usercomments = usercomments;
	}

}
