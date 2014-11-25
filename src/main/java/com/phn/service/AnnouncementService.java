/**
 * 
 */
package com.phn.service;

import java.util.List;

import com.phn.entity.Announcement;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
public interface AnnouncementService {
	/**
	 * 增加通告，传入通告标题和内容
	 * */
	public boolean addAnnouncement(Announcement announcement);
	
	
	/**
	 * 查找相应通告信息，传参通告标题
	 * */
	public Announcement findAnnouncement(String annotitle);
	
	public Announcement findAnno(int index);
	/**
	 * 删除相应通告，传入通告标题
	 * */
	public boolean delAnnouncement(String announcetitle);
	
	public boolean delAnno(int index);
	/**
	 * 修改通告内容，传入通告标题
	 * */
	public boolean updateAnnouncement(Announcement announcement);
	
	public int getRowCount();
	
	public List<Announcement> Getlistanno(int PageNow,int PageSize);


	/**
	 * @return
	 */
	public List<Announcement> GetIndex();


	/**
	 * @return
	 */
	public List<Announcement> GetAll();

}
