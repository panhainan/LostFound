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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author 潘海南
 * @date 2014-9-17
 */
@Entity
@Table(name = "t_type")
public class Type {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length = 30)
	private String typename;
	// optional=true：可选，表示此对象可以没有，可以为null；false表示必须存在
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodstype")
	private Set<Goods> typegoods = new HashSet<Goods>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public Set<Goods> getTypegoods() {
		return typegoods;
	}

	public void setTypegoods(Set<Goods> typegoods) {
		this.typegoods = typegoods;
	}

}
