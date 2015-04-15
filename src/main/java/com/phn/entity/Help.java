/**
 * 
 */
package com.phn.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Entity
@Table(name = "t_help")
public class Help {
	private int id;
	/**
	 * 编号
	 */
	
	private String helpTitle;

	/**
	 * 帮助标题
	 */
	private String helpInfo;
	/**
	 * 帮助信息
	 */
	
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
	public String getHelpTitle() {
		return helpTitle;
	}
	
	
	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}
	
	@Column(length = 2000)
	public String getHelpInfo() {
		return helpInfo;
	}
	
	public void setHelpInfo(String helpInfo) {
		this.helpInfo = helpInfo;
	}
}