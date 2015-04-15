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

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.GenericGenerator;

/**
 * @author PHN
 * @Email phnlove@163.com
 * @Date 2014-9-1
 */
@Entity
@Table(name = "t_area")
public class Area {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length = 30)
	private String areaname;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodsarea")
	private Set<Goods> areagoods = new HashSet<Goods>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public Set<Goods> getAreagoods() {
		return areagoods;
	}

	public void setAreagoods(Set<Goods> areagoods) {
		this.areagoods = areagoods;
	}

}
