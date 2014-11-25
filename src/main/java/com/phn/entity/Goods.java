/**
 * 
 */
package com.phn.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name = "t_goods")
public class Goods {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length = 30)
	private String goodsname;
	@Column(length = 1000)
	private String goodsdescribe;
	@Temporal(TemporalType.TIMESTAMP)
	private Date goodstime;

	private int goodsstatus; // 用于表明物品是丢失物品还是招领物品的字段

	// @OneToOne
	// JPA注释： 一对一 关系
	// @JoinColumn(name = "picture_id")
	@Column(length = 50)
	private String goodspictures;

	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinColumn(name = "area_id")
	private Area goodsarea;

	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id")
	private Type goodstype;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "commentgoods", fetch = FetchType.EAGER)
	private Set<Comment> goodscomments = new HashSet<Comment>();

	// optional=true：可选，表示此对象可以没有，可以为null；false表示必须存在
	@ManyToOne(cascade = CascadeType.PERSIST , optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User goodsuser;

	public Goods(){
		this.goodsname="";
		this.goodspictures="";
		this.goodsdescribe="";
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getGoodsdescribe() {
		return goodsdescribe;
	}

	public void setGoodsdescribe(String goodsdescribe) {
		this.goodsdescribe = goodsdescribe;
	}

	public int getGoodsstatus() {
		return goodsstatus;
	}

	public void setGoodsstatus(int goodsstatus) {
		this.goodsstatus = goodsstatus;
	}

	public String getGoodspictures() {
		return goodspictures;
	}

	public void setGoodspictures(String goodspictures) {
		this.goodspictures = goodspictures;
	}

	public Set<Comment> getGoodscomments() {
		return goodscomments;
	}

	public void setGoodscomments(Set<Comment> goodscomments) {
		this.goodscomments = goodscomments;
	}

	public User getGoodsuser() {
		return goodsuser;
	}

	public void setGoodsuser(User goodsuser) {
		this.goodsuser = goodsuser;
	}

	public Date getGoodstime() {
		return goodstime;
	}

	public void setGoodstime(Date goodstime) {
		this.goodstime = goodstime;
	}

	public Area getGoodsarea() {
		return goodsarea;
	}

	public void setGoodsarea(Area goodsarea) {
		this.goodsarea = goodsarea;
	}

	public Type getGoodstype() {
		return goodstype;
	}

	public void setGoodstype(Type goodstype) {
		this.goodstype = goodstype;
	}

}
