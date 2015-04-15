/**
 * 
 */
package com.phn.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author PHN
 * @Email phnlove@163.com
 * @Date 2014-9-2
 */
@Entity
@Table(name = "t_comment")
public class Comment {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length=1000)
	private String commentcontent;
	@Temporal(TemporalType.TIMESTAMP)
	private Date commenttime;

	// optional=true：可选，表示此对象可以没有，可以为null；false表示必须存在
	@ManyToOne(cascade =CascadeType.PERSIST, optional = false)
	@JoinColumn(name = "goods_id")
	private Goods commentgoods;

	// optional=true：可选，表示此对象可以没有，可以为null；false表示必须存在
	@ManyToOne(cascade = CascadeType.PERSIST, optional = false)
	@JoinColumn(name = "user_id")
	private User commentuser;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public Date getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(Date commenttime) {
		this.commenttime = commenttime;
	}

	public Goods getCommentgoods() {
		return commentgoods;
	}

	public void setCommentgoods(Goods commentgoods) {
		this.commentgoods = commentgoods;
	}

	public User getCommentuser() {
		return commentuser;
	}

	public void setCommentuser(User commentuser) {
		this.commentuser = commentuser;
	}

}
