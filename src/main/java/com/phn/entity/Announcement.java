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
@Table(name = "t_announcement")
public class Announcement {
	@Id
	@GenericGenerator(name = "generator", strategy = "increment")
	@GeneratedValue(generator = "generator", strategy = GenerationType.TABLE)
	@Column(unique = true, nullable = false)
	private int id;
	@Column(length = 30)
	private String announcetitle;
	@Column(length = 300)
	private String announceinfo;


	public String getAnnouncetitle() {
		return announcetitle;
	}

	public void setAnnouncetitle(String announcetitle) {
		this.announcetitle = announcetitle;
	}

	public String getAnnounceinfo() {
		return announceinfo;
	}

	public void setAnnounceinfo(String announceinfo) {
		this.announceinfo = announceinfo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


}
